################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx.c \
../Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_arc.c \
../Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_border.c \
../Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_fill.c \
../Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_img.c \
../Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_label.c \
../Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_layer.c \
../Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_line.c \
../Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_stm32_hal.c \
../Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_triangle.c \
../Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_utils.c \
../Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_vector.c \
../Middlewares/lvgl_lib/src/draw/nema_gfx/lv_nema_gfx_path.c 

OBJS += \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx.o \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_arc.o \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_border.o \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_fill.o \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_img.o \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_label.o \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_layer.o \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_line.o \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_stm32_hal.o \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_triangle.o \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_utils.o \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_vector.o \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_nema_gfx_path.o 

C_DEPS += \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx.d \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_arc.d \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_border.d \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_fill.d \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_img.d \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_label.d \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_layer.d \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_line.d \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_stm32_hal.d \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_triangle.d \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_utils.d \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_vector.d \
./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_nema_gfx_path.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl_lib/src/draw/nema_gfx/%.o Middlewares/lvgl_lib/src/draw/nema_gfx/%.su Middlewares/lvgl_lib/src/draw/nema_gfx/%.cyclo: ../Middlewares/lvgl_lib/src/draw/nema_gfx/%.c Middlewares/lvgl_lib/src/draw/nema_gfx/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Application -I"C:/Users/shafg/Desktop/Projects_Firmware/sensor_platform/Middlewares/lvgl_lib" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl_lib-2f-src-2f-draw-2f-nema_gfx

clean-Middlewares-2f-lvgl_lib-2f-src-2f-draw-2f-nema_gfx:
	-$(RM) ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx.cyclo ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx.d ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx.o ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx.su ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_arc.cyclo ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_arc.d ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_arc.o ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_arc.su ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_border.cyclo ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_border.d ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_border.o ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_border.su ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_fill.cyclo ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_fill.d ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_fill.o ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_fill.su ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_img.cyclo ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_img.d ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_img.o ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_img.su ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_label.cyclo ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_label.d ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_label.o ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_label.su ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_layer.cyclo ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_layer.d ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_layer.o ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_layer.su ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_line.cyclo ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_line.d ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_line.o ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_line.su ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_stm32_hal.cyclo ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_stm32_hal.d ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_stm32_hal.o ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_stm32_hal.su ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_triangle.cyclo ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_triangle.d ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_triangle.o ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_triangle.su ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_utils.cyclo ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_utils.d ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_utils.o ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_utils.su ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_vector.cyclo ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_vector.d ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_vector.o ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_draw_nema_gfx_vector.su ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_nema_gfx_path.cyclo ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_nema_gfx_path.d ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_nema_gfx_path.o ./Middlewares/lvgl_lib/src/draw/nema_gfx/lv_nema_gfx_path.su

.PHONY: clean-Middlewares-2f-lvgl_lib-2f-src-2f-draw-2f-nema_gfx

