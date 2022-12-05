library(tidyverse)

day <- "05"
input_file <- glue::glue("../input/day-{day}.txt")



input <- read_lines(input_file)

change <- match("", input)

stacks <- input[seq(change-2)] %>% 
  str_split("", simplify = TRUE) %>% 
  .[, seq(2, ncol(.), 4)] %>% 
  na_if(" ")

stacks <- rbind(matrix(NA, sum(!is.na(stacks)) - nrow(stacks), ncol(stacks)), stacks)

procedure <- input[(change+1):length(input)] %>% 
  str_split(" ", simplify = TRUE)



# part 1
new_stacks <- stacks

for (p in seq(nrow(procedure))) {
  
  move <- procedure[p, 2] %>% as.integer()
  from <- procedure[p, 4] %>%  as.integer()
  to <- procedure[p, 6] %>% as.integer()
  
  for (m in seq(move)) {
    
    not_na <- colSums(is.na(new_stacks))+1
    new_stacks[not_na[to]-1, to] <- new_stacks[not_na[from], from]
    new_stacks[not_na[from], from] <- NA
          
  }

}

not_na <- colSums(is.na(new_stacks))+1 
not_na <- cbind(not_na, seq(ncol(new_stacks)))

# solution part 1
new_stacks[not_na] %>% paste(collapse = "")



# part 2
new_stacks <- stacks

for (p in seq(nrow(procedure))) {
  
  move <- procedure[p, 2] %>% as.integer()
  from <- procedure[p, 4] %>%  as.integer()
  to <- procedure[p, 6] %>% as.integer()
  
  not_na <- colSums(is.na(new_stacks))+1
  
  for (m in seq(move)) {
    
    new_stacks[not_na[to]-move+m-1, to] <- new_stacks[not_na[from]+m-1, from]
    new_stacks[not_na[from]+m-1, from] <- NA
    
  }
  
}

not_na <- colSums(is.na(new_stacks))+1 
not_na <- cbind(not_na, seq(ncol(new_stacks)))

# solution part 2
new_stacks[not_na] %>% paste(collapse = "")
