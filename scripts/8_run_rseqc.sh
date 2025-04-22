#!/bin/bash
#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=18
#SBATCH --mem=100G
#SBATCH --time=8:00:00

for SAMPLE in alignments/*/*.bam; do
  samtools index $SAMPLE
done

for SAMPLE in alignments/*/*.bam; do
    echo $SAMPLE >> bam_list.txt
done

for SAMPLE in alignments/*/*.bam; do
    SAMPLE_NAME=$(basename ${SAMPLE} .Aligned.sortedByCoord.out.bam)
    read_distribution.py -i ${SAMPLE} \
    -r ../project_old/mm10_files/mm10_RefSeq.bed > \
    rseqc_results/${SAMPLE_NAME}_read_distribution.txt
done