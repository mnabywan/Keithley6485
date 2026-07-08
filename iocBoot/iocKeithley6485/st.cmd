#!../../bin/linux-x86_64/Keithley6485

#- SPDX-FileCopyrightText: 2005 Argonne National Laboratory
#-
#- SPDX-License-Identifier: EPICS

#- You may have to change Keithley6485 to something else
#- everywhere it appears in this file

#< envPaths

## Register all support components
dbLoadDatabase "../../dbd/Keithley6485.dbd"
Keithley6485_registerRecordDeviceDriver(pdbbase) 

## Connect to device using
epicsEnvSet("STREAM_PROTOCOL_PATH", "../../db")
epicsEnvSet("CONNECTION_NAME", "Keithley6485")
epicsEnvSet("DEVICE_IP", "ics-lab-moxa.cslab.esss.lu.se")
drvAsynIPPortConfigure($(CONNECTION_NAME), "$(DEVICE_IP):$(IP_PORT=4002)")

## Load record instances
dbLoadRecords("../../db/Keithley6485.db","P=mateusz:, R=test:, PORT=$(CONNECTION_NAME), PROTO_FILE=Keithley6485.proto")

iocInit()

## Start any sequence programs
#seq sncKeithley6485,"user=mateusznabywaniec"
