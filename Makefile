APPNAME = Cura-CLI-Wrapper
VERSION = 0.0.7
DEST = /usr/local/bin
DEST_SETTINGS = /usr/share

all::
	@echo "make requirements install install-default install-user-defaults deinstall tests clean edit push pull change backup"

requirements::
	sudo cpan Time::HiRes JSON
	sudo apt -y install cura-engine

install::	install-app install-defaults

install-app::
	sudo cp cura-slicer ${DEST}/
	mkdir -p ~/.config/cura-slicer/ && touch ~/.config/cura-slicer/base.ini 

install-defaults::
	sudo mkdir -p ${DEST_SETTINGS}/cura-slicer/
	cd settings/; tar cfv - . | (cd ${DEST_SETTINGS}/cura-slicer/; sudo tar xf -)

deinstall::
	sudo rm -rf ${DEST}/cura-slicer ${DEST_SETTINGS}/cura-slicer/

tests::
	cd tests; make

clean::
	cd tests; make clean

# -- dev only

edit::
	dee4 cura-slicer Makefile README.md LICENSE settings/*.ini tests/Makefile

push::
	git push -u origin master

pull::
	git pull

change::
	git commit -am "..."

backup::
	cd ..; tar cfvz ~/Backup/${APPNAME}-${VERSION}.tar.gz ${APPNAME}; scp ~/Backup/${APPNAME}-${VERSION}.tar.gz backup:Backup/

