library(tidyverse)
library(glue)

day <- "01"
input_file <- glue("examples/day-{day}.txt")

# keep appropriate alternative
input <- read_file(input_file)
input <- tibble(x = read_lines(input_file))
input <- scan(input_file, sep = ",")
