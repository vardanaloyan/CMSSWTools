# HTCondor instruction for jobs
## 1. Modify createCluster.sh
###    Change suffix variable to ".csh" (if you use .csh or something else)
###    Choose flavour variable ("espresso", "microcentury",...)
## 2. Run createCluser.sh file by giving output your .sh (.csh) script. ./createCluster.sh run000.sh
### It will generate .sub file (run000.sub)

## 3. Submiting the job
### condor_submit run000.sub 
## 4. Checking the status
### condor_q
