### December 3rd

#### Part One
library(tidyverse)

dat <- readLines(here::here("2024", "day3_dat1.txt")) |> str_flatten()

mat <- dat |> 
  str_remove_all("don.t\\(\\).*?(do\\(\\)|$)") |>
  str_extract_all("(?<=mul\\()\\d{1,3},\\d{1,3}(?=\\))") |>
  unlist() |>
  str_split(",") |>
  unlist() |>
  as.numeric() |>
  matrix(ncol = 2, byrow = TRUE) 

mat[,1] %*% mat[,2]

#76911921
