
# Skeleton file 2 for Assignment 1 in BAN400. 
# -------------------------------------------

# More detailed steps to complete Problem 1.

library(tidyverse)    # Contains most of what we need.

# Read the data from URL
raw_file <- readLines(con = "http://www.sao.ru/lv/lvgdb/article/suites_dw_Table1.txt", warn=FALSE)
raw_file

# Identify the line number L where the first two characters == "--"

L <- 
  (substr(x = raw_file, start = 1, stop = 2) == "--") %>% 
  which() %>% 
  min()

# Store the information about the variables in a seperate text file.
cat(raw_file[1:(L-2)], sep = "\n", file = "description_of_variable.txt")

# Extract the variable names in L-1

variable_names <- 
  str_split(string = raw_file[L-1], pattern = "\\|") %>% 
  unlist() %>% 
  str_trim()

# Rewrite data to a csv table
comma_separated_values <- 
  raw_file[L+1:length(raw_file)] %>% 
  gsub("\\|", ",", .) %>% 
  gsub(" ", "", .)


# Add the variable names to the comma seperated table
comma_separated_values_with_names <- 
  c(paste(variable_names, collapse = ","),
    comma_separated_values)    

# Create a new file of the comma seperated table
cat(comma_separated_values_with_names, sep = "\n", file = "galaxy_data.txt")

# Read the data as a csv from the text file. 
galaxies <- read_csv("galaxy_data.txt")

head(galaxies)
