#!/bin/bash

# For more details
# http://information-technology.web.cern.ch/services/batch
# http://batchdocs.web.cern.ch/batchdocs/local/lsfmigratecommands.html


# The possible flavour options are:

# espresso     = 20 minutes
# microcentury = 1 hour
# longlunch    = 2 hours
# workday      = 8 hours
# tomorrow     = 1 day
# testmatch    = 3 days
# nextweek     = 1 week

suffix=".sh" # shell script file extension -> run000.sh
flavour="espresso"
Njobs=""
#NCPU=4 # default is 1 CPU 2GB RAM 20 GB Storage. 
# for using this feature uncomment line -> echo 'RequestCpus...

script=$1
output=${script/%$suffix}

if [ ! -d "output" ]; then
    mkdir output
fi
if [ ! -d "error" ]; then
    mkdir error
fi
if [ ! -d "log" ]; then
    mkdir log
fi

echo 'executable                =' "$script" > $output.sub
echo 'arguments                 =' '$(ClusterID) $(ProcId)' >> $output.sub
echo 'output                    =' output/$output'.$(ClusterId).$(ProcId).out' >> $output.sub
echo 'error                     =' error/$output.'$(ClusterId).$(ProcId).err' >> $output.sub
echo 'log                       =' log/$output.'$(ClusterId).log' >> $output.sub
echo '+JobFlavour               =' '"'$flavour'"' >> $output.sub
#echo 'RequestCpus               =' $NCPU >> $output.sub
echo queue $Njobs >> $output.sub

