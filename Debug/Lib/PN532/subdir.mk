################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Lib/PN532/PN532.c 

C_DEPS += \
./Lib/PN532/PN532.d 

OBJS += \
./Lib/PN532/PN532.o 


# Each subdirectory must supply rules for building sources it contributes
Lib/PN532/%.o Lib/PN532/%.su: ../Lib/PN532/%.c Lib/PN532/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Lib -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Lib-2f-PN532

clean-Lib-2f-PN532:
	-$(RM) ./Lib/PN532/PN532.d ./Lib/PN532/PN532.o ./Lib/PN532/PN532.su

.PHONY: clean-Lib-2f-PN532

