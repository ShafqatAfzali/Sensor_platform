################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl_lib/src/debugging/test/lv_test_display.c \
../Middlewares/lvgl_lib/src/debugging/test/lv_test_fs.c \
../Middlewares/lvgl_lib/src/debugging/test/lv_test_helpers.c \
../Middlewares/lvgl_lib/src/debugging/test/lv_test_indev.c \
../Middlewares/lvgl_lib/src/debugging/test/lv_test_indev_gesture.c \
../Middlewares/lvgl_lib/src/debugging/test/lv_test_screenshot_compare.c 

OBJS += \
./Middlewares/lvgl_lib/src/debugging/test/lv_test_display.o \
./Middlewares/lvgl_lib/src/debugging/test/lv_test_fs.o \
./Middlewares/lvgl_lib/src/debugging/test/lv_test_helpers.o \
./Middlewares/lvgl_lib/src/debugging/test/lv_test_indev.o \
./Middlewares/lvgl_lib/src/debugging/test/lv_test_indev_gesture.o \
./Middlewares/lvgl_lib/src/debugging/test/lv_test_screenshot_compare.o 

C_DEPS += \
./Middlewares/lvgl_lib/src/debugging/test/lv_test_display.d \
./Middlewares/lvgl_lib/src/debugging/test/lv_test_fs.d \
./Middlewares/lvgl_lib/src/debugging/test/lv_test_helpers.d \
./Middlewares/lvgl_lib/src/debugging/test/lv_test_indev.d \
./Middlewares/lvgl_lib/src/debugging/test/lv_test_indev_gesture.d \
./Middlewares/lvgl_lib/src/debugging/test/lv_test_screenshot_compare.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl_lib/src/debugging/test/%.o Middlewares/lvgl_lib/src/debugging/test/%.su Middlewares/lvgl_lib/src/debugging/test/%.cyclo: ../Middlewares/lvgl_lib/src/debugging/test/%.c Middlewares/lvgl_lib/src/debugging/test/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Application -I"C:/Users/shafg/Desktop/Projects_Firmware/sensor_platform/Middlewares/lvgl_lib" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl_lib-2f-src-2f-debugging-2f-test

clean-Middlewares-2f-lvgl_lib-2f-src-2f-debugging-2f-test:
	-$(RM) ./Middlewares/lvgl_lib/src/debugging/test/lv_test_display.cyclo ./Middlewares/lvgl_lib/src/debugging/test/lv_test_display.d ./Middlewares/lvgl_lib/src/debugging/test/lv_test_display.o ./Middlewares/lvgl_lib/src/debugging/test/lv_test_display.su ./Middlewares/lvgl_lib/src/debugging/test/lv_test_fs.cyclo ./Middlewares/lvgl_lib/src/debugging/test/lv_test_fs.d ./Middlewares/lvgl_lib/src/debugging/test/lv_test_fs.o ./Middlewares/lvgl_lib/src/debugging/test/lv_test_fs.su ./Middlewares/lvgl_lib/src/debugging/test/lv_test_helpers.cyclo ./Middlewares/lvgl_lib/src/debugging/test/lv_test_helpers.d ./Middlewares/lvgl_lib/src/debugging/test/lv_test_helpers.o ./Middlewares/lvgl_lib/src/debugging/test/lv_test_helpers.su ./Middlewares/lvgl_lib/src/debugging/test/lv_test_indev.cyclo ./Middlewares/lvgl_lib/src/debugging/test/lv_test_indev.d ./Middlewares/lvgl_lib/src/debugging/test/lv_test_indev.o ./Middlewares/lvgl_lib/src/debugging/test/lv_test_indev.su ./Middlewares/lvgl_lib/src/debugging/test/lv_test_indev_gesture.cyclo ./Middlewares/lvgl_lib/src/debugging/test/lv_test_indev_gesture.d ./Middlewares/lvgl_lib/src/debugging/test/lv_test_indev_gesture.o ./Middlewares/lvgl_lib/src/debugging/test/lv_test_indev_gesture.su ./Middlewares/lvgl_lib/src/debugging/test/lv_test_screenshot_compare.cyclo ./Middlewares/lvgl_lib/src/debugging/test/lv_test_screenshot_compare.d ./Middlewares/lvgl_lib/src/debugging/test/lv_test_screenshot_compare.o ./Middlewares/lvgl_lib/src/debugging/test/lv_test_screenshot_compare.su

.PHONY: clean-Middlewares-2f-lvgl_lib-2f-src-2f-debugging-2f-test

