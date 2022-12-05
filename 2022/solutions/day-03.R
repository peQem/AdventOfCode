library(tidyverse)
library(glue)

day <- "03"
input_file <- glue("../input/day-{day}.txt")

input <- read_lines(input_file) %>% tibble(input = .)



# part 1
priority <- set_names(c(1:52), c(letters, LETTERS))

x <- input %>% 
  mutate(compartment1 = substring(input, 1, nchar(input)/2),
         compartment2 = substring(input, nchar(input)/2+1),
         
         items1 = strsplit(compartment1, ""),
         items2 = strsplit(compartment2, ""),
         
         common_item = map2_chr(items1, items2, ~ intersect(.x, .y)),
         priority = priority[common_item])

# solution part 1
sum(x$priority)



# part 2
y <- x %>% 
  mutate(group_id = (row_number() - 1) %/% 3) %>% 
  group_by(group_id) %>% 
  
  summarise(group_input = list(input)) %>% 
  
  mutate(group_items =  map(group_input, ~ strsplit(.x, "")),
         
         common_item = map_chr(group_items, ~ intersect(intersect(.x[[1]], .x[[2]]), .x[[3]])),
         
         priority = priority[common_item])

# solution part 2
sum(y$priority)
