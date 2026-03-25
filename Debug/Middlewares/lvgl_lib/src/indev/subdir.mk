################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl_lib/src/indev/lv_gridnav.c \
../Middlewares/lvgl_lib/src/indev/lv_indev.c \
../Middlewares/lvgl_lib/src/indev/lv_indev_gesture.c \
../Middlewares/lvgl_lib/src/indev/lv_indev_scroll.c 

OBJS += \
./Middlewares/lvgl_lib/src/indev/lv_gridnav.o \
./Middlewares/lvgl_lib/src/indev/lv_indev.o \
./Middlewares/lvgl_lib/src/indev/lv_indev_gesture.o \
./Middlewares/lvgl_lib/src/indev/lv_indev_scroll.o 

C_DEPS += \
./Middlewares/lvgl_lib/src/indev/lv_gridnav.d \
./Middlewares/lvgl_lib/src/indev/lv_indev.d \
./Middlewares/lvgl_lib/src/indev/lv_indev_gesture.d \
./Middlewares/lvgl_lib/src/indev/lv_indev_scroll.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl_lib/src/indev/%.o Middlewares/lvgl_lib/src/indev/%.su Middlewares/lvgl_lib/src/indev/%.cyclo: ../Middlewares/lvgl_lib/src/indev/%.c Middlewares/lvgl_lib/src/indev/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Application -I"C:/Users/shafg/Desktop/Projects_Firmware/sensor_platform/Middlewares/lvgl_lib" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl_lib-2f-src-2f-indev

clean-Middlewares-2f-lvgl_lib-2f-src-2f-indev:
	-$(RM) ./Middlewares/lvgl_lib/src/indev/lv_gridnav.cyclo ./Middlewares/lvgl_lib/src/indev/lv_gridnav.d ./Middlewares/lvgl_lib/src/indev/lv_gridnav.o ./Middlewares/lvgl_lib/src/indev/lv_gridnav.su ./Middlewares/lvgl_lib/src/indev/lv_indev.cyclo ./Middlewares/lvgl_lib/src/indev/lv_indev.d ./Middlewares/lvgl_lib/src/indev/lv_indev.o ./Middlewares/lvgl_lib/src/indev/lv_indev.su ./Middlewares/lvgl_lib/src/indev/lv_indev_gesture.cyclo ./Middlewares/lvgl_lib/src/indev/lv_indev_gesture.d ./Middlewares/lvgl_lib/src/indev/lv_indev_gesture.o ./Middlewares/lvgl_lib/src/indev/lv_indev_gesture.su ./Middlewares/lvgl_lib/src/indev/lv_indev_scroll.cyclo ./Middlewares/lvgl_lib/src/indev/lv_indev_scroll.d ./Middlewares/lvgl_lib/src/indev/lv_indev_scroll.o ./Middlewares/lvgl_lib/src/indev/lv_indev_scroll.su

.PHONY: clean-Middlewares-2f-lvgl_lib-2f-src-2f-indev

