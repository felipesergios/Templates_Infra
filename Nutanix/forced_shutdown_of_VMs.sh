#!/bin/bash
#This script was developed to power off all VMs in the Nutanix cluster
#to perform a complete cluster shutdown.
#Attention: VMs are forcibly powered off,
#which may require storage consistency checks after the procedure.
mapfile -t UUIDS < <(
    acli vm.list | awk 'NR>1 {print $2}'
)

for uuid in "${UUIDS[@]}"; do
    acli vm.off "$uuid"
done