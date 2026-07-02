# FGFR2-ERα Pathway Expression Analysis in Luminal Breast Cancer

## Biological question
Are genes involved in the FGFR2-ERα signalling axis 
(*FGFR2*, *ESR1*, *PGR*, *IRS1*, *BCL2L1*) differentially expressed 
between tamoxifen-sensitive and tamoxifen-resistant luminal breast 
tumours, and do they correlate with distant relapse-free survival?

## Background
Luminal breast cancer accounts for ~70% of all breast cancer cases 
and is characterised by estrogen receptor α (ERα) expression. 
While anti-ER therapies such as tamoxifen are the standard of care, 
resistance remains a major clinical challenge.

FGFR2-dependent signalling (via MAPK/ERK and PI3K/AKT pathways) has 
been proposed to regulate ERα function through post-translational 
modifications rather than through changes in gene expression alone. 
Key ERα target genes - *PGR* and *IRS1* - serve as readouts of ERα 
transcriptional activity.

This project uses publicly available microarray data to investigate 
transcriptomic differences between tamoxifen-sensitive and resistant 
tumours, and to test whether expression of these genes is associated 
with long-term clinical outcome.

## Data
- **Source:** NCBI GEO
- **Dataset:** GSE25066 (n=508, primary breast tumours, 
  tamoxifen-treated, Affymetrix HGU133A microarray)
- **Annotations used:** pathological response (pCR/RD), 
  distant relapse-free survival (DRFS)
- **Access:** public, no registration required

## Methods
- Data retrieval: `GEOquery` (R/Bioconductor)
- Quality control: expression distribution, PCA
- Differential expression: `limma` (pCR vs RD)
- Survival analysis: Kaplan-Meier estimation and log-rank test 
  (`survival`, `survminer`), median-split high/low expression groups
- Visualisation: `ggplot2`, `pheatmap`

## Key results

### Differential expression (pCR vs RD)
*ESR1* and *PGR* were significantly upregulated in tamoxifen-resistant 
(RD) tumours (adj. p < 0.05, |logFC| > 1), consistent with stronger 
estrogen signalling in resistant disease. *FGFR2* itself showed no 
significant difference in expression between groups.

### Survival analysis (Kaplan-Meier, log-rank test)

| Gene | p-value | Direction |
|------|---------|-----------|
| ESR1 | < 0.0001 | High expression → better DRFS |
| IRS1 | < 0.0001 | High expression → better DRFS |
| PGR | 0.0006 | High expression → better DRFS |
| FGFR2 | 0.037 | High expression → better DRFS |
| BCL2L1 | 0.41 | Not significant |

### Interpretation
*ESR1* and *PGR* show the expected clinical pattern - high expression 
of ERα and its target gene is associated with better long-term outcome 
in this tamoxifen-treated cohort, validating the dataset.

*FGFR2* did not differ between treatment response groups at the 
transcript level, and unexpectedly, higher *FGFR2* expression was 
weakly associated with better - not worse - survival. This is 
consistent with the hypothesis (explored in the author's BSc thesis) 
that FGFR2's role in anti-ER resistance operates primarily through 
post-translational modification of ERα rather than through changes 
in FGFR2 transcript abundance itself. Transcriptomic data alone 
cannot capture this mechanism - it would require protein-level 
analysis (e.g. phosphorylation status).

## Repository structure
├── README.md
├── data/
│   └── raw/                # not tracked by git, see Data section
├── notebooks/
│   ├── 01_data_exploration.Rmd
│   ├── 02_differential_expression.Rmd
│   └── 03_survival_analysis.Rmd
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
4. Run notebooks in order: `01` → `02` → `03`

## Limitations
- Microarray data (not RNA-seq) limits detection of low-abundance 
  transcripts and splice variants
- Median-split for survival groups is a simplification; 
  continuous Cox regression would be more robust
- No multiple testing correction applied to the five-gene survival 
  analysis, as this was a hypothesis-driven, not genome-wide, test

## Status
✅ Complete - data exploration, differential expression, 
and survival analysis

## Author
Maria Szczerbińska  
MSc Bioinformatics & Systems Biology, University of Warsaw  
github.com/mszczerbinska