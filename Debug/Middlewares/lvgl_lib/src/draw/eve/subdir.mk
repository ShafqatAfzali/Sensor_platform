################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve.c \
../Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_arc.c \
../Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_fill.c \
../Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_image.c \
../Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_letter.c \
../Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_line.c \
../Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_ram_g.c \
../Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_triangle.c \
../Middlewares/lvgl_lib/src/draw/eve/lv_eve.c 

OBJS += \
./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve.o \
./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_arc.o \
./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_fill.o \
./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_image.o \
./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_letter.o \
./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_line.o \
./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_ram_g.o \
./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_triangle.o \
./Middlewares/lvgl_lib/src/draw/eve/lv_eve.o 

C_DEPS += \
./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve.d \
./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_arc.d \
./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_fill.d \
./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_image.d \
./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_letter.d \
./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_line.d \
./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_ram_g.d \
./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_triangle.d \
./Middlewares/lvgl_lib/src/draw/eve/lv_eve.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/lvgl_lib/src/draw/eve/%.o Middlewares/lvgl_lib/src/draw/eve/%.su Middlewares/lvgl_lib/src/draw/eve/%.cyclo: ../Middlewares/lvgl_lib/src/draw/eve/%.c Middlewares/lvgl_lib/src/draw/eve/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Application -I"C:/Users/shafg/Desktop/Projects_Firmware/sensor_platform/Middlewares/lvgl_lib" -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-lvgl_lib-2f-src-2f-draw-2f-eve

clean-Middlewares-2f-lvgl_lib-2f-src-2f-draw-2f-eve:
	-$(RM) ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve.cyclo ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve.d ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve.o ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve.su ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_arc.cyclo ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_arc.d ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_arc.o ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_arc.su ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_fill.cyclo ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_fill.d ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_fill.o ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_fill.su ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_image.cyclo ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_image.d ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_image.o ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_image.su ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_letter.cyclo ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_letter.d ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_letter.o ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_letter.su ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_line.cyclo ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_line.d ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_line.o ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_line.su ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_ram_g.cyclo ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_ram_g.d ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_ram_g.o ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_ram_g.su ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_triangle.cyclo ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_triangle.d ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_triangle.o ./Middlewares/lvgl_lib/src/draw/eve/lv_draw_eve_triangle.su ./Middlewares/lvgl_lib/src/draw/eve/lv_eve.cyclo ./Middlewares/lvgl_lib/src/draw/eve/lv_eve.d ./Middlewares/lvgl_lib/src/draw/eve/lv_eve.o ./Middlewares/lvgl_lib/src/draw/eve/lv_eve.su

.PHONY: clean-Middlewares-2f-lvgl_lib-2f-src-2f-draw-2f-eve

