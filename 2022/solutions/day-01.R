library(tidyverse)
library(glue)

day <- "01"
input_file <- glue("../input/day-{day}.txt")

input <- read_lines(input_file) %>% as.numeric()



# part 1
x <- c(input, NA) %>% replace_na(0) %>% cumsum()
x <- x[x == lead(x)]
x <- c(x, 0) - c(0, x)

# solution part 1
max(x, na.rm = TRUE)

# solution part 2
sort(x) %>% tail(3) %>% sum()
