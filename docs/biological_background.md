# Biological Background

This document provides extended biological context for the analyses 
in this repository. For technical/methodological details, see the 
main [README](../README.md).

---

## Luminal breast cancer

Breast cancer is not a single disease but a collection of molecularly 
distinct subtypes. Luminal breast cancer - defined by expression of 
the estrogen receptor α (ERα) - is the most common subtype, accounting 
for roughly 70% of all cases. Because these tumours depend on estrogen 
signalling to grow, they are typically treated with endocrine 
(anti-ER) therapies such as tamoxifen or fulvestrant, rather than 
chemotherapy alone.

While endocrine therapy has substantially improved outcomes, a 
significant proportion of patients develop resistance - either from 
the start (intrinsic resistance) or over time (acquired resistance). 
Understanding the molecular basis of this resistance is an active 
area of breast cancer research.

---

## The estrogen receptor (ERα) and its regulation

ERα is a ligand-activated transcription factor. When bound by 
estrogen, it translocates to the nucleus, binds estrogen response 
elements (EREs) in DNA, and activates transcription of target genes 
involved in cell proliferation and survival.

Beyond ligand binding, ERα activity is fine-tuned by post-translational 
modifications - chemical changes added to the protein after it is made, 
such as phosphorylation, SUMOylation, and ubiquitination. These 
modifications can alter ERα's stability, localisation, and 
transcriptional activity, independently of estrogen levels.

## FGFR2 signalling and its link to ERα

FGFR2 (Fibroblast Growth Factor Receptor 2) is a membrane receptor 
that, upon activation, triggers intracellular signalling cascades 
(MAPK/ERK and PI3K/AKT pathways). These pathways are known to 
converge on ERα and modify its post-translational state - potentially 
altering how tumour cells respond to anti-ER drugs.

Notably, this relationship is thought to act largely through protein 
modification rather than through changes in gene transcription. This 
matters for interpreting the analyses in this repository: transcriptomic 
data (like the microarray data used here) can show whether FGFR2 or 
ERα *genes* are turned up or down, but it cannot directly capture 
whether the ERα *protein* is being chemically modified by active FGFR2 
signalling. This distinction is discussed further in the Results 
section of the main README.

---

## Genes analysed in this project

| Gene | Role | Relevance here |
|------|------|-----------------|
| **ESR1** | Encodes ERα itself | Core marker of luminal identity and endocrine therapy dependence |
| **PGR** | Progesterone receptor, a direct ERα target gene | Read-out of active ERα transcriptional signalling |
| **IRS1** | Insulin receptor substrate 1, links growth factor and estrogen signalling | Marker of luminal, growth-factor-responsive tumour biology |
| **FGFR2** | Membrane receptor tyrosine kinase | Proposed modulator of ERα post-translational state and anti-ER response |
| **BCL2L1** | Anti-apoptotic gene (Bcl-xL) | Included as a broader survival/apoptosis-related gene, less subtype-specific |

---

## Clinical terms used in this repository

- **pCR (pathological complete response):** no detectable residual 
  tumour after treatment - indicates strong treatment sensitivity.
- **RD (residual disease):** tumour tissue remains after treatment - 
  indicates incomplete response, often associated with resistance.
- **DRFS (distant relapse-free survival):** the time from treatment 
  until cancer spreads to a distant site (or the patient's data is 
  censored, i.e. follow-up ends without a relapse being observed).
- **Kaplan-Meier curve:** a standard way to visualise survival data 
  over time, accounting for censored patients.
- **Log-rank test:** a statistical test used to compare survival 
  between two or more groups.

---

## Why this matters clinically

Identifying transcriptomic or molecular signatures associated with 
anti-ER resistance could eventually help clinicians predict which 
patients are unlikely to benefit from tamoxifen alone, and might 
instead need combination therapies - for example, pairing anti-ER 
drugs with FGFR-targeted agents. This is an example of how 
computational analysis of public datasets can generate hypotheses 
that inform future experimental or clinical research.

---

## Key references

The biological framework in this repository draws on the following 
literature (full list of the author's BSc thesis references available 
on request):

- Piasecka et al. (2019), *J Exp Clin Cancer Res* - FGFR signalling 
  and steroid hormone receptor regulation in luminal breast cancer
- Mieczkowski et al. (2022), *Mol Oncol* - FGF7/FGFR2 signalling in 
  luminal breast cancer
- Medunjanin et al. (2010), *Mol Biol Cell* - ERα phosphorylation and 
  transcriptional activity
