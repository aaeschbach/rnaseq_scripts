##### clusterProfiler GO enrichment analysis #####

# Install clusterProfiler package and genome wide annotation for mouse
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
	
BiocManager::install("clusterProfiler")
BiocManager::install("org.Mm.eg.db")
library(org.Mm.eg.db)

# Extract Ensembl IDs of differentially expressed genes
sig_lung <- rownames(lung_res[!is.na(lung_res$padj) & lung_res$padj < 0.05, ])
sig_blood <- rownames(blood_res[!is.na(blood_res$padj) & blood_res$padj < 0.05, ])

# Extract Ensembl IDs of all genes
all_lung <- rownames(lung_res)
all_blood <- rownames(blood_res)

# Overrepresentation analysis: lung
ego_lung <- clusterProfiler::enrichGO(
                gene          = sig_lung,
                universe      = all_lung,
                OrgDb         = org.Mm.eg.db,
                ont           = "BP",
                keyType       = "ENSEMBL",
                readable      = TRUE)

# Overrepresentation analysis: blood
ego_blood <- clusterProfiler::enrichGO(
                gene          = sig_blood,
                universe      = all_blood,
                OrgDb         = org.Mm.eg.db,
                ont           = "BP",
                keyType       = "ENSEMBL",
                readable      = TRUE)

# Plot results using dotplot()
clusterProfiler::dotplot(ego_lung, orderBy = "x")
clusterProfiler::dotplot(ego_blood, orderBy = "x")
