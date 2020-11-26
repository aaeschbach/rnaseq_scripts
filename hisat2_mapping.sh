#!/bin/bash

#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=8000M
#SBATCH --time=02:00:00
#SBATCH --job-name=hisat2_mapping
#SBATCH --mail-user=angela.aeschbach@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --partition=pcourse80
#SBATCH --output=/data/courses/rnaseq/toxoplasma_de/aaeschbach/2_map_reads/output_%j.o
#SBATCH --error=/data/courses/rnaseq/toxoplasma_de/aaeschbach/2_map_reads/error_%j.e
#SBATCH --array=0-2

# Sample names as arguments
SAMPLES=("$@")

read_1=/data/courses/rnaseq/toxoplasma_de/reads/${SAMPLES[$SLURM_ARRAY_TASK_ID]}_1.fastq.gz
read_2=/data/courses/rnaseq/toxoplasma_de/reads/${SAMPLES[$SLURM_ARRAY_TASK_ID]}_2.fastq.gz

HT2_INDEX_BASE=/data/courses/rnaseq/toxoplasma_de/aaeschbach/2_map_reads/hisat2_index/Mus_musculus.GRCm38

OUT_DIR=/data/courses/rnaseq/toxoplasma_de/mapping/
mkdir $OUT_DIR

module add UHTS/Aligner/hisat/2.2.1

# Map reads to reference genome (paired-end)
hisat2 -p 4 --rna-strandness RF -x ${HT2_INDEX_BASE} -1 ${read_1} -2 ${read_2} -S ${OUT_DIR}${SAMPLES[$SLURM_ARRAY_TASK_ID]}.sam

