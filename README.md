### RNA Sequencing Course - Scripts for Differential Gene Expression Analysis

* Quality control of the raw reads:
  * [fastqc_script.sh](https://github.com/aaeschbach/rnaseq_scripts/blob/main/fastqc_script.sh)
  
* Downloading reference and annotation files:
  * [get_reference_annotation.sh](https://github.com/aaeschbach/rnaseq_scripts/blob/main/get_reference_annotation.sh)
  
* Read mapping:
  * [hisat2_index.sh](https://github.com/aaeschbach/rnaseq_scripts/blob/main/hisat2_index.sh)
  * [hisat2_mapping.sh](https://github.com/aaeschbach/rnaseq_scripts/blob/main/hisat2_mapping.sh)
  * [samtools_view.sh](https://github.com/aaeschbach/rnaseq_scripts/blob/main/samtools_view.sh)
  * [samtools_sort.sh](https://github.com/aaeschbach/rnaseq_scripts/blob/main/samtools_sort.sh)
  * [samtools_index.sh](https://github.com/aaeschbach/rnaseq_scripts/blob/main/samtools_index.sh)
  
* Gene-level counts:
  * [featureCounts.sh](https://github.com/aaeschbach/rnaseq_scripts/blob/main/featureCounts.sh)
  
* Exploratory data and differential gene expression analysis:
  * [editFeatureCounts.sh](https://github.com/aaeschbach/rnaseq_scripts/blob/main/editFeatureCounts.sh)
  * [DESeq2.R](https://github.com/aaeschbach/rnaseq_scripts/blob/main/DESeq2.R)
  
* Overrepresentation analysis:
  * [enrichGO.R](https://github.com/aaeschbach/rnaseq_scripts/blob/main/enrichGO.R)
