# SPDX-FileCopyrightText: 2003 Argonne National Laboratory
#
# SPDX-License-Identifier: EPICS

TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = Keithley6485
# Keithley6485.dbd will be created and installed
DBD += Keithley6485.dbd

# Keithley6485.dbd will be made up from these files:
Keithley6485_DBD += base.dbd

# Include dbd files from all support applications:
Keithley6485_DBD += stream.dbd
Keithley6485_DBD += asyn.dbd
Keithley6485_DBD += drvAsynIPPort.dbd

# Add all the support libraries needed by this IOC
Keithley6485_LIBS += stream
Keithley6485_LIBS += asyn

# Link QSRV (pvAccess Server) if available
ifdef EPICS_QSRV_MAJOR_VERSION
    Keithley6485_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
    Keithley6485_LIBS += pvxsIoc pvxs
    Keithley6485_DBD += PVAServerRegister.dbd
    Keithley6485_DBD += pvxsIoc.dbd
endif

# Keithley6485_registerRecordDeviceDriver.cpp derives from Keithley6485.dbd
Keithley6485_SRCS += Keithley6485_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
Keithley6485_SRCS_DEFAULT += Keithley6485Main.cpp
Keithley6485_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#Keithley6485_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
Keithley6485_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

