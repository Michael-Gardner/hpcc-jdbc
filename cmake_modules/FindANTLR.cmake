################################################################################
# Copyright (C) 2011 HPCC Systems.
#
# All rights reserved. This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
################################################################################

INCLUDE(UseJava)

# - Attempt to find the ANTLR jar needed to build and run ANTLR Lexers and Parsers
#   Once done this will define
#
# ANTLR_FOUND - ANTLR found in local system
# ANTLR_BUILDTIME_JAR - The jar needed to build/generate ANTLR Lexers and Parsers
# ANTLR_RUNTIME_JAR - The jar needed to build/generate ANTLR Lexers and Parsers
# ANTLR_LICENSE_FILE - The appropriate ANTLR license needs to be included with runtime binaries

SET (ANTLR_LICENSE_FILE_NAME "ANTLR-LICENSE.txt")
SET (ANTLR_PACKAGE_PATH "org/antlr/runtime")

if (NOT ANTLR_FOUND)

    OPTION(ANTLR_BUILDTIME_DEP "ANTLR buildtime jar file name.")
    IF ( NOT ANTLR_BUILDTIME_DEP )
        SET ( ANTLR_BUILDTIME_DEP "antlr-3.4-complete" )
        MESSAGE("-- Option ANTLR_BUILDTIME_DEP not set, setting to: ${ANTLR_BUILDTIME_DEP}")
    ENDIF ()

    OPTION(ANTLR_RUNTIME_DEP "ANTLR runtime jar file name.")
    IF ( NOT ANTLR_RUNTIME_DEP )
        SET ( ANTLR_RUNTIME_DEP "antlr-runtime-3.4" )
        MESSAGE("-- Option ANTLR_RUNTIME_DEP not set, setting to: ${ANTLR_RUNTIME_DEP}")
    ENDIF ()

    OPTION(ANTLR_PATH "Location of ANTLR runtime and buildtime jar files.")
    IF (NOT ANTLR_PATH )
        SET ( ANTLR_PATH "/usr/local/ANTLR" )
        MESSAGE("-- Option ANTLR_PATH not set, setting to: ${ANTLR_PATH}")
    ENDIF ()

    OPTION(ANTLR_VER "ANTLR runtime and buildtime version.")
    IF (NOT ANTLR_VER )
        SET ( ANTRL_VER 3.4)
        SET ( ANTLR_PATH ${ANTLR_PATH}/${ANTRL_VER} )
        MESSAGE("-- Option ANTRL_VER not set, setting to: ${ANTRL_VER}")
    ENDIF ()

    MESSAGE("-- Searching for ANTLR jar files: ${ANTLR_RUNTIME_DEP} and ${ANTLR_BUILDTIME_DEP}")

    find_jar(ANTLR_RUNTIME_JAR   ${ANTLR_RUNTIME_DEP} PATHS ${ANTLR_PATH} )
    MESSAGE("--- ANTLR_RUNTIME_JAR: ${ANTLR_RUNTIME_JAR}")

    find_jar(ANTLR_BUILDTIME_JAR ${ANTLR_BUILDTIME_DEP} PATHS ${ANTLR_PATH} )
    MESSAGE("--- ANTLR_BUILDTIME_JAR: ${ANTLR_BUILDTIME_JAR}")
    
    FIND_FILE(ANTLR_LICENSE_FILE ${ANTLR_LICENSE_FILE_NAME} PATHS ${ANTLR_PATH})
    MESSAGE("-- Searching for ANTLR license file:")
    MESSAGE("--- ${ANTLR_LICENSE_FILE}")

    FILE(GLOB ANTLRRUNTIMECLASSES "${ANTLR_PATH}/ANTLR_PACKAGE_PATH/*.class")
    
    MARK_AS_ADVANCED(ANTLR_BUILDTIME_JAR ANTLR_RUNTIME_JAR )

ENDIF()
