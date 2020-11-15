#!/bin/bash
#https://wiki.manjaro.org/index.php/Buildiso_with_AUR_packages:_Using_buildpkg

branch="x86_64"

destination1="/home/seth/SMDLINUX-REPO/smdlinux_repo/x86_64/"
destination2="/home/seth/SMDLINUX-REPO/smdlinux_repo_3party/x86_64/"
destination3="/home/seth/SMDLINUX-REPO/smdlinux_repo_testing/x86_64/"

destiny=$destination2

search=smdlinux

# Give a comment to the commit if you want
echo "Enter Package Name"

read input

buildpkg -s -p $input

echo ""
echo "Moving created files to " $destiny
echo ""
mv /var/cache/manjaro-tools/pkg/stable/$branch/$input*pkg.tar.zst $destiny
mv /var/cache/manjaro-tools/pkg/stable/$branch/$input*pkg.tar.zst.sig $destiny

echo "###########################################################################"
echo "###################           Cleaning Up            ######################"
echo "###########################################################################"

sudo rm -r /var/lib/manjaro-tools/buildpkg
rm -rf ~/pkgbuild/$input

echo ""
echo "###########################################################################"
echo "###################          build finished          ######################"
echo "###########################################################################"
