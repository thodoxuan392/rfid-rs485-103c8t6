################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/Hal/clock.c \
../Core/Src/Hal/gpio.c \
../Core/Src/Hal/spi.c \
../Core/Src/Hal/timer.c \
../Core/Src/Hal/uart.c \
../Core/Src/Hal/watchdog.c 

C_DEPS += \
./Core/Src/Hal/clock.d \
./Core/Src/Hal/gpio.d \
./Core/Src/Hal/spi.d \
./Core/Src/Hal/timer.d \
./Core/Src/Hal/uart.d \
./Core/Src/Hal/watchdog.d 

OBJS += \
./Core/Src/Hal/clock.o \
./Core/Src/Hal/gpio.o \
./Core/Src/Hal/spi.o \
./Core/Src/Hal/timer.o \
./Core/Src/Hal/uart.o \
./Core/Src/Hal/watchdog.o 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/Hal/%.o Core/Src/Hal/%.su: ../Core/Src/Hal/%.c Core/Src/Hal/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Lib -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-Hal

clean-Core-2f-Src-2f-Hal:
	-$(RM) ./Core/Src/Hal/clock.d ./Core/Src/Hal/clock.o ./Core/Src/Hal/clock.su ./Core/Src/Hal/gpio.d ./Core/Src/Hal/gpio.o ./Core/Src/Hal/gpio.su ./Core/Src/Hal/spi.d ./Core/Src/Hal/spi.o ./Core/Src/Hal/spi.su ./Core/Src/Hal/timer.d ./Core/Src/Hal/timer.o ./Core/Src/Hal/timer.su ./Core/Src/Hal/uart.d ./Core/Src/Hal/uart.o ./Core/Src/Hal/uart.su ./Core/Src/Hal/watchdog.d ./Core/Src/Hal/watchdog.o ./Core/Src/Hal/watchdog.su

.PHONY: clean-Core-2f-Src-2f-Hal

