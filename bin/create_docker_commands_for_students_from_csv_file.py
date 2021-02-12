#!/usr/bin/env python3


# Usage: python create_docker_commands_for_all_students.py [csv file with student to virtual machine correspondence]

# Input file should have comma separated values (.csv)
# Input file format should contain these columns with this naming scheme.
# student	     machine	  password	port
# Maura Cook 	 machine-01	  maura	    8787
# Reini van Hal  machine-02	  reini	    8788
# ...

# Output:
# It will output to the screen the individual commands to be run in the Linux VM in the cloud 
import pandas as pd
import sys

student_to_machine = sys.argv[1]
docker_image = sys.argv[2]

df = pd.read_csv(student_to_machine, sep=",")

def create_docker_command(row):
    """Takes a Pandas row and return the docker command with corresponding student name + pwd + port number"""	
    student =     row["student"]
    machine_nb =  row["machine"]
    password   =  row["password"]
    port =        row["port"]

    docker_cmd = "docker run --detach --name " + machine_nb + " -e PASSWORD=" + password + " -p " + str(port) + ":8787" + " scienceparkstudygroup/master-gls:" + docker_image
    print(docker_cmd)
    return docker_cmd

docker_commands = df.apply(create_docker_command, axis = 1, result_type='reduce')

