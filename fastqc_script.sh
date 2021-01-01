#!/bin/bash

#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1000M
#SBATCH --time=01:00:00
#SBATCH --job-name=fastqc
#SBATCH --mail-user=angela.aeschbach@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --partition=pcourse80
#SBATCH --output=/data/courses/rnaseq/toxoplasma_de/aaeschbach/output_fastqc.o
#SBATCH --error=/data/courses/rnaseq/toxoplasma_de/aaeschbach/error_fastqc.e
#SBATCH --array=0-31

# Input files and output directory
FILES=(/data/courses/rnaseq/toxoplasma_de/reads/*)
OUTPUT_DIR=/data/courses/rnaseq/toxoplasma_de/aaeschbach/1_fastqc/
mkdir $OUTPUT_DIR

# Run fastqc on raw reads
module add UHTS/Quality_control/fastqc/0.11.7
fastqc --outdir=$OUTPUT_DIR ${FILES[$SLURM_ARRAY_TASK_ID]}