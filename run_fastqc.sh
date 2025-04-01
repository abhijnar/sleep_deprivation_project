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
        r1="trimmed/${sample_id}_1_val_1.fq.gz"
        r2="trimmed/${sample_id}_2_val_2.fq.gz"
        fastqc $r1 --extract -o fastqc_output_trimmed/${sample_id}/
        fastqc $r2 --extract -o fastqc_output_trimmed/${sample_id}/
    }
    run_fastqc "$0"'
