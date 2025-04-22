#!/bin/bash
#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=18
#SBATCH --mem=100G
#SBATCH --time=4:00:00

for line in $(cat PRJNA702096.txt); do
  r1="trimmed/${line}_1_val_1.fq.gz"
  r2="trimmed/${line}_2_val_2.fq.gz"
  STAR --runMode alignReads --runThreadN 16 \
  --genomeDir ../project_old/mm10_STARindex/ \
  --readFilesIn $r1 $r2 \
  --readFilesCommand zcat \
  --outFileNamePrefix alignments/${line}/${line}. \
  --outSAMtype BAM SortedByCoordinate \
  --limitBAMsortRAM 100000000000
done