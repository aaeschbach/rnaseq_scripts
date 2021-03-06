#!/bin/bash

#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=25000M
#SBATCH --time=01:00:00
#SBATCH --job-name=samtools_sort
#SBATCH --mail-user=angela.aeschbach@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --partition=pcourse80
#SBATCH --output=/data/courses/rnaseq/toxoplasma_de/aaeschbach/2_map_reads/output_%j.o
#SBATCH --error=/data/courses/rnaseq/toxoplasma_de/aaeschbach/2_map_reads/error_%j.e
#SBATCH --array=0-3

# Sample names passed as arguments
SAMPLES=("$@")

# Input and output directories
BAM_DIR=/data/courses/rnaseq/toxoplasma_de/aaeschbach/2_map_reads/bam_files/
OUT_DIR=/data/courses/rnaseq/toxoplasma_de/aaeschbach/2_map_reads/sorted_bam_files/
mkdir $OUT_DIR

# Input and output files
BAM_FILE=${BAM_DIR}${SAMPLES[$SLURM_ARRAY_TASK_ID]}.bam
SORTED_BAM_FILE=${OUT_DIR}${SAMPLES[$SLURM_ARRAY_TASK_ID]}.sorted.bam

# Sort bam files by genomic coordinates
module add UHTS/Analysis/samtools/1.10
samtools sort -m 25000M -@ 4 -o ${SORTED_BAM_FILE} -T temp ${BAM_FILE}