#!/bin/bash
#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=100G
#SBATCH --time=4:00:00

featureCounts -a ../project_old/mm10_files/mm10.ncbiRefSeq.gtf -o featureCounts_exon_results -p -O -T 16 -f alignments/*/*.bam