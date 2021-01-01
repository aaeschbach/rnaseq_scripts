##### DESeq2 exploratory and differential gene expression analysis #####

# Install DESeq2 package
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
	
BiocManager::install("DESeq2")

# Read adjusted file resulting from featureCounts
counts <- read.table("counts.txt", 
                     sep = "\t", 
                     row.names = "Geneid", 
                     header = TRUE)

# Specify experimental group for each sample
group <- factor(c(rep("Lung_Case", 5), 
                  rep("Lung_Control", 3), 
                  rep("Blood_Case", 5), 
                  rep("Blood_Control", 3)))

coldata <- data.frame(row.names = colnames(counts), group)

# Create DESeqDataSet object
DESeqDataSet <- DESeq2::DESeqDataSetFromMatrix(
                        countData = counts,
                        colData = coldata,
                        design = ~ group)

# Differential expression analysis pipeline
dds <- DESeq2::DESeq(DESeqDataSet)

# Transform dds to remove dependence of the variance on the mean
log_dds <- DESeq2::rlog(dds, blind = TRUE)

# Principal components analysis(PCA) plot
DESeq2::plotPCA(log_dds, intgroup = "group")

# Extract the results tables for pairwise contrast
lung_res <- DESeq2::results(dds,
                            contrast = c("group",
                                         "Lung_Case",
                                         "Lung_Control"),
                            alpha = 0.05)

blood_res <- DESeq2::results(dds,
                             contrast = c("group",
                                          "Blood_Case",
                                          "Blood_Control"),
                             alpha = 0.05)

# View number of differentially expressed genes
sum(lung_res$padj < 0.05, na.rm = TRUE)
sum(blood_res$padj < 0.05, na.rm = TRUE)

# View summary of results
DESeq2::summary(lung_res)
DESeq2::summary(blood_res)

# Retrieve the normalized counts matrix
norm_counts <- DESeq2::counts(dds, normalized = TRUE)

# Extract expression levels of Gbp2, Oas2 and Tap2 from norm_counts
# Prepare data frame for plotting
gbp2 <- data.frame(coldata, 
                   gene = c(rep("Gbp2", 16)), 
                   counts = norm_counts["ENSMUSG00000028270", ])
oas2 <- data.frame(coldata, 
                   gene = c(rep("Oas2", 16)), 
                   counts = norm_counts["ENSMUSG00000032690", ])
tap2 <- data.frame(coldata, 
                   gene = c(rep("Tap2", 16)), 
                   counts = norm_counts["ENSMUSG00000024339", ])
gene_counts <- rbind(gbp2, oas2, tap2)

# Plot the expression levels in blood and lung tissue
library(ggplot2)
ggplot(gene_counts) +
  geom_point(aes(x = gene, y = counts, color = group)) +
  scale_y_log10() +
  xlab("") +
  ylab("Normalized Counts")
