# =====================================
# PCA Analysis using DESeq2
# Dataset: GSE270454
# Groups: AD, MCI, ASM, ASO
# =====================================

library(DESeq2)
library(ggplot2)

# -------------------------------
# 1. Variance Stabilizing Transformation (VST)
# -------------------------------
vsd <- vst(dds, blind = FALSE)

# -------------------------------
# 2. Generate PCA Plot
# -------------------------------
p_pca <- plotPCA(vsd, intgroup = "condition") +
  ggtitle("PCA Plot (GSE270454: AD vs MCI vs ASM vs ASO)") +
  theme_minimal(base_size = 14)

# Display plot
print(p_pca)

# -------------------------------
# 3. Save PCA Plot
# -------------------------------
ggsave(
  filename = "PCA_GSE270454_AllGroups.png",
  plot = p_pca,
  width = 7,
  height = 5,
  dpi = 300
)

# -------------------------------
# 4. Verify Output File
# -------------------------------
file.info("PCA_GSE270454_AllGroups.png")$size
getwd()

# =====================================
# End of Script
# =====================================
