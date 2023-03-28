
# Operators ---------------------------------------------------------------

2 + 2 - 3
2 - 1
5 * 6
99 / 9
2 ^ 3
2 ** 3
13 / 3
13 %/% 3
13 %% 3
3 + 4 - 5
(2 + 2) * 2
16 ^ 0.5


# Functions ---------------------------------------------------------------


sqrt(16)
log(8) #this function calculates logarithm
?log
log(x = 8, base = 2)
log(8, 2)

`+`(10, 12) #оператор -- это тоже функция!

a = 2 * 2
a
b <- 3
a + b
some_variable <- 3 + 4
xxx <- 4 + 50

a == b
a != b

5 != 120

a > b
a < b
a >= b
a >= a
a <= b
a <= a
typeof(2/5)
1/3
cos(pi/2)
2 == sqrt(2) ^ 2
2 ^ 40
typeof(6 + 5i)
typeof(6)
typeof(as.integer(6))
typeof(6L)

s <- "hi, everyone"
#s <- 'hi, "everyone"'
s
nchar(s)
paste("I", "love", "R", sep = "__<3__")
paste("I", "love", "R", sep = "")
paste0("I", "love", "R")

tolower(paste0("I", "love", "R"))
toupper(paste0("I", "love", "R"))

t1 <- TRUE
class(t1)
f1 <- FALSE

comparison <- a < b
!t1
!f1
!!t1
t1 & t1 #only this one is true
t1 & f1
f1 & t1
f1 & f1

f1 | f1
f1 | t1
t1 | f1
t1 | t1

#xor(t1, t1)

c(4, 8, 15, 16, 23, 42)

c("Hey", "Hey", "Ha")
paste("Hey", "Hey", "Ha")

c(TRUE, FALSE)
с("hey", "hey")

1:10
5:-3

seq(10, 100, by = 10)
seq(10, 100, length.out = 19)

rep(1, 10)
rep(10, 8)
rep("Hey!", 10)
rep(1:3, c(10, 5, 20))
rep(1:5, each = 10)
c(1:10, 50:60)
sum(1:100)
mean(1:100)
min(1:100)
max(1:100)
c(1:20, 19:1)
#1:20:1 #так не работает!
seq(2000, 2100, by = 4)
c(2000, "hey")
2 + TRUE
2 * FALSE
c(TRUE, 20, "tri")
c(c(TRUE, 20), "tri")
is.integer(6L)
is.character(3)
as.integer(c(TRUE, FALSE))
as.character(1:10)
as.integer(c("1", "2", "tri"))


n <- c(10, 20, 30, 40)
m <- 1:4

n + m
n - m
n * m
n ^ (4:1)

sqrt(1:10)
log(1:10)
n
k <- 0:1
k
n + k
n / k
1 / 0
-0 == 0
-1 / 0
max(1, sqrt(16), Inf)
(1:2)/(1:4)
1/1
2/2
1/3
2/4
0 / 0
m
h <- c(2, 10, 100)
m * h
m * 10
sum(1 / 2 ^ (0:40))
2 ^ 0:20

n <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34)
n[1]
n[length(n)]
head(n, 1)
tail(n, 1)
n[4:7]
n[length(n):1]
m <- rev(n)
n
n[4:6] <- 0
n
n[-1]
n[c(-3, -5, -8)]
n[-3:-8]
n[-(3:8)]
n[c(TRUE, FALSE, TRUE, FALSE, TRUE,
    FALSE, TRUE, FALSE, TRUE, FALSE)]
n[c(TRUE, FALSE)]

n[n > 2]
#c(1:10)
w <- 1:10
v <- c(1:5, 10, 4)
3:10
seq(3, 10, by = 1)
rep(1, 20)
c(3:10, seq(3, 10, by = 1), rep(1, 20), 1000)

n[n > 2 & n < 20]

n <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34)
n[n > 2 & n < 20]

n[n > mean(n)]
named_vector <- c(first = 1, second = 2, third = 3)
named_vector
names(named_vector)
names(named_vector) <- letters[1:3]
exp(1)
LETTERS
month.name
month.abb
named_vector
named_vector["a"]
named_vector[c("a", "c")]
#named_vector["a", "c"]

vec5 <- 1:20
vec5[vec5%%2==0]
(1:10) * 2
seq(2, 20, by = 2)
seq(1, 19, by = 2) + 1
c(2, 4, 6, 8, 10, 12, 14, 16, 18, 20)
(1:20)[c(FALSE, TRUE)]

1:length(letter_soup)
seq_along(letter_soup)
seq(10)
1:length(character(0))
seq_along(character(0))

letter_soup <- c(rbind(letters, LETTERS))
letter_numbers = (1:length(letter_soup))
vec <- letter_numbers[letter_soup == toupper(letter_soup) & letter_numbers <= 20]
print(vec)

(function (x) x[(x>1) & (x < 21) & (x %% 2 == 0)])(0:1000)
seq(2,20, length.out=10)

Vec <- c(1:20) *c(0, 1)
Vec[Vec]
