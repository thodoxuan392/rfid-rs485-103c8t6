################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Lib/HX711/HX711.cpp 

OBJS += \
./Lib/HX711/HX711.o 

CPP_DEPS += \
./Lib/HX711/HX711.d 


# Each subdirectory must supply rules for building sources it contributes
Lib/HX711/%.o Lib/HX711/%.su: ../Lib/HX711/%.cpp Lib/HX711/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m3 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I../Lib -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Lib-2f-HX711

clean-Lib-2f-HX711:
	-$(RM) ./Lib/HX711/HX711.d ./Lib/HX711/HX711.o ./Lib/HX711/HX711.su

.PHONY: clean-Lib-2f-HX711

