# FGFR2-ERα Pathway Expression Analysis in Luminal Breast Cancer

## Biological question
Are genes involved in the FGFR2-ERα signalling axis 
(including *PGR*, *IRS1*, *BCL2L1*) differentially expressed 
between luminal breast cancer subtypes, and does their 
expression correlate with tamoxifen response?

## Background
Luminal breast cancer accounts for ~70% of all breast cancer 
cases and is characterised by estrogen receptor α (ERα) 
expression. While anti-ER therapies such as tamoxifen and 
fulvestrant are the standard of care, resistance remains a 
major clinical challenge.

FGFR2-dependent signalling (via MAPK/ERK and PI3K/AKT 
pathways) has been shown to regulate ERα post-translational 
modifications, potentially altering receptor stability, 
transcriptional activity, and response to anti-ER drugs. 
Key ERα target genes — *PGR*, *IRS1*, and *BCL2L1* — serve 
as readouts of ERα transcriptional activity in this context.

This project uses publicly available RNA-seq data to 
investigate transcriptomic differences between luminal 
subtypes and tamoxifen-sensitive vs. resistant tumours, 
focusing on the FGFR2-ERα axis.

## Data
- **Source:** NCBI GEO
- **Dataset:** GSE25066 (n=508, primary breast tumours, 
  tamoxifen-treated, with treatment response annotation)
- **Access:** public, no registration required

## Methods
- Data retrieval: `GEOquery` (R/Bioconductor)
- Quality control & normalisation
- Differential expression analysis: `DESeq2`
- Visualisation: `ggplot2` — volcano plot, heatmap, PCA
- Gene set of interest: FGFR2, ESR1, PGR, IRS1, BCL2L1, 
  MAPK/ERK and PI3K/AKT pathway genes

## Repository structure
    ├── README.md
    ├── data/
    │   └── raw/          # not tracked by git — see Data section
    ├── notebooks/
    │   └── 01_data_exploration.Rmd
    ├── scripts/
    │   └── 01_download_data.R
    ├── results/
    │   ├── figures/
    │   └── tables/
    ├── environment/
    │   └── session_info.txt
    └── .gitignore

## How to reproduce
1. Clone this repository
2. Install R dependencies (see `environment/session_info.txt`)
3. Run `scripts/01_download_data.R` to download raw data from GEO
4. Open `notebooks/01_data_exploration.Rmd` and knit

## Status
🚧 In progress — data download and QC

## Author
Maria Szczerbińska  
MSc Bioinformatics & Systems Biology, University of Warsaw  
github.com/mszczerbinska
