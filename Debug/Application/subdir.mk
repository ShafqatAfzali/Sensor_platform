################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Application/accelerometer_sens.c \
../Application/light_sens.c \
../Application/myapp.c \
../Application/print.c \
../Application/sens_detect.c 

OBJS += \
./Application/accelerometer_sens.o \
./Application/light_sens.o \
./Application/myapp.o \
./Application/print.o \
./Application/sens_detect.o 

C_DEPS += \
./Application/accelerometer_sens.d \
./Application/light_sens.d \
./Application/myapp.d \
./Application/print.d \
./Application/sens_detect.d 


# Each subdirectory must supply rules for building sources it contributes
Application/%.o Application/%.su Application/%.cyclo: ../Application/%.c Application/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Application -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Application

clean-Application:
	-$(RM) ./Application/accelerometer_sens.cyclo ./Application/accelerometer_sens.d ./Application/accelerometer_sens.o ./Application/accelerometer_sens.su ./Application/light_sens.cyclo ./Application/light_sens.d ./Application/light_sens.o ./Application/light_sens.su ./Application/myapp.cyclo ./Application/myapp.d ./Application/myapp.o ./Application/myapp.su ./Application/print.cyclo ./Application/print.d ./Application/print.o ./Application/print.su ./Application/sens_detect.cyclo ./Application/sens_detect.d ./Application/sens_detect.o ./Application/sens_detect.su

.PHONY: clean-Application

