### December 3rd

#### Part One
library(stringr)
library(purrr)

dat <- readLines(here::here("2024", "day3_dat1.txt"))

mul <- `*`

dat |> 
  str_extract_all("mul\\(\\d{1,3},\\d{1,3}\\)") |>
  unlist() |>
  map_dbl( ~eval(parse(text = .x))) |>
  sum()


#### Part Two

dat |> 
  str_c(collapse = "") |>
  str_split("do(?=(n't)?\\(\\))") |>
  unlist() |>
  str_subset("^n't", negate = TRUE) |>
  str_c(collapse = "") |>
  str_extract_all("mul\\(\\d{1,3},\\d{1,3}\\)") |>
  unlist() |>
  map_dbl(~eval(parse(text = .x))) |>
  sum()
