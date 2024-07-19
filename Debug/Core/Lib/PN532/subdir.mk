################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Lib/PN532/PN532.c 

C_DEPS += \
./Core/Lib/PN532/PN532.d 

OBJS += \
./Core/Lib/PN532/PN532.o 


# Each subdirectory must supply rules for building sources it contributes
Core/Lib/PN532/%.o Core/Lib/PN532/%.su: ../Core/Lib/PN532/%.c Core/Lib/PN532/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Lib -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-Lib-2f-PN532

clean-Core-2f-Lib-2f-PN532:
	-$(RM) ./Core/Lib/PN532/PN532.d ./Core/Lib/PN532/PN532.o ./Core/Lib/PN532/PN532.su

.PHONY: clean-Core-2f-Lib-2f-PN532

