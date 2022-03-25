#############################
## Load required libraries ##
#############################
suppressPackageStartupMessages(library("rmarkdown", character.only = TRUE, quietly = TRUE))
suppressPackageStartupMessages(library("optparse", character.only = TRUE, quietly = TRUE))


####################
## Read arguments ##
####################
option_list = list(
  
  make_option(c("-d", "--document_Rmd"), type = "character", default = NULL, 
              help = "A Rmd document. Mandatory input.", metavar = "character")
  
);
message("; Reading arguments from command-line")
opt_parser = OptionParser(option_list = option_list);
opt = parse_args(opt_parser);

Rmd.doc <- opt$document_Rmd


## Mandatory input
if (!file.exists(Rmd.doc)) {
  stop("Mandatory input file not found: ", Rmd.doc)
}

##########################
## Generate html report ##
##########################
rmarkdown::render(Rmd.doc)