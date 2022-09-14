// Credits: https://forums.raspberrypi.com/ (hippy)

#include "stdio.h"
#include "stdint.h"

// Set DUTY to zero to maximise 'top'
// Set DUTY to 1 for maximum frequency accuracy
// Set DUTY to what the max duty value is, for example 100 for 0 to 100

#define DUTY    1                   // Maximum accuracy

#define TOP_MAX 65534
#define DIV_MIN ((0x01 << 4) + 0x0) // 0x01.0
#define DIV_MAX ((0xFF << 4) + 0xF) // 0xFF.F
// #define CLOCK   125000000
#define CLOCK   250000000

int Better(uint32_t clock, float freq, uint32_t duty,
           uint32_t now_top, uint32_t now_div,
           uint32_t try_top, uint32_t try_div) {
  // If what we are trying cannot be achieved it's not better
  if ((try_top == 0) || (try_top > (TOP_MAX + 1))) {
    return 0;
  }
  // If we haven't got anything yet this must be better
  if (now_top == 0) {
    return 1;
  }
  // If we don't have enough steps we aren't better unless there are
  // more steps than we currently have
  if ((try_top < (duty - 1)) && (try_top <= now_top)) {
    return 0;
  }
  // Determine if what we already have is good enough
  float now_frq = (float)(clock << 4) / now_div / (now_top + 1);
  float now_gap = now_frq - freq;
  //  Using 'abs' doesn't work on a Pi, screws the outcome, so do it manually
  if (now_gap < 0.0) {
    now_gap = -now_gap;
  }
  // If good enough then nothing is better
  if (now_gap == 0.0) { // or '<= 0.0001' if we don't mind some inaccuracy
    return 0;
  }
  // Determine if what we are trying is better than what we have
  float try_frq = (float)(clock << 4) / try_div / (try_top + 1);
  float try_gap = try_frq - freq;
  //  Using 'abs' doesn't work on a Pi, screws the outcome, so do it manually
  if (try_gap < 0.0) {
    try_gap = -try_gap;
  }
  // We judge best on percentage error of output frequency to wanted
  float now_pct = now_gap * 100.0 / freq;
  float try_pct = try_gap * 100.0 / freq;
  /*
    if (try_pct < now_pct) {
      printf("%d %x %f better than %d %x %f\n", try_top, try_div, try_frq,
                                                now_top, now_div, now_frq);
    }
  */
  return try_pct < now_pct;
}

void SetPwmFreq(float freq, uint32_t duty) {
  uint32_t clock = CLOCK;
  uint32_t period;
  // Determine a div to get the frequency we want
  uint32_t div = (clock << 4) / freq / (TOP_MAX + 1);
  // e cannot use a div less than the minimum
  if (div < DIV_MIN) {
    div = DIV_MIN;
  }
  // If duty is zero then we want something with the highest top value
  // and don't care if the frequency is inaccurate.
  if (duty == 0) {
    // Determine what period the chosen div gives us
    period = (clock << 4) / div / freq;
    // We may have had a rounding error when calculating div so it may
    // be lower than it should be, which in turn causes the period to
    // be higher than it should be, higher than can be used. In which
    // case we increase the div until the period becomes usable.
    while ((period > (TOP_MAX + 1)) && (div <= DIV_MAX)) {
      period = (clock << 4) / ++div / freq;
    }
  } else {
    // We have a non-zero duty value so we are after frequency accuracy
    // but still want to have as many steps as duty has specified.
    uint32_t top = 0;  // Force the first 'Better()' to be true
    uint32_t try_top;
    uint32_t try_div = div;
    while ( try_div < DIV_MAX) {
      // Determine the top our div would give us
      try_top = ((clock << 4) / try_div / freq) - 1;
      // Try with a perfect or rounded-down top
      if (Better(clock, freq, duty, top, div, try_top, try_div)) {
        top = try_top;
        div = try_div;
      }
      // Try with a rounded-up top
      if (Better(clock, freq, duty, top, div, try_top + 1, try_div)) {
        top = try_top + 1;
        div = try_div;
      }
      try_div++;
    }
    // Rest of the code uses period so provide it
    period = top + 1;
  }
  // Check if the result is usable
  if (period <= 1) {
    printf("Freq below is too high ...\n");
  } else if (div > DIV_MAX) {
    printf("Freq below is too low ...\n");
  }
  // Determine what output frequency that will generate
  float out = (float)(clock << 4) / div / period;
  // Determine how much error that gives us
  float err = (out - freq) * 100.0 / freq;
  // Report the results
  printf("Freq = %f\t",         freq);
  printf("Top = %u\t",          period - 1);
  printf("Div = 0x%02X.%X\t",   div >> 4, div & 0xF);
  printf("Out = %f\t",          out);
  printf("Err = %f%%\n",        err);
}

int main(void) {
  uint32_t hz = CLOCK;

  // For FM modulation
  SetPwmFreq((float)14000000, DUTY);
  SetPwmFreq((float)14010000, DUTY);

  SetPwmFreq((float)50, DUTY);

  SetPwmFreq((float)1000.0, DUTY);
  SetPwmFreq((float)1006.25, DUTY);
  SetPwmFreq((float)1012.50, DUTY);
  SetPwmFreq((float)1018.75, DUTY);
  SetPwmFreq((float)1025.00, DUTY);
  SetPwmFreq((float)1031.25, DUTY);
  SetPwmFreq((float)1037.50, DUTY);
  SetPwmFreq((float)1043.75, DUTY);

  while (hz > 7) {
    if (hz <= 16) {
      SetPwmFreq((float)hz, DUTY);
      hz = hz - 1;
    } else {
      SetPwmFreq((float)((hz >> 1) * 3), DUTY);
      SetPwmFreq((float)hz, DUTY);
      hz = hz >> 1;
    }
  }
  // SetPwmFreq((float)91551, DUTY);
}
