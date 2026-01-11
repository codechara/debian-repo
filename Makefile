.PHONY: all package clean
all: output package

output:
	mkdir output

package:
	dpkg-deb --build files output/firmware.deb

clean:
	rm -rf output
