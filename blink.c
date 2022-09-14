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
#include "message.h"

#ifdef RASPBERRYPI_PICO_W
#include "pico/cyw43_arch.h"
#endif

void blink_pin_forever(PIO pio, uint sm, uint offset, uint pin, unsigned char *message);

#define LED_PIN 25

int main_on() {
#ifdef RASPBERRYPI_PICO_W
    cyw43_arch_gpio_put(CYW43_WL_GPIO_LED_PIN, 1);
#else
    gpio_put(LED_PIN, 1);
#endif
}

int main_off() {
#ifdef RASPBERRYPI_PICO_W
    cyw43_arch_gpio_put(CYW43_WL_GPIO_LED_PIN, 0);
#else
    gpio_put(LED_PIN, 0);
#endif
}

int main() {
    stdio_init_all();
    set_sys_clock_khz(250000, true);
    // set_sys_clock_khz(290400, true); // required for VHF, doesn't work on Pico W apparently
    setup_default_uart();

    sleep_ms(12000); // wait for a bit before starting the beacon
    printf("\nPicoW-CW-Beacon - VU3CER and K1te@piRshared.org - September 2022\n");
    sleep_ms(3000);

#ifdef RASPBERRYPI_PICO_W
    cyw43_arch_init();
    printf("Wireless initialized!\n");
#endif

    PIO pio = pio0;
    uint offset = pio_add_program(pio, &blink_program);
    printf("Loaded program at %d\n", offset);

    gpio_set_drive_strength(2, GPIO_DRIVE_STRENGTH_12MA);

    blink_pin_forever(pio, 0, offset, 2, message);
}

// https://morsecode.world/international/timing.html
// http://www.kent-engineers.com/codespeed.htm
// 13 words-per-minute is one element every 92.31 milliseconds.
void blink_pin_forever(PIO pio, uint sm, uint offset, uint pin, unsigned char *message) {
    blink_program_init(pio, sm, offset, pin, message);
    pio_sm_set_enabled(pio, sm, true);
}
