par(mfrow = c(2, 2))

#################################
# WLLN
n.max <- 10000
mu <- 5
xs <- rexp(n.max, rate = 1 / mu)
# cumsum means cumulative sum, e.g. cumsum(c(1,2,1)) = [1,3,4]
means <- cumsum(xs) / (1:n.max)
plot(1:n.max, means)
###############################################
#  convergence in probability
ns <- 10^(1:5)
epsilon <- 0.05
trials <- 1000
empirical.probs <- rep(0, 6)
for (i in 1:length(ns)) {
    n <- ns[i]
    greater.than.epsilon <- 0
    for (j in 1:trials) {
        xs <- rexp(n, rate = 1 / mu)
        # repeat 1000 times and see how many elements have the error greater than epsilon
        greater.than.epsilon <- greater.than.epsilon + (abs(mean(xs) - mu) > epsilon) # 0 or 1
    }
    empirical.probs[i] <- greater.than.epsilon / trials
}
print(empirical.probs)

################################################
# The central limit theorem
n <- 1000
mu <- 5
sigma <- mu
trials <- 1000
means <- rep(0, trials)
for (i in 1:trials) {
    xs <- rexp(n, rate = 1 / mu)
    means[i] <- mean(xs) # Zn = mean of Xi, n = 1000
}
plot(density(sqrt(n) * (means - mu))) #  converge in density
vs <- seq(-5 * mu, 5 * mu, 0.01)
# probability density function of normal distribution
lines(vs, dnorm(vs, mean = 0, sd = sigma), col = "red")

####################################################
# Fisher information and the Cramer-Rao lower bound

n <- 10
thetas <- seq(0.1, 2, 0.1)
vars <- rep(0, length(thetas))
trials <- 1000

for (i in 1:length(thetas)) {
    mles <- rep(0, trials)
    theta <- thetas[i]
    for (j in 1:trials) {
        xs <- rexp(n, theta)
        mles[j] <- 1 / mean(xs) # ML estimator of exp distribution
    }
    vars[i] <- var(mles)
}

plot(thetas, vars)
# Cramer-Rao lower bound for exp distribution
lines(thetas, n / (n - 1)^2 * thetas^2, col = "red")

########################################
# example

n <- 10
trials <- 1000
ms <- rnorm(trials, mean = 0, sd = 1 / sqrt(n))

thetas <- seq(-10, 10, 0.01) # 1000, same as amount of ms
mses <- rep(0, length(thetas))
for (i in 1:length(thetas)) {
    theta <- thetas[i]
    diffs <- n / (n + 1) * ms - 1 / (n + 1) * theta
    mses[i] <- mean(diffs^2)
}
# mean-squared error near 0 appears to be better than the Cramer-Rao lower bound for an unbiased estimator, but it is worse if theta is sufficiently far from 0.
plot(thetas, mses)
unbiased.crlb <- 1 / n
abline(h = unbiased.crlb, col = "red")