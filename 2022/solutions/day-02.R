library(tidyverse)
library(glue)

day <- "02"
input_file <- glue("input/day-{day}.txt")


# keep appropriate alternative
input <- read_file(input_file)
input <- tibble(x = read_lines(input_file))
input <- scan(input_file, sep = ",")
