dnorm(0)
dnorm(1)
dnorm(-1)
dnorm(3)
dnorm(-3)
vec <- seq(-3, 3, by = .1)
vec
dnorm(vec)
plot(vec, dnorm(vec))

iq <- seq(50, 150, by = .1)
dnorm(iq, mean = 100, sd = 15)
plot(iq, dnorm(iq, mean = 100, sd = 15))

pnorm(100, mean = 100, sd = 15)
pnorm(130, mean = 100, sd = 15)
pnorm(95, mean = 100, sd = 15)
plot(iq, pnorm(iq, mean = 100, sd = 15))

set.seed(42)
rnorm(30, mean = 100, sd = 15)

set.seed(42)
samp <- rnorm(100, mean = 100, sd = 15)
samp
hist(samp)
hist(rnorm(10000, mean = 100, sd = 15))
hist(rnorm(20, mean = 100, sd = 15))
mean(samp)
mean(rnorm(1000000, mean = 100, sd = 15))

sd(samp)

sample_means <- replicate(1000000,
          mean(rnorm(100, mean = 100, sd = 15)))
hist(sample_means)
mean(sample_means)
sd(sample_means)
15 / sqrt(100)

samp_se <- sd(samp)/sqrt(length(samp))
mean(samp) - 1.96 * samp_se
mean(samp) + 1.96 * samp_se

hist(rlnorm(1000), breaks = 100)

sample_log_means <- replicate(10000,
                          mean(rlnorm(10000)))
hist(sample_log_means, breaks = 100)

z <- (mean(samp) - 100)/(15/sqrt(length(samp)))

1 - pnorm(z)
(1 - pnorm(z)) * 2
