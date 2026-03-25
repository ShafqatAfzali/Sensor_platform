################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_debug.c \
../Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_driver.c \
../Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_egl.c \
../Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_glfw.c \
../Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_texture.c 

OBJS += \
./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_debug.o \
./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_driver.o \
./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_egl.o \
./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_glfw.o \
./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_texture.o 

C_DEPS += \
./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_debug.d \
./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_driver.d \
./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_egl.d \
./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_glfw.d \
./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_texture.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl_lib/src/drivers/opengles/%.o Middlewares/lvgl_lib/src/drivers/opengles/%.su Middlewares/lvgl_lib/src/drivers/opengles/%.cyclo: ../Middlewares/lvgl_lib/src/drivers/opengles/%.c Middlewares/lvgl_lib/src/drivers/opengles/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Application -I"C:/Users/shafg/Desktop/Projects_Firmware/sensor_platform/Middlewares/lvgl_lib" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl_lib-2f-src-2f-drivers-2f-opengles

clean-Middlewares-2f-lvgl_lib-2f-src-2f-drivers-2f-opengles:
	-$(RM) ./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_debug.cyclo ./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_debug.d ./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_debug.o ./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_debug.su ./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_driver.cyclo ./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_driver.d ./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_driver.o ./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_driver.su ./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_egl.cyclo ./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_egl.d ./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_egl.o ./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_egl.su ./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_glfw.cyclo ./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_glfw.d ./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_glfw.o ./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_glfw.su ./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_texture.cyclo ./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_texture.d ./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_texture.o ./Middlewares/lvgl_lib/src/drivers/opengles/lv_opengles_texture.su

.PHONY: clean-Middlewares-2f-lvgl_lib-2f-src-2f-drivers-2f-opengles

