x <- read.csv("data\\suicideData.csv")

ukraine.suicide <- x[x$ï..country == "Ukraine",]

year <- ukraine.suicide$year
sex <- ukraine.suicide$sex
age <- ukraine.suicide$age
gdp <- ukraine.suicide$gdp_for_year....
gdp.capita <- ukraine.suicide$gdp_per_capita....
generation <- ukraine.suicide$generation
response <- ukraine.suicide$suicides.100k.pop

plot(year, ukraine.suicide$suicides.100k.pop, 
     main="Suicides per 100k in ukraine from 1985 to 2015", xlab="Year", ylab="Suicides/100k")

#ukraine.suicide.fit <- lm(response ~ year + sex * age + gdp + generation)
#ukraine.suicide.fit <- lm(response ~ year + sex * age + gdp.capita)
ukraine.suicide.fit <- lm(response ~ year + sex * age)

summary(ukraine.suicide.fit)

fit.residuals <- residuals(ukraine.suicide.fit)
qqnorm(fit.residuals, pch = 1, xlab = "Fitted values", ylab = "Residuals", 
       main="Residuals vs Fitted Values of suicides per 100k in ukraine")
qqline(fit.residuals, col = "red", lwd = 2)

plot(fit.residuals, xlab = "Fitted values", ylab = "Residuals", 
     main="Residuals Scatterplot of Suicides per 100k in ukraine")