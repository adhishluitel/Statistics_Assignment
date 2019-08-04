library(mosaic)
library(mvtnorm)
source("http://jgscott.github.io/teaching/r/mvnorm/rbvnorm.R")

mu_stocks = 0.065
mu_bonds = 0.017
sd_stocks = 0.195
sd_bonds = 0.075
rho = 0.30 




weights = c(0.6, 0.4) # how much of your wealth in each asset?
Horizon = 40

possible_wealth = c(0)
for (i in 1:598) {
total_wealth = 10000
wealth_by_asset = total_wealth * weights
for(year in 1:Horizon) {
  # Simulate a bivariate normal set of returns
  returns = rbvnorm(1, mu_stocks, mu_bonds, sd_stocks, sd_bonds, rho)
  # Update wealth in each asset
  wealth_by_asset = wealth_by_asset * (1 + returns)
  # rebalance
  total_wealth = sum(wealth_by_asset)
  wealth_by_asset = total_wealth * weights
}
possible_wealth = c(possible_wealth, total_wealth)
}

options("scipen" = 200)
possible_wealth = data.frame(possible_wealth)
ggplot(possible_wealth,aes(x=possible_wealth)) +geom_histogram(binwidth = 500)
(summary(possible_wealth))


