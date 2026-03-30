################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Application/accelerometer_sens.c \
../Application/display_driver.c \
../Application/light_sens.c \
../Application/lvgl_send.c \
../Application/my_detach.c \
../Application/myapp.c \
../Application/print.c \
../Application/sens_detect.c \
../Application/temp_sens.c 

OBJS += \
./Application/accelerometer_sens.o \
./Application/display_driver.o \
./Application/light_sens.o \
./Application/lvgl_send.o \
./Application/my_detach.o \
./Application/myapp.o \
./Application/print.o \
./Application/sens_detect.o \
./Application/temp_sens.o 

C_DEPS += \
./Application/accelerometer_sens.d \
./Application/display_driver.d \
./Application/light_sens.d \
./Application/lvgl_send.d \
./Application/my_detach.d \
./Application/myapp.d \
./Application/print.d \
./Application/sens_detect.d \
./Application/temp_sens.d 


# Each subdirectory must supply rules for building sources it contributes
Application/%.o Application/%.su Application/%.cyclo: ../Application/%.c Application/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Application -I"C:/Users/shafg/Desktop/Projects_Firmware/sensor_platform/Middlewares/lvgl_lib" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Application

clean-Application:
	-$(RM) ./Application/accelerometer_sens.cyclo ./Application/accelerometer_sens.d ./Application/accelerometer_sens.o ./Application/accelerometer_sens.su ./Application/display_driver.cyclo ./Application/display_driver.d ./Application/display_driver.o ./Application/display_driver.su ./Application/light_sens.cyclo ./Application/light_sens.d ./Application/light_sens.o ./Application/light_sens.su ./Application/lvgl_send.cyclo ./Application/lvgl_send.d ./Application/lvgl_send.o ./Application/lvgl_send.su ./Application/my_detach.cyclo ./Application/my_detach.d ./Application/my_detach.o ./Application/my_detach.su ./Application/myapp.cyclo ./Application/myapp.d ./Application/myapp.o ./Application/myapp.su ./Application/print.cyclo ./Application/print.d ./Application/print.o ./Application/print.su ./Application/sens_detect.cyclo ./Application/sens_detect.d ./Application/sens_detect.o ./Application/sens_detect.su ./Application/temp_sens.cyclo ./Application/temp_sens.d ./Application/temp_sens.o ./Application/temp_sens.su

.PHONY: clean-Application

