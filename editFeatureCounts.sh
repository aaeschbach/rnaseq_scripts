#!/bin/bash

# Edit featureCounts.txt for DESeq2 analysis

# Remove header and columns 2-6 (Chr, Start, End, Strand, Length)
tail -n+2 featureCounts.txt | cut -f1,7-22 > counts.txt

# Modify column names to leave only sample names
sed -i -e 's/\/data\/courses\/rnaseq\/toxoplasma_de\/mapping\///g' -e 's/\.sorted\.bam//g' counts.txt