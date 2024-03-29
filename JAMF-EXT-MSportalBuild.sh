#!/bin/bash
#
###############################################################################################################################################
#
# ABOUT THIS PROGRAM
#
#	JAMF-EXT-MSportalBuild.sh
#	https://github.com/Headbolt/JAMF-EXT-MSportalBuild
#
#   This Script is designed for use in JAMF as an Extension Attribute
#		with a type set of "Integer"
#
#   - This script will ...
#       Search for the MS Company Portal App and pull out the version number.
#		Then Split the number down to get the Build Number.
#
###############################################################################################################################################
#
# HISTORY
#
#   Version: 1.0 - 03/02/2020
#
#   - 03/02/2020 - V1.0 - Created by Headbolt
#
###############################################################################################################################################
#
# SCRIPT CONTENTS - DO NOT MODIFY BELOW THIS LINE
#
###############################################################################################################################################
#
PortalPath=$(find /Applications/ -iname "Company Portal.app") # Find AutoUpdate App
#
PortalVers=$(defaults read "${PortalPath}"/Contents/Info CFBundleShortVersionString) # Extracts the MAU Version from the APP
#
IFS='.' # Internal Field Seperator Delimiter is set to Pipe (.)
PortalBuildNumber=$(echo $PortalVers | awk '{ print $3 }') # Splits down the Version Number to extracts the Build Number
unset IFS # Internal Field Seperator Delimiter re-disabled
#
/bin/echo "<result>$PortalBuildNumber</result>" # Return Result
