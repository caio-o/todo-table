SOURCE_DIRS:=./src/
INCLUDE_DIRS:=./includes/
BUILD_DIR:=./build
SOURCE_FILES:=$(shell find $(SRC_DIRS) -name '*.c')
OBJ_FILES:=$(SOURCE_FILES:%=$(BUILD_DIR)/%.o)

PROG_NAME:=ttable
EXEC_FILE:=$(BUILD_DIR)/$(PROG_NAME)

INCLUDE_FLAGS:=$(addprefix -I,$(INCLUDE_DIRS))

.PHONY: all
all: $(BUILD_DIR)/$(PROG_NAME)
	printf "Building ttable...\n"


$(BUILD_DIR)/$(PROG_NAME): $(OBJ_FILES)
	gcc -std=c99 -pedantic -Wall -Werror $(OBJ_FILES) -o $(PROG_NAME)


$(OBJ_FILES): 
	mkdir -p $(dir $(OBJ_FILES))
	gcc -std=c99 -pedantic -Wall -Werror -c $(SOURCE_FILES) -o $(OBJ_FILES) 

.PHONY: clean
clean:
	rm $(PROG_NAME)
	rm -r $(BUILD_DIR)

