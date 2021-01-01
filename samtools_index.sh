#!/bin/bash

#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=4000M
#SBATCH --time=01:00:00
#SBATCH --job-name=samtools_index
#SBATCH --mail-user=angela.aeschbach@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --partition=pcourse80
#SBATCH --output=/data/courses/rnaseq/toxoplasma_de/aaeschbach/2_map_reads/output_%j.o
#SBATCH --error=/data/courses/rnaseq/toxoplasma_de/aaeschbach/2_map_reads/error_%j.e
#SBATCH --array=0-3

# Sample names passed as arguments
SAMPLES=("$@")

# Define output directory and filenames
SORTED_BAM_DIR=/data/courses/rnaseq/toxoplasma_de/aaeschbach/2_map_reads/sorted_bam_files/
SORTED_BAM_FILE=${SORTED_BAM_DIR}${SAMPLES[$SLURM_ARRAY_TASK_ID]}.sorted.bam

# Index the sorted bam files
module add UHTS/Analysis/samtools/1.10
samtools index ${SORTED_BAM_FILE}