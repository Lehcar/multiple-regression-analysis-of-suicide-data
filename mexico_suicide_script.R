x <- read.csv("suicide-rates-overview-1985-to-2016\\master.csv")

mexico.suicide <- x[x$ï..country == "Mexico",]

year <- mexico.suicide$year
sex <- mexico.suicide$sex
age <- mexico.suicide$age
gdp <- mexico.suicide$gdp_for_year....
gdp.capita <- mexico.suicide$gdp_per_capita....
generation <- mexico.suicide$generation
response <- mexico.suicide$suicides.100k.pop

plot(united.states.suicide$year, mexico.suicide$suicides.100k.pop, 
     main="Suicides per 100k in Mexico from 1985 to 2015", xlab="Year", ylab="Suicides/100k")

mexico.suicide.fit <- lm(response ~ year + sex * age + gdp + generation)
summary(mexico.suicide.fit)

fit.residuals <- residuals(mexico.suicide.fit)
qqnorm(fit.residuals, pch = 1, xlab = "Fitted values", ylab = "Residuals", 
       main="Residuals vs Fitted Values of suicides per 100k in Mexico")
qqline(fit.residuals, col = "red", lwd = 2)

plot(fit.residuals, xlab = "Fitted values", ylab = "Residuals", 
     main="Residuals Scatterplot of Suicides per 100k in Mexico")
