#!/usr/bin/env Rscript

args <- commandArgs(TRUE)

library(stringr)

pool.loc <- args[1]
files <- list.files(pool.loc, pattern = args[2] ,recursive = TRUE, full.names = TRUE)

RDats <- list()

for(f in files){
  load(f)
  RDats[[length(RDats)+1]] <- pool_coverage_values
}

pool_coverage_values <- do.call(rbind, RDats)

outdir <- args[3]

if(str_sub(outdir, -1) == "/"){
  save(pool_coverage_values, file = paste0(outdir, args[4]))
} else{
  save(pool_coverage_values, file = paste0(outdir, "/", args[4]))
}