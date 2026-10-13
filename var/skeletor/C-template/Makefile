#
# **************************************************************
# *                                                            *
# *                Simple C Makefile Template                  *
# *                                                            *
# **************************************************************
#

.PHONY: check-syntax

CXX      := -gcc
CXXFLAGS := -pedantic-errors -Wall -Wextra -Werror
LDFLAGS  := -L/usr/lib -lm
BUILD    := ./build
OBJ_DIR  := $(BUILD)/objects
APP_DIR  := $(BUILD)/apps
TARGET   := program
INCLUDE  := -Iinclude/ -I /usr/include
SRC      :=                      \
   $(wildcard src/*.c)         \

OBJECTS  := $(SRC:%.c=$(OBJ_DIR)/%.o)

compile: build $(APP_DIR)/$(TARGET)

$(OBJ_DIR)/%.o: %.c
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) $(INCLUDE) -c $< -o $@ $(LDFLAGS)

$(APP_DIR)/$(TARGET): $(OBJECTS)
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -o $(APP_DIR)/$(TARGET) $^ $(LDFLAGS)

execute:
	./$(APP_DIR)/$(TARGET)

build:
	@mkdir -p $(APP_DIR)
	@mkdir -p $(OBJ_DIR)

debug: CXXFLAGS += -DDEBUG -g
debug: compile

release: CXXFLAGS += -O2
release: compile

clean:
	-@rm -rvf $(OBJ_DIR)/*
	-@rm -rvf $(APP_DIR)/*

check-syntax:
	gcc $(INCLUDE) -o /dev/null -S ${CHK_SOURCES} || true

run: clean compile execute
