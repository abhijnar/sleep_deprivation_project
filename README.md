### Data collection

The data for this project is obtained from the NCBI Gene Expression Omnibus (GEO) under the accession number `GSE166831`. The authors of the publication “Altered hippocampal transcriptome dynamics following sleep deprivation”5 from the Molecular Brain journal generated this data at the Genomics Division at the Iowa Institute of Human Genetics. The Illumina TruSeq Stranded Total RNA sample prep kit was used to create the sequencing libraries and they were prepared for sequencing using standard Illumina protocols. Ribo-Zero Gold was used to enrich for mRNA through ribo-depletion as this method removes ribosomal RNA. Paired-end sequencing (150 bp paired-end reads) was done in two lanes and 18 samples were sequenced in two batches.

### Experimental condition

The mice were either under the condition where their sleep was deprived (`SD`) by moving and tapping their cage (gentle handling method) or under the condition where their sleep was not disturbed (`NSD`).

### Scripts

The order of scripts to be run is numbered from 1 to 9 and is available in the `scripts` directory.

### Reports

Collated results from the QoRTs analysis are in the `reports` directory.

### Data

The counts data used for this analysis are made available in the `data` directory.

### Walk through

The `Sleep_Deprivation.Rmd` is a walkthrough of the analysis starting from downloading the data, to processing and aligning, the related QC and finally the DGE and GSEA analyses.
