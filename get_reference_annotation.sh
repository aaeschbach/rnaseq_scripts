#!/bin/bash

# Download reference genome (FASTA): Ensembl Mus musculus genome GRCm38 (release 101)
wget 'ftp://ftp.ensembl.org/pub/release-101/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna.primary_assembly.fa.gz'
wget 'ftp://ftp.ensembl.org/pub/release-101/fasta/mus_musculus/dna/CHECKSUMS'
mv CHECKSUMS CHECKSUMS_fasta

# Download annotation (GTF): Ensembl Mus musculus genome GRCm38(release 101)
wget 'ftp://ftp.ensembl.org/pub/release-101/gtf/mus_musculus/Mus_musculus.GRCm38.101.gtf.gz'
wget 'ftp://ftp.ensembl.org/pub/release-101/gtf/mus_musculus/CHECKSUMS'
mv CHECKSUMS CHECKSUMS_gtf


# Check if downloaded files are intact 
sum Mus_musculus.GRCm38.dna.primary_assembly.fa.gz
grep Mus_musculus.GRCm38.dna.primary_assembly.fa.gz CHECKSUMS_fasta

sum Mus_musculus.GRCm38.101.gtf.gz
grep Mus_musculus.GRCm38.101.gtf.gz CHECKSUMS_gtf
