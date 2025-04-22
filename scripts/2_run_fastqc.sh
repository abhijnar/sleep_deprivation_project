#!/bin/bash
#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=18
#SBATCH --mem=160G
#SBATCH --time=8:00:00

cat PRJNA702096.txt | xargs -n 1 -P 18 bash -c '
    run_fastqc() {
        sample_id=$1
        r1="fastqs/${sample_id}_1.fastq.gz"
        r2="fastqs/${sample_id}_2.fastq.gz"
        fastqc $r1 --extract -o fastqc_output/${sample_id}/
        fastqc $r2 --extract -o fastqc_output/${sample_id}/
    }
    run_fastqc "$0"'
