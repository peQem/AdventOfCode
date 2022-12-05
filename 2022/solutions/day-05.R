library(tidyverse)


day <- "05"
input_file <- glue::glue("../examples/day-{day}.txt")




# keep appropriate alternative
input <- read_lines(input_file)

change <- match("", input)

stacks <- input[seq(change-2)] %>% 
  strsplit("") %>% 
  unlist() %>% 
  matrix(nrow = (change-2), byrow = TRUE) %>% 
  .[, seq(2, ncol(.), 4)] %>% 
  na_if(" ")

stacks <- rbind(matrix(NA, sum(!is.na(stacks)) - ncol(stacks), nrow(stacks)), stacks)
