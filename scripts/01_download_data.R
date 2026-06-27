# =============================================================================
# 01_download_data.R
#
# Description: Download and perform initial inspection of GSE25066 from NCBI GEO
#              Dataset: 508 primary breast tumours, tamoxifen-treated,
#              with treatment response annotation (pCR vs RD)
#
# Author:      Maria Szczerbinska
# Created:     2026-06-27
# Last edited: 2026-06-27
#
# Input:       none (downloads directly from GEO)
# Output:      data/raw/         — raw GEO series matrix files
#              environment/session_info.txt — R session info for reproducibility
#
# Usage: Rscript scripts/01_download_data.R
#        or source("scripts/01_download_data.R") in RStudio
#
# GEO accession: https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE25066
# =============================================================================


# -----------------------------------------------------------------------------
# 0. Dependencies
# -----------------------------------------------------------------------------

# Install Bioconductor manager if not present
if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

# Install GEOquery if not present
if (!requireNamespace("GEOquery", quietly = TRUE)) {
  message("Installing GEOquery from Bioconductor...")
  BiocManager::install("GEOquery", update = FALSE)
}

library(GEOquery)


# -----------------------------------------------------------------------------
# 1. Setup
# -----------------------------------------------------------------------------

# Define paths
raw_data_dir  <- "data/raw"
env_dir       <- "environment"
geo_accession <- "GSE25066"

# Create directories if they don't exist
dir.create(raw_data_dir, recursive = TRUE, showWarnings = FALSE)
dir.create(env_dir, showWarnings = FALSE)

message("Directories ready.")


# -----------------------------------------------------------------------------
# 2. Download data from GEO
# -----------------------------------------------------------------------------

message(paste("Downloading", geo_accession, "from NCBI GEO..."))
message("This may take a few minutes (~50MB). Please wait.")

gse <- tryCatch(
  getGEO(geo_accession, destdir = raw_data_dir, GSEMatrix = TRUE),
  error = function(e) {
    stop(paste("Failed to download", geo_accession, ":", conditionMessage(e)))
  }
)

message("Download complete.")


# -----------------------------------------------------------------------------
# 3. Extract and inspect the dataset
# -----------------------------------------------------------------------------

# GSE25066 contains one platform — extract ExpressionSet
eset <- gse[[1]]

# Basic checks
n_samples  <- ncol(eset)
n_features <- nrow(eset)

message(paste("Samples:", n_samples))
message(paste("Features (probes):", n_features))

# Check that expected sample size is correct
# GSE25066 should contain 508 samples
if (n_samples != 508) {
  warning(paste(
    "Expected 508 samples, got", n_samples,
    "— check GEO entry for dataset changes."
  ))
}

# Preview phenotype (clinical) data columns
# These contain tamoxifen response annotations we will use in downstream analysis
message("\nPhenotype data columns (clinical annotations):")
print(colnames(pData(eset)))


# -----------------------------------------------------------------------------
# 4. Save session info for reproducibility
# -----------------------------------------------------------------------------

session_info_path <- file.path(env_dir, "session_info.txt")
writeLines(capture.output(sessionInfo()), session_info_path)
message(paste("\nSession info saved to", session_info_path))


# -----------------------------------------------------------------------------
# 5. Done
# -----------------------------------------------------------------------------

message("\n--- Done ---")
message(paste("Raw data saved to:", raw_data_dir))
message("Next step: open notebooks/01_data_exploration.Rmd")
