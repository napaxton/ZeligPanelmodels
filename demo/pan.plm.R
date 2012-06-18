library(ZeligPanelmodels)

#####  Example 1: Basic Example with First Differences  #####

# Attach sample data and variable names:  
data(macro)

# Estimate model and present a summary:
z.out.re <- zelig(
               Formula(inv ~ value + capital),
               data=Grunfeld, 
               model="pan.plm", 
               pan.model="random", 
               pan.index=c("firm","year")
               )

# z.out.fe <- zelig(unem ~ gdp + capmob + trade, 
# 					model = "pan.plm", 
# 					pan.model="within", 
# 					pan.index=c("country","year"), 
# 					data = macro)


# Set explanatory variables to their default (mean/mode) values, with
# high (80th percentile) and low (20th percentile) values:

x.high <- setx(z.out.fe, trade = quantile(macro$trade, 0.8))
x.low <- setx(z.out.fe, trade = quantile(macro$trade, 0.2))

# Generate first differences for the effect of high versus low trade on
# GDP:

s.out.fe <- sim(z.out.fe, x = x.high, x1 = x.low)

# Summarize the fitted model

summary(z.out.fe)

# Summarize the simulated quantities of interest

//summary(s.out1)

# Plot the simulated quantities of interest

//plot(s.out1)