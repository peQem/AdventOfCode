library(tidyverse)

day <- "06"
input_file <- glue::glue("../input/day-{day}.txt")

input <- read_lines(input_file) %>% 
  str_split("", simplify = TRUE) %>% 
  t()



# part 1
x <- input %>%
  tibble(X1 = .) %>% 
  mutate(X2 = lag(X1),
         X3 = lag(X2),
         X4 = lag(X3))

marker <- apply(x, 1, function(x) length(unique(na.omit(x))))

# solution part 1
which.max(marker == 4)



# part 2
window <- 14

x <- runner::runner(
  x = input,
  k = window,
  f = paste0,
  collapse = ""
)

marker <- apply(str_split(x, "", simplify = TRUE), 1, function(z) length(unique(na.omit(z))))

# solution part 2
which.max(marker[seq(-1, -window)] == window) + window
