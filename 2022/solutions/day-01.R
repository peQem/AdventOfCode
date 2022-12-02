library(tidyverse)
library(glue)

day <- "01"
input_file <- glue("input/day-{day}.txt")


input <- read_lines(input_file) %>% as.numeric()


# loop.. bleh..

x <- c()
y <-  0


for ( i in input ) {
  
  if ( is.na(i) ) {
    
    x[length(x)+1] <- y
    y <- 0
    next
    
  }
  
  y <- y + i
  
}

# solution part 1
max(x)
