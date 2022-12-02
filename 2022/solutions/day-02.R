library(tidyverse)
library(glue)

day <- "02"
input_file <- glue("input/day-{day}.txt")


input <-read_delim(input_file, delim = " ", col_names = c("opponent", "player"))


x <- input %>% 
  mutate(player = str_replace_all(player, c("X" = "A", "Y" = "B", "Z" = "C"))) %>% 
  mutate(shape_score = str_replace_all(player, c("A" = "1", "B" = "2", "C" = "3")),
         shape_score = as.numeric(shape_score)) %>% 
  mutate(output_score = case_when(opponent == player ~ 3,
                                  opponent == "A" & player == "B" ~ 6,
                                  opponent == "B" & player == "C" ~ 6,
                                  opponent == "C" & player == "A" ~ 6,
                                  TRUE ~ 0
  ))

# solution part 1
sum(x$shape_score, x$output_score)
