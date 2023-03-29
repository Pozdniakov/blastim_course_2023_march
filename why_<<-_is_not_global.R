a <- 1
b <- 2
f1 <- function() {
  a <- 10
  b <- 20
  f2 <- function() {
    a <- 100
    b <<- 200
    d <<- 300
    print(paste("f2: a=", a))
    print(paste("f2: b=", b))
  }
  f2()
  print(paste("f1: a=", a))
  print(paste("f1: b=", b))
}

f1()
a
b
d
