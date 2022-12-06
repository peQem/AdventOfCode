library(tidyverse)

day <- "06"
input_file <- glue::glue("../input/day-{day}.txt")

input <- read_lines(input_file)



# part 1
x <- input %>%
  str_split("", simplify = TRUE) %>% 
  t() %>% 
  tibble(X1 = .) %>% 
  mutate(X2 = lag(X1),
         X3 = lag(X2),
         X4 = lag(X3))

marker <- apply(x, 1, function(x) length(unique(na.omit(x))))


# solution part 1
which.max(marker == 4)
