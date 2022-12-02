library(tidyverse)
library(glue)

day <- "01"
input_file <- glue("input/day-{day}.txt")


input <- read_lines(input_file) %>% as.numeric()

x <- c(input, 0) %>% replace_na(0) %>% cumsum()

x <- x[x == c(x[-1], 0)]

x <- c(x, 0) - c(0,x)


# solution part 1
max(x)

# solution part 2
sort(x) %>% tail(3) %>% sum()
