#!/bin/bash
#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=18
#SBATCH --mem=160G
#SBATCH --time=8:00:00

cat PRJNA702096.txt | xargs -n 1 -P 18 bash -c '
    run_trimming() {
        sample_id=$1
        r1="${sample_id}_1.fastq.gz"
        r2="${sample_id}_2.fastq.gz"
        trim_galore --paired --illumina --cores 4 -o trimmed/ $r1 $r2
    }
    run_trimming "$0"'