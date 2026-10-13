APPNAME=test

SRC=./src/*.c
GUIS=./res/gui/*.led

BUILD    := ./build
APP_DIR  := $(BUILD)/app

CC_LINUX=gcc
STRIP_LINUX=strip

CFLAGS= -Os -fdata-sections -ffunction-sections -Wall -Werror -Wl,--gc-sections

GTK_LIBS=-lgtk-x11-2.0 -lgdk-x11-2.0 -lgdk_pixbuf-2.0 -lpango-1.0 -lgobject-2.0 -lgmodule-2.0 -lglib-2.0 -lXext -lX11 -lm

INCS_LINUX32=-Ilib/linux32/iup/include
INCS_LINUX64=-Ilib/linux64/iup/include

LIBS_LINUX32=lib/linux32/iup/libiup.a $(GTK_LIBS)
LIBS_LINUX64=lib/linux64/iup/libiup.a $(GTK_LIBS)

all: linux32 linux64

.PHONY: dir ledc linux32 clean run execute release clean

dir:
	mkdir -p build

ledc:
	./tools/ledc -o res/gui_compiled_win.c $(GUIS)
	./tools/im_copy res/icon.ico res/icon.led LED
	patch res/icon.led res/led_patcher.patch
	./tools/ledc -o res/gui_compiled_linux.c $(GUIS) res/icon.led

linux32: dir ledc
	rm -rf build/$@
	mkdir -p build/$@
	$(CC_LINUX) -m32 res/gui_compiled_linux.c $(SRC) $(INCS_LINUX32) $(LIBS_LINUX32) $(CFLAGS) -o build/$@/$(APPNAME)

compile: dir ledc
	rm -rf build/app
	mkdir -p build/app
	$(CC_LINUX) res/gui_compiled_linux.c $(SRC) $(INCS_LINUX64) $(LIBS_LINUX64) $(CFLAGS) -o build/app/$(APPNAME)

execute:
	./$(APP_DIR)/$(APPNAME)

run: compile execute

release: compile
	$(STRIP_LINUX) build/app/$(APPNAME)

clean:
	rm -rf build/
	rm -f res/gui_compiled_win.c res/gui_compiled_linux.c res/icon.led
