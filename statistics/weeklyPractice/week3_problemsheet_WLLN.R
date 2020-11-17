# week3 problem class

#  Q3
# verify the Weak Law of Large Numbers (WLLN)

N <- 1000
X <- rexp(N, rate = 2)

Xbar <- cumsum(X) / 1:N # cumulative sum / amount of elements = mean values, E(X) = 1/lambda

par(mfrow = c(2, 1)) # set the plot to 2*1 array

plot(1:N, Xbar,
    main = "Means of samples of increasing size",
    xlab = "N", ylab = "Sample mean"
)
abline(h = 0.5, col = "blue")

# gamma distribution
X2 <- rgamma(N, shape = 2, rate = 2)
Xbar2 <- cumsum(X2) / 1:N
plot(1:N, Xbar2,
    main = "Means of samples of increasing size (Gamma)",
    xlab = "N", ylab = "Sample mean"
)
abline(h = 1, col = "blue")

# Q4
# Monte Carlo integration.

N <- 1000
X <- rexp(N, rate = 2)
Fx <- mean(X <= 1.5) # x less equal 1.5
print(c("estimated value is: ", Fx))

print(c("true value is:", pexp(1.5, rate = 2))) # cumulative probability

# gamma distribution
X2 <- rgamma(N, shape = 2, rate = 2)
Fx2 <- mean(0.5 <= X2 & X2 <= 1.5)

print(c("estimated value is: ", Fx2))

a <- pgamma(1.5, shape = 2, rate = 2) - pgamma(0.5, shape = 2, rate = 2)

print(c("true value is:", a))