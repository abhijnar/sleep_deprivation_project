#!/bin/bash
#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=125G
#SBATCH --time=4:00:00

cat PRJNA702096.txt | xargs -I {} -P 16 bash -c 'echo -e "Downloading FASTQ file for sample: {} \n"; prefetch {}; fastq-dump --split-files --gzip {}/'