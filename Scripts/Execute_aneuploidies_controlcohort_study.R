#!/usr/bin/env Rscript

args <- commandArgs(TRUE)

library(rmarkdown)
library(stringr)

rmarkdown::render("./Scripts/Automatic_study_of_aneuplidies_control_cohort_V3.Rmd", 
                  params = list(control_data = args[1], 
                                bed_file = args[2], 
                                genome = args[3],
                                threshold = as.numeric(args[4]),
                                threshold_signif = as.numeric(args[5]), 
                                output_dir = ifelse(str_sub(args[6], -1) == "/", args[6], paste0(args[6], "/"))), 
                  output_file = ifelse(str_sub(args[6], -1) == "/", paste0(args[6], args[7]), paste0(args[6], "/", args[7])))