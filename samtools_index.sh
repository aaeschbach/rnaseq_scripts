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

# Sample names passed as arguments stored here
SAMPLES=("$@")

# Index the sorted bam files
module add UHTS/Analysis/samtools/1.10

SORTED_BAM_FILE=/data/courses/rnaseq/toxoplasma_de/hisat2_mapping/${SAMPLES[$SLURM_ARRAY_TASK_ID]}.sorted.bam

samtools index ${SORTED_BAM_FILE}