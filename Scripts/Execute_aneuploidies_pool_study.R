#!/usr/bin/env Rscript

args <- commandArgs(TRUE)

library(rmarkdown)
library(stringr)

rmarkdown::render("/Scripts/create_aneuploidies_report_V3.Rmd", 
                  params = list(pool_data = args[1], 
                                control_data = args[2], 
                                synthetic_data = args[3], 
                                synthetic = args[4], 
                                best_norms = args[5]), 
                  output_file = ifelse(str_sub(args[6], -1) == "/", paste0(args[6], args[7]), paste0(args[6], "/", args[7])))
