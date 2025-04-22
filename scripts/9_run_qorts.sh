#!/bin/bash
#SBATCH --partition=angsd_class
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=18
#SBATCH --mem=200G
#SBATCH --time=8:00:00

cat bam_list.txt | xargs -n 1 -P 18 bash -c '
    run_qorts() {
        SAMPLE=$1
        SAMPLE_NAME=$(basename "$SAMPLE" .Aligned.sortedByCoord.out.bam)
        java -Xmx4G -jar /athena/angsd/scratch/mef3005/share/envs/qorts/share/qorts-1.3.6-1/QoRTs.jar QC \
        --stranded \
        --generatePdfReport \
        ${SAMPLE} \
        ../project_old/mm10_files/mm10.ncbiRefSeq.gtf \
        qorts_results/$SAMPLE_NAME/
    }
    run_qorts "$0"'
