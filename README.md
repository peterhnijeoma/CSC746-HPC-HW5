# Sobel operator - performance


# Build instructions 

 from the code directory

# on cori login node

1. setup the environment

% module purge  
% module load cmake  
% module load cgpu  
% module load PrgEnv-llvm/13_rc3  

% export CXX=clang++  

2. build 

% mkdir build  
% cd build  
% cmake ../
% make

# Run instructions - from build directory

1. for CPU code

% export OMP_NUM_THREADS=<concurrency level> [valid values: 1, 2, 4, 8, 16]

% ./sobel_cpu

2. for GPU code - cuda and OpenMP with device offload

# modify the script as indicated in the script file to get runtime and SM efficiency.
% ../scripts/gpu-batch-script.sh


Note:
% = Linux prompt

#eof
