library(tidyverse)
library(glue)

day <- "02"
input_file <- glue("../input/day-{day}.txt")

input <- read_delim(input_file, delim = " ", col_names = c("opponent", "player"))



# part 1
x <- input %>% 
  mutate(player = str_replace_all(player, c("X" = "A", "Y" = "B", "Z" = "C")),
         
         shape_score = str_replace_all(player, c("A" = "1", "B" = "2", "C" = "3")),
         shape_score = as.numeric(shape_score),
  
         output_score = case_when(opponent == player ~ 3,
                                  opponent == "A" & player == "B" ~ 6,
                                  opponent == "B" & player == "C" ~ 6,
                                  opponent == "C" & player == "A" ~ 6,
                                  TRUE ~ 0
  ))

# solution part 1
sum(x$shape_score, x$output_score)



# other way
mtx_output <- matrix(c(3L, 6L, 0L,
                       0L, 3L, 6L,
                       6L, 0L, 3L), 
                     nrow = 3, byrow = TRUE, 
                     dimnames = list(c("A", "B", "C"), c("X", "Y", "Z")))

mtx_shape <- matrix(c(1L, 2L, 3L),
                    nrow = 1, dimnames = list(c("M"), c("X", "Y", "Z")))

x <- input %>% 
  mutate(output_score = map2_int(opponent, player, ~ mtx_output[.x, .y]),
         shape_score = map_int(player, ~ mtx_shape[1, .x]))

# solution part 1
sum(x$shape_score, x$output_score)              



# part 2
mtx_strategy <- matrix(c(0L, 3L, 6L),
                    nrow = 1, dimnames = list(c("M"), c("X", "Y", "Z")))

y <- input %>%
  mutate(output_score = map_int(player, ~ mtx_strategy[1, .x]),
         output = map2_chr(opponent, output_score, ~ colnames(mtx_output)[mtx_output[.x ,] == .y]),
         shape_score = map_int(output, ~ mtx_shape[1, .x]))

# solution part 2
sum(y$shape_score, y$output_score)  
