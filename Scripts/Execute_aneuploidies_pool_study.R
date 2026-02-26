#!/usr/bin/env Rscript

args <- commandArgs(TRUE)

library(rmarkdown)
library(stringr)

rmarkdown::render("./Scripts/create_aneuploidies_report_V3.Rmd", 
                  params = list(pool_data = args[1], 
                                control_data = args[2], 
                                synthetic_data = args[3], 
                                synthetic = args[4], 
                                best_norms = args[5], 
                                threshold_signif = as.numeric(args[6]), 
                                output_dir = ifelse(str_sub(args[7], -1) == "/", args[7], paste0(args[7], "/"))),
                  output_file = ifelse(str_sub(args[7], -1) == "/", paste0(args[7], args[8]), paste0(args[7], "/", args[8])))
