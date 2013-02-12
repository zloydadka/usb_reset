CC=gcc
EXECUTABLE=reset_usb_device
SOURCES=reset_usb_device.c
prefix=/usr/local

all:
	mkdir -p build
	$(CC) $(SOURCES) -o build/$(EXECUTABLE)

	sed -e 's/USB_RESET_CMD_PATH/$(shell (echo $(prefix) | sed -e 's/\//\\\//g'))\/bin\/$(EXECUTABLE)/g' reset_usb_keyboards.sh.template > build/reset_usb_keyboards.sh

install: 
	install -m 0755 build/$(EXECUTABLE) $(prefix)/bin
	install -m 0755 build/reset_usb_keyboards.sh $(prefix)/bin

clean:
	rm -fr build
