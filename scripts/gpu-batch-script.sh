#!/bin/bash -l
#SBATCH -N 1
#SBATCH -c 10
#SBATCH -G 1
#SBATCH -C gpu
#SBATCH -t 5:00
#SBATCH -J queue
#SBATCH --job-name=gpu-job
#SBATCH --output=gpu-job.o%j
#SBATCH --error=gpu-job.e%j

export LIBOMPTARGET_INFO=4
#
# note: you will need to modify below here to launch your specific program
# it is assumed your environment is set up properly for using the Cori GPUs
# prior to you launching this batch script
#
for nB in 1 4 16 64 256 1024 4096
  do
    for nT in 32 64 128 256 512 1024
      do
         nvprof -m sm_efficiency ./sobel_gpu $nT $nB
    done
done

nvprof -m sm_efficiency ./sobel_cpu_omp_offload


