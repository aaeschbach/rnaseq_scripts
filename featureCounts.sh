#!/bin/bash

#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=1000M
#SBATCH --time=02:00:00
#SBATCH --job-name=featureCounts
#SBATCH --mail-user=angela.aeschbach@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --partition=pcourse80
#SBATCH --output=/data/courses/rnaseq/toxoplasma_de/aaeschbach/3_featureCounts/featureCounts.o
#SBATCH --error=/data/courses/rnaseq/toxoplasma_de/aaeschbach/3_featureCounts/featureCounts.e

# Input files: sorted bam files and Ensembl annotation for Mus musculus GRCm38(release 101)
INPUT_FILES=/data/courses/rnaseq/toxoplasma_de/mapping/*.sorted.bam
ANNOTATION_FILE=/data/courses/rnaseq/toxoplasma_de/annotation/Mus_musculus.GRCm38.101.gtf

# Run featureCounts to count reads per gene
module add UHTS/Analysis/subread/2.0.1
featureCounts -p -s 2 -a $ANNOTATION_FILE -o featureCounts.txt $INPUT_FILES
