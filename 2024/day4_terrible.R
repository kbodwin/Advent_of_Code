dat <- readLines(here::here("2024", "day4_test.txt"))

n <- str_length(dat[1])

# horizontal: can't be on line break
n_horiz_r <- dat |> str_count("XMAS") |> sum()
n_horiz_l <- dat |> str_count("SMAX") |> sum()

## vertical: 9 letters apart

all_let <- dat |>
  str_flatten() 

n_vert <- str_count(all_let, "X(?=.{9}M.{9}A.{9}S)") +
  str_count(all_let, "(?<=S.{9}A.{9}M.{9})X")

## diagonal right = letters 10 apart
## diagonal left = letters 8 apart
## BUT can't circle a boundary

all_let <- dat |>
  str_flatten(collapse=",") 

n_diag_r <- str_count(all_let, "X(?=[^,]{3}.{8}M[^,]{2}.{9}A[^,].{10}S)") +
  str_count(all_let, "S(?=[^,]{3}.{8}A[^,]{2}.{9}M[^,].{10}X)")

n_diag_l <- str_count(all_let, "(?<=[^,]{3})X(?=.{7}[^,]{2}M.{8}[^,]A.{9}S)") +
  str_count(all_let, "(?<=[^,]{3})S(?=.{7}[^,]{2}A.{8}[^,]M.{9}X)")


n_diag_r + n_diag_l + n_vert + n_horiz_l + n_horiz_r

###
  
dat <- readLines(here::here("2024", "day4_dat1.txt"))

n <- str_length(dat[1])

# horizontal: can't be on line break
n_horiz_r <- dat |> str_count("XMAS") |> sum()
n_horiz_l <- dat |> str_count("SMAX") |> sum()

## vertical: 139 letters apart

all_let <- dat |>
  str_flatten() 

n_vert <- str_count(all_let, "X(?=.{139}M.{139}A.{139}S)") +
  str_count(all_let, "(?<=S.{139}A.{139}M.{139})X")

## diagonal right = letters 140 apart
## diagonal left = letters 138 apart
## BUT can't circle a boundary

all_let <- dat |>
  str_flatten_comma() 

n_diag_r <- str_count(all_let, "X(?=[^,]{3}.{138}M[^,]{2}.{139}A[^,].{140}S)") +
  str_count(all_let, "(?<=S[^,]{3}.{138}A[^,]{2}.{139}M[^,].{140})X")

n_diag_l <- str_count(all_let, "[^,]{3}X(?=.{136}[^,]{2}M.{137}[^,]A.{138}S)") +
  str_count(all_let, "(?<=[^,]{3}S.{136}[^,]{2}A.{137}[^,]M.{138})X")


n_diag_r + n_diag_r + n_vert + n_horiz_r + n_horiz_l
