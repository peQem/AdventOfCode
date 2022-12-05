library(tidyverse)


day <- "05"
input_file <- glue::glue("../examples/day-{day}.txt")




# keep appropriate alternative
input <- tibble(drawing = read_lines(input_file))
