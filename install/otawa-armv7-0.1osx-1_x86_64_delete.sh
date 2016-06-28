#!/bin/sh

############################################################
#                                                          #
# run: $sudo ./delete.sh to remove the OTAWA ARMv7 package #
#                                                          #
############################################################

OTAWAFILES="\
/usr/local/bin/calipso \
/usr/local/bin/calipso_stat \
/usr/local/bin/ctoxml \
/usr/local/bin/dumpcfg \
/usr/local/bin/elm-plugin \
/usr/local/bin/gel-file \
/usr/local/bin/gel-im \
/usr/local/bin/gel-line \
/usr/local/bin/gel-prog \
/usr/local/bin/gel-sect \
/usr/local/bin/gel-sym \ \
/usr/local/bin/mergec \
/usr/local/bin/mkff \
/usr/local/bin/mkffx \
/usr/local/bin/odec \
/usr/local/bin/odfa \
/usr/local/bin/odisasm \
/usr/local/bin/oipet \
/usr/local/bin/opcg \
/usr/local/bin/orange \
/usr/local/bin/ostat \
/usr/local/bin/oswa \
/usr/local/bin/otawa-config \
/usr/local/bin/otawa-gen.py \
/usr/local/bin/owcet \
/usr/local/bin/owcet2 \
/usr/local/bin/printc \
/usr/local/include/elm  \
/usr/local/include/gel \
/usr/local/include/otawa \
/usr/local/lib/libelm.dylib \
/usr/local/lib/libgel.dylib \
/usr/local/lib/libgel_arch_20.so \
/usr/local/lib/libgel_arch_40.so \
/usr/local/lib/libgel_debug.dylib \
/usr/local/lib/libgel_dwarf.dylib \
/usr/local/lib/libgel_ppc.dylib \
/usr/local/lib/libocpp.dylib \
/usr/local/lib/libodisplay.dylib \
/usr/local/lib/libotawa.dylib \
/usr/local/lib/ocaml/site-lib/frontc \
/usr/local/lib/otawa \
/usr/local/share/GEL \
/usr/local/share/Otawa"


for word in $OTAWAFILES
do
	sudo rm -dfr "$word"
done

sudo pkgutil --forget SAT.OTAWA.ARMv7.Package

echo "OTAWA ARMv7 Package removed"