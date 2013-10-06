# 
# Copyright (C) 2013 Andrew Mundy, Jonathan Heathcote
# 
# This Makefile is part of the Unofficial University of Manchester Beamer
# Theme.
# 
# This particular Makefile is the Makefile for generating packages
# and distributable components.  Certain packages will contain
# their own Makefiles for building, moving and fetching required
# components - these will be obvious from the fact that they include
# an `install' target.
#
# This package is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
# 
# Since version 2.0.0a (5th October 2013) the University of Manchester
# logo has not been bundled with the package, and code has been provided
# to retrieve it as necessary - thus the logo IS NOT covered by this
# licence and remains copyright of The University of Manchester.
# - See http://www.brand.manchester.ac.uk
# 

# Configuration Options
SRCROOT=src
BUILDROOT=build
TOOLROOT=tools
ABRV=unofficial-uom-beamer

DTXROOT=${BUILDROOT}/dtx
TDSROOT=${BUILDROOT}/tds
TDSPATH=tex/latex/beamer/themes/unofficial-university-of-manchester

ZIP=zip	-r	# The program/string to compress with, e.g., zip or tar -cvzf
ZIPEXT=zip	# The extension of the compressed file, e.g., zip or tar.gz

# Phony targets
.PHONY: dtx		# Generate just the dtx and ins file
.PHONY: tds		# Generate a TeX directory structure package
.PHONY: tds-extra	# Generate a TeX directory structure package WITH optional extras included
.PHONY: clean		# Remove all builds

# Build a dtx version of the package
dtx :
	mkdir -p ${DTXROOT}/${ABRV}/						# Make the package build directory
	cp ${SRCROOT}/${ABRV}.ins ${DTXROOT}/${ABRV}/				# Copy over the .ins file
	cp ${SRCROOT}/Makefile.dtx ${DTXROOT}/${ABRV}/				# Copy over the Makefile
	cat ${SRCROOT}/README.{head,dtx,tail} > ${DTXROOT}/${ABRV}/README	# Make the README and copy over
	m4 ${TOOLROOT}/${ABRV}.dtx.m4 > ${DTXROOT}/${ABRV}/${ABRV}.dtx		# Generate the DTX file from the current latest stys
	cd ${DTXROOT} && ${ZIP} ${ABRV}-dtx.${ZIPEXT} ${ABRV}/*			# Make the archive for the DTX files

# Build a TDS version of the package
tds : dtx
	mkdir -p ${TDSROOT}/${ABRV}/${TDSPATH}/						# Make the TDS
	cp ${DTXROOT}/${ABRV}/${ABRV}.* ${TDSROOT}/${ABRV}/${TDSPATH}/			# Copy over files from the DTX install
	cp ${SRCROOT}/Makefile.tds ${TDSROOT}/${ABRV}/					# Copy over the Makefile
	cat ${SRCROOT}/README.{head,tds,tail} > ${TDSROOT}/${ABRV}/README		# Make the README and copy over
	cd ${TDSROOT}/${ABRV}/${TDSPATH}/ && tex ${ABRV}.ins && rm *.{ins,dtx,log}	# Expand the DTX, remove the DTX and INS
	cd ${TDSROOT} && ${ZIP} ${ABRV}-tds.${ZIPEXT} ${ABRV}/*				# Make the archive for the TDS files

# As above, but include extra packages from CTAN
tds-extra : tds
	mkdir -p ${TDSROOT}-extra/${ABRV}					# Make the package directory
	cp -r ${TDSROOT}/* ${TDSROOT}-extra/					# Copy over everything from the TDS build
	# Download all sources
	curl -L http://www.ctan.org/tex-archive/macros/latex/contrib/oberdiek/ifluatex.dtx > /tmp/ifluatex.dtx
	curl -L http://mirrors.ctan.org/macros/latex/contrib/fontaxes/fontaxes.dtx > /tmp/fontaxes.dtx
	curl -L http://mirrors.ctan.org/macros/latex/contrib/fontaxes/fontaxes.ins > /tmp/fontaxes.ins
	curl -L http://www.ctan.org/tex-archive/install/fonts/cabin.tds.zip > /tmp/cabin.tds.zip

	# Build/extract and copy sources into TDS
	cd /tmp && tex ifluatex.dtx && tex fontaxes.ins
	cp /tmp/ifluatex.sty ${TDSROOT}-extra/${ABRV}/tex/
	cp /tmp/fontaxes.sty ${TDSROOT}-extra/${ABRV}/tex/
	unzip /tmp/cabin.tds.zip -d ${TDSROOT}-extra/${ABRV}/

	cd ${TDSROOT}-extra && ${ZIP} ${ABRV}-tds-extra.${ZIPEXT} ${ABRV}/*	# Make the archive for the TDS files

# Remove all builds
clean :
	rm -rf ${BUILDROOT}/*
