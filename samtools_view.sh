#!/bin/bash

#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=4000M
#SBATCH --time=01:00:00
#SBATCH --job-name=samtools_view
#SBATCH --mail-user=angela.aeschbach@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --partition=pcourse80
#SBATCH --output=/data/courses/rnaseq/toxoplasma_de/aaeschbach/2_map_reads/output_%j.o
#SBATCH --error=/data/courses/rnaseq/toxoplasma_de/aaeschbach/2_map_reads/error_%j.e
#SBATCH --array=0-3

# Sample names passed as arguments
SAMPLES=("$@")

# Input and output directories
SAM_DIR=/data/courses/rnaseq/toxoplasma_de/mapping/
OUT_DIR=/data/courses/rnaseq/toxoplasma_de/aaeschbach/2_map_reads/bam_files/
mkdir $OUT_DIR

# Input and output files
SAM_FILE=${SAM_DIR}${SAMPLES[$SLURM_ARRAY_TASK_ID]}.sam
BAM_FILE=${OUT_DIR}${SAMPLES[$SLURM_ARRAY_TASK_ID]}.bam

# Convert sam files to bam format
module add UHTS/Analysis/samtools/1.10
samtools view -hbS ${SAM_FILE} > ${BAM_FILE}