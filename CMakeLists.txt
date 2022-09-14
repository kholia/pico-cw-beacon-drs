cmake_minimum_required(VERSION 3.13)
include(pico_sdk_import.cmake)

project(pio_blink C CXX ASM)
project(pio_blink VERSION 0.1.0)

pico_sdk_init()

add_executable(pio_blink)

# Overclocking hacks
pico_define_boot_stage2(slower_boot2 ${PICO_DEFAULT_BOOT_STAGE2_FILE})
target_compile_definitions(slower_boot2 PRIVATE PICO_FLASH_SPI_CLKDIV=4)
pico_set_boot_stage2(pio_blink slower_boot2)

# by default the header is generated into the build dir
pico_generate_pio_header(pio_blink ${CMAKE_CURRENT_LIST_DIR}/blink.pio)
# however, alternatively you can choose to generate it somewhere else (in this case in the source tree for check in)
#pico_generate_pio_header(pio_blink ${CMAKE_CURRENT_LIST_DIR}/blink.pio OUTPUT_DIR ${CMAKE_CURRENT_LIST_DIR})

target_sources(pio_blink PRIVATE blink.c)
if(DEFINED WIRELESS)
target_link_libraries(pio_blink PRIVATE pico_stdlib hardware_pio pico_cyw43_arch_lwip_threadsafe_background)
else()
target_link_libraries(pio_blink PRIVATE pico_stdlib hardware_pio)
endif()

pico_add_extra_outputs(pio_blink)
pico_enable_stdio_usb(pio_blink 1)
pico_enable_stdio_uart(pio_blink 1)
pico_add_extra_outputs(pio_blink)
