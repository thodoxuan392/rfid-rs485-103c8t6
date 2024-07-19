################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/Tp/rs485.c 

C_DEPS += \
./Core/Src/Tp/rs485.d 

OBJS += \
./Core/Src/Tp/rs485.o 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/Tp/%.o Core/Src/Tp/%.su: ../Core/Src/Tp/%.c Core/Src/Tp/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Lib -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-Tp

clean-Core-2f-Src-2f-Tp:
	-$(RM) ./Core/Src/Tp/rs485.d ./Core/Src/Tp/rs485.o ./Core/Src/Tp/rs485.su

.PHONY: clean-Core-2f-Src-2f-Tp

