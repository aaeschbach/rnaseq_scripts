#!/bin/bash

#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1000M
#SBATCH --time=01:00:00
#SBATCH --job-name=quality_checks
#SBATCH --mail-user=angela.aeschbach@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --partition=pcourse80
#SBATCH --output=/home/aaeschbach/aaeschbach/1_quality_checks/output_%j.o
#SBATCH --error=/home/aaeschbach/aaeschbach/1_quality_checks/error_%j.e

module add UHTS/Quality_control/fastqc/0.11.7

SAMPLE_NAMES=(SRR7821920 SRR7821938 SRR7821950 SRR7821968)

for sample in ${SAMPLE_NAMES[@]}
do
read_1=/data/courses/rnaseq/toxoplasma_de/reads/${sample}_1.fastq.gz
read_2=/data/courses/rnaseq/toxoplasma_de/reads/${sample}_2.fastq.gz
output_dir=/home/aaeschbach/aaeschbach/1_quality_checks/${sample}
mkdir $output_dir
fastqc --outdir=$output_dir $read_1 $read_2
done

