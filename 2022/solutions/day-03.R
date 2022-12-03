library(tidyverse)
library(glue)

day <- "03"
input_file <- glue("../examples/day-{day}.txt")


input <-read_lines(input_file)
