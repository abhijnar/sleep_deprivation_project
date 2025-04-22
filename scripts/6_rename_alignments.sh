#!/bin/bash

while IFS=, read -r run group; do
    old_dir="alignments/${run}/"
    new_dir="alignments/${group}/"
    for file in "$old_dir"*; do
        filename=$(basename "$file")
        extension="${filename#${run}}"
        new_filename="${group}${extension}"
        mv ${file} ${new_dir}${new_filename}
    done
done < sra_run_id_to_group.csv

rm -r alignments/SRR*
