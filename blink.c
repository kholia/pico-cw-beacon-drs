/**
 * Copyright (c) 2020 Raspberry Pi (Trading) Ltd.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include <stdio.h>

#include "pico/stdlib.h"
#include "hardware/pio.h"
#include "hardware/clocks.h"
#include "blink.pio.h"

#include "morse.h"
#include "message.h"

#define BUF_LEN 512

char mor[BUF_LEN];

void blink_pin_forever(PIO pio, uint sm, uint offset, uint pin, uint8_t *code);

int main() {
    stdio_init_all();
    // set_sys_clock_khz(250000, true);
    set_sys_clock_khz(290400, true);
    setup_default_uart();

    memset(mor, 0, BUF_LEN);
    str_to_morse_str(message, mor, BUF_LEN);

    PIO pio = pio0;
    uint offset = pio_add_program(pio, &blink_program);
    printf("Loaded program at %d\n", offset);

    blink_pin_forever(pio, 0, offset, 2, (uint8_t*) mor);
}

// https://morsecode.world/international/timing.html
// http://www.kent-engineers.com/codespeed.htm
// 13 words-per-minute is one element every 92.31 milliseconds.
void blink_pin_forever(PIO pio, uint sm, uint offset, uint pin, uint8_t *code) {
    blink_program_init(pio, sm, offset, pin, code);
    pio_sm_set_enabled(pio, sm, true);
}
