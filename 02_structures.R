NA == 0
NA == "NA"
NA == FALSE
NA == NaN
NA == NA
Petya_height <- NA
Masha_height <- NA
Petya_height == Masha_height
NA == NA

n <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34)
n[5] <- NA
n
mean(n)
n == NA
is.na(n)
!is.na(n)
mean(n[!is.na(n)])

#Задание:
#посчитать среднее вектора n, выкинув NA альтернативным способом:

mean(n, na.rm = TRUE)

c("a", NA)
c(FALSE, NA)
class(NA)

as.character(c(1:3, NA))
#NA_character_
NaN
is.na(NA)
is.na(NaN)
is.nan(NA)
is.nan(NaN)

NA ^ 0
"1" ^ 0
NA_character_ ^ 0

eyes <- c("green", "blue", "blue", "brown", "green", "blue")
eyes == "blue"
sum(eyes == "blue")
#sum(eyes == "blue")/length(eyes)
mean(eyes == "blue")
mean(eyes == "blue") * 100
paste0(mean(eyes == "blue") * 100, "%")

all(eyes == "blue")
any(eyes == "blue")

eyes == "blue"
which(eyes == "blue")
eyes
eyes[eyes == "blue"]
eyes[eyes == "blue" | eyes == "green"]

eyes[eyes == c("green", "blue")] #нежелательный ресайклинг

eyes %in% c("green", "blue")
eyes[eyes %in% c("green", "blue")]

big_cities <- c("Москва", "Санкт-Петербург", "Новосибирск", "Казань", "Екатеринбург")
respondents_cities <- c("Москва", "Балашиха", "Новосибирск",
                        "Москва", "Москва", "Тбилиси", "Саратов",
                        "Санкт-Петербург")
respondents_cities[respondents_cities %in% big_cities]


# Матрицы -----------------------------------------------------------------

matrix(1:20, nrow = 5, ncol = 4)

A <- matrix(1:20, nrow = 5)

A[1, 2] <- 1000
A
A[2:4, 1:2]
A[c(1, 3, 5), 1:2]
A[c(1, 3, 5), c(TRUE, FALSE, FALSE, TRUE)]
A[2:4, ]
A[, 1:2]
A[-3,]
#A[, -1:4]
A
attributes(A)
attr(A, "dim") <- NULL
A
attr(A, "dim") <- c(2, 10)
A
A[3:8]
attr(A, "dim") <- c(2, 2, 5)
A
A[2, 1, 4]

M1 <- matrix(1, nrow = 4, ncol = 4)
M1[2:3, 2:3] <- 2
M1
M1[2,]
M1[,2]
# M1[1,1, drop = FALSE]
# `[`(M1, 1, 1, drop = FALSE)
simple_list <- list(42, "Hi, everyone", TRUE)
simple_list
complex_list <- list(10,
                     1:10,
                     letters,
                     simple_list,
                     A,
                     `[`)
complex_list
str(complex_list)

named_list <- list(name = "Akakii",
     age = 768,
     student = TRUE)

named_list["name"]
named_list$name

named_list[1]
named_list[[1]]
class(named_list$name)
class(named_list[[1]])
named_list[1]

complex_list[[2]][5:7]
class(named_list$age)
named_list['age']
named_list[2]

complex_list
named_list2 <- list(first_list = named_list,
                    some_vec = 1:10)
named_list2
named_list2$some_vec[c(TRUE, FALSE)]
named_list2$first_list$age
