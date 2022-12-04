library(tidyverse)
library(glue)

day <- "04"
input_file <- glue("../input/day-{day}.txt")

input <- read_delim(input_file, ",", col_names  = FALSE)



# part 1
x <- input %>% 
  separate(X1, into = c("X11", "X12")) %>% 
  separate(X2, into = c("X21", "X22")) %>% 
  mutate(across(.fns = ~ as.integer(.x)),
         
         XX1 = map2(X11, X12, ~ seq(.x, .y)),
         XX2 = map2(X21, X22, ~ seq(.x, .y)),

         O = map2(XX1, XX2, ~ intersect(.x, .y)),

         fully_contain = map2_lgl(XX1, O, ~ length(.x) == length(.y)) | map2_lgl(XX2, O, ~ length(.x) == length(.y))) 

# solution part 1
sum(x$fully_contain)
