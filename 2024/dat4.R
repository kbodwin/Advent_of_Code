dat <- readLines(here::here("2024", "day4_dat1.txt"))

mat <- dat |>
  map(~str_split(.x, "") |> unlist()) |>
  unlist() |>
  matrix(nrow = length(dat), byrow = TRUE)


## Part One

n <- nrow(mat)

diags <- map(-n:n, ~ mat[row(mat) == col(mat) + .x]) |>
  map_chr(str_flatten)

p <- ncol(mat)

diags2 <- map(-p:p, ~ mat[p-row(mat)+1 == col(mat) + .x]) |>
  map_chr(str_flatten)

rows <- map_chr(1:n, ~str_flatten(mat[.x,]))
cols <- map_chr(1:p, ~str_flatten(mat[,.x]))


all_seqs <- c(diags, diags2, rows, cols)

xmas <- str_count(all_seqs, "XMAS") |> sum()
samx <- str_count(all_seqs, "SAMX") |> sum()

xmas + samx

## Part Two

corners <- function(row, col) {
  
  mat[c(row-1, row+1), c(col-1, col+1)]
  
}

check_corners <- function(cmat) {
  sum(cmat == "M") == 2 &
    sum(cmat == "S") == 2 &
    cmat[1,1] != cmat[2,2]
}

a_locs <- which(mat == "A", arr.ind = TRUE) |>
  data.frame() |>
  filter(row > 1 & row < 140 & col > 1 & col < 140)

all_corners <- pmap(a_locs, corners) 

all_corners |>
  map_lgl(check_corners) |>
  sum()

# 
# 
# 
# ### I had some weird idea about shifting binary  matrices and multiplying them, but I couldn't make it work.
# 
# library(matrixcalc)
# 
# is_x <- mat == "X"
# is_m <- mat == "M"
# is_a <- mat == "A"
# is_s <- mat == "S"
# 
# shifts <- expand.grid(c(0, 1, -1), c(0, 1, -1))
# 
# rowseq <- 1:nrow(mat)
# colseq <- 1:ncol(mat)
# 
# for (i in 1:nrow(shifts)) {
#   
#   ud <- shifts$Var1[i]
#   rl <- shifts$Var2[i]
#   
#   sum(is_x + shift.right(is_m, lr) + shift.right(is_a, lr*2) + shift.right(is_s, lr*3))
#   
# }
