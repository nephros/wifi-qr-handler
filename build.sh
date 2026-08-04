#!/bin/sh

printf 'building...\n'
make -C patch/
rpmbuild -bb --build-in-place rpm/*.spec > build.log 2>&1 && rm -f *.list
printf "exit: $?\n"
grep ^Wrote build.log

