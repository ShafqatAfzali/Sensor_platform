################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_egl.c \
../Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_keyboard.c \
../Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_mouse.c \
../Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_mousewheel.c \
../Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_sw.c \
../Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_texture.c \
../Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_window.c 

OBJS += \
./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_egl.o \
./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_keyboard.o \
./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_mouse.o \
./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_mousewheel.o \
./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_sw.o \
./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_texture.o \
./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_window.o 

C_DEPS += \
./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_egl.d \
./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_keyboard.d \
./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_mouse.d \
./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_mousewheel.d \
./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_sw.d \
./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_texture.d \
./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_window.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl_lib/src/drivers/sdl/%.o Middlewares/lvgl_lib/src/drivers/sdl/%.su Middlewares/lvgl_lib/src/drivers/sdl/%.cyclo: ../Middlewares/lvgl_lib/src/drivers/sdl/%.c Middlewares/lvgl_lib/src/drivers/sdl/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Application -I"C:/Users/shafg/Desktop/Projects_Firmware/sensor_platform/Middlewares/lvgl_lib" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl_lib-2f-src-2f-drivers-2f-sdl

clean-Middlewares-2f-lvgl_lib-2f-src-2f-drivers-2f-sdl:
	-$(RM) ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_egl.cyclo ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_egl.d ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_egl.o ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_egl.su ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_keyboard.cyclo ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_keyboard.d ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_keyboard.o ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_keyboard.su ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_mouse.cyclo ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_mouse.d ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_mouse.o ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_mouse.su ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_mousewheel.cyclo ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_mousewheel.d ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_mousewheel.o ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_mousewheel.su ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_sw.cyclo ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_sw.d ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_sw.o ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_sw.su ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_texture.cyclo ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_texture.d ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_texture.o ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_texture.su ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_window.cyclo ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_window.d ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_window.o ./Middlewares/lvgl_lib/src/drivers/sdl/lv_sdl_window.su

.PHONY: clean-Middlewares-2f-lvgl_lib-2f-src-2f-drivers-2f-sdl

