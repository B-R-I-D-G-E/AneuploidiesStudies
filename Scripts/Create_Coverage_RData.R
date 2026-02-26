#!/usr/bin/env Rscript

args <- commandArgs(TRUE)

library(dplyr)
library(stringr)

pool.loc <- args[1]
pool <- list.files(pool.loc, pattern = "*.coverage$" ,recursive = TRUE, full.names = TRUE)

pool_coverage_values <- as.data.frame(matrix(NA , length(pool), 48 ))
colnames(pool_coverage_values) <- c("Sample", "Chr1_mean", "Chr2_mean", "Chr3_mean", "Chr4_mean", "Chr5_mean", "Chr6_mean", "Chr7_mean", 
                             "Chr8_mean", "Chr9_mean", "Chr10_mean", "Chr11_mean", "Chr12_mean", "Chr13_mean", "Chr14_mean", 
                             "Chr15_mean", "Chr16_mean", "Chr17_mean", "Chr18_mean", "Chr19_mean", "Chr20_mean", "Chr21_mean", 
                             "Chr22_mean", "ChrX_mean", "ChrY_mean", "autosomes_mean", "No1_mean", "No2_mean", "No3_mean", "No4_mean", 
                             "No5_mean", "No6_mean", "No7_mean", "No8_mean", "No9_mean", "No10_mean", "No11_mean", "No12_mean", "No13_mean", 
                             "No14_mean", "No15_mean", "No16_mean", "No17_mean", "No18_mean", "No19_mean", "No20_mean", "No21_mean", "No22_mean")

for (i in 1:length(pool)){
  cov_doc <- read.delim2(pool[i],header = F)
  pool_coverage_values[i,1] <- pool[i] %>% gsub("^.*/","",.)  %>% gsub("_aligned.*|\\.QCalign.*","",.)
  pool_coverage_values[i,2] <- cov_doc %>% dplyr::filter(V1 == "chr1") %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,3] <- cov_doc %>% dplyr::filter(V1 == "chr2") %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,4] <- cov_doc %>% dplyr::filter(V1 == "chr3") %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,5] <- cov_doc %>% dplyr::filter(V1 == "chr4") %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,6] <- cov_doc %>% dplyr::filter(V1 == "chr5") %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,7] <- cov_doc %>% dplyr::filter(V1 == "chr6") %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,8] <- cov_doc %>% dplyr::filter(V1 == "chr7") %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,9] <- cov_doc %>% dplyr::filter(V1 == "chr8") %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,10] <- cov_doc %>% dplyr::filter(V1 == "chr9") %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,11] <- cov_doc %>% dplyr::filter(V1 == "chr10") %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,12] <- cov_doc %>% dplyr::filter(V1 == "chr11") %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,13] <- cov_doc %>% dplyr::filter(V1 == "chr12") %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,14] <- cov_doc %>% dplyr::filter(V1 == "chr13") %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,15] <- cov_doc %>% dplyr::filter(V1 == "chr14") %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,16] <- cov_doc %>% dplyr::filter(V1 == "chr15") %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,17] <- cov_doc %>% dplyr::filter(V1 == "chr16") %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,18] <- cov_doc %>% dplyr::filter(V1 == "chr17") %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,19] <- cov_doc %>% dplyr::filter(V1 == "chr18") %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,20] <- cov_doc %>% dplyr::filter(V1 == "chr19") %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,21] <- cov_doc %>% dplyr::filter(V1 == "chr20") %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,22] <- cov_doc %>% dplyr::filter(V1 == "chr21") %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,23] <- cov_doc %>% dplyr::filter(V1 == "chr22") %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,24] <- cov_doc %>% dplyr::filter(V1 == "chrX") %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,25] <- cov_doc %>% dplyr::filter(V1 == "chrY") %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,26] <- cov_doc %>% dplyr::filter(! V1 %in% c("chrX", "chrY")) %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,27] <- cov_doc %>% dplyr::filter(! V1 %in% c("chrX", "chrY", "Chr1")) %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,28] <- cov_doc %>% dplyr::filter(! V1 %in% c("chrX", "chrY", "Chr2")) %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,29] <- cov_doc %>% dplyr::filter(! V1 %in% c("chrX", "chrY", "Chr3")) %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,30] <- cov_doc %>% dplyr::filter(! V1 %in% c("chrX", "chrY", "Chr4")) %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,31] <- cov_doc %>% dplyr::filter(! V1 %in% c("chrX", "chrY", "Chr5")) %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,32] <- cov_doc %>% dplyr::filter(! V1 %in% c("chrX", "chrY", "Chr6")) %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,33] <- cov_doc %>% dplyr::filter(! V1 %in% c("chrX", "chrY", "Chr7")) %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,34] <- cov_doc %>% dplyr::filter(! V1 %in% c("chrX", "chrY", "Chr8")) %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,35] <- cov_doc %>% dplyr::filter(! V1 %in% c("chrX", "chrY", "Chr9")) %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,36] <- cov_doc %>% dplyr::filter(! V1 %in% c("chrX", "chrY", "Chr10")) %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,37] <- cov_doc %>% dplyr::filter(! V1 %in% c("chrX", "chrY", "Chr11")) %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,38] <- cov_doc %>% dplyr::filter(! V1 %in% c("chrX", "chrY", "Chr12")) %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,39] <- cov_doc %>% dplyr::filter(! V1 %in% c("chrX", "chrY", "Chr13")) %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,40] <- cov_doc %>% dplyr::filter(! V1 %in% c("chrX", "chrY", "Chr14")) %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,41] <- cov_doc %>% dplyr::filter(! V1 %in% c("chrX", "chrY", "Chr15")) %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,42] <- cov_doc %>% dplyr::filter(! V1 %in% c("chrX", "chrY", "Chr16")) %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,43] <- cov_doc %>% dplyr::filter(! V1 %in% c("chrX", "chrY", "Chr17")) %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,44] <- cov_doc %>% dplyr::filter(! V1 %in% c("chrX", "chrY", "Chr18")) %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,45] <- cov_doc %>% dplyr::filter(! V1 %in% c("chrX", "chrY", "Chr19")) %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,46] <- cov_doc %>% dplyr::filter(! V1 %in% c("chrX", "chrY", "Chr20")) %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,47] <- cov_doc %>% dplyr::filter(! V1 %in% c("chrX", "chrY", "Chr21")) %>% dplyr::summarise(mean(as.numeric(V3)))
  pool_coverage_values[i,48] <- cov_doc %>% dplyr::filter(! V1 %in% c("chrX", "chrY", "Chr22")) %>% dplyr::summarise(mean(as.numeric(V3)))
  print(paste(i, length(pool), sep = "/"))
}

if(str_sub(pool.loc, -1) == "/"){
  save(pool_coverage_values, file = paste0(pool.loc, args[2]))
} else{
  save(pool_coverage_values, file = paste0(pool.loc, "/", args[2]))
}
