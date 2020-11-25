#!/bin/bash

#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=8000M
#SBATCH --time=03:00:00
#SBATCH --job-name=hisat2_index
#SBATCH --mail-user=angela.aeschbach@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --partition=pcourse80
#SBATCH --output=/data/courses/rnaseq/toxoplasma_de/aaeschbach/2_map_reads/output_%j.o
#SBATCH --error=/data/courses/rnaseq/toxoplasma_de/aaeschbach/2_map_reads/error_%j.e

module add UHTS/Aligner/hisat/2.2.1

mkdir hisat2_index

# Mus musculus genome Ensembl GRCm38 (release 101)
gunzip Mus_musculus.GRCm38.dna.primary_assembly.fa.gz

REF_GENOME=Mus_musculus.GRCm38.dna.primary_assembly.fa
HT2_INDEX_BASE=hisat2_index/Mus_musculus.GRCm38

# Build index
hisat2-build -p 1 ${REF_GENOME} ${HT2_INDEX_BASE}
