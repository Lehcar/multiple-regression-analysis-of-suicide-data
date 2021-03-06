myData <- read.csv("data\\suicideData.csv")

#suicide data for 2009
suicide.2009 <- myData[myData$year=='2009',]

hdi.2009 <- suicide.2009$HDI.for.year
country.2009 <- suicide.2009$ï..country
gdp.2009 <- suicide.2009$gdp_for_year....
gdp.capita.2009 <- suicide.2009$gdp_per_capita....
age.2009 <- suicide.2009$age
sex.2009 <- suicide.2009$sex
response.2009 <- suicide.2009$Suicide.Percentage

plot(sex.2009, response.2009)
plot(country.2009, response.2009)

#fit <- lm(response.2009 ~ gdp.2009 + gdp.capita.2009  + age.2009 * sex.2009, data=myData)
fit <- lm(response.2009~ gdp.capita.2009 + age.2009 * sex.2009, data=myData)
summary(fit)

plot(fit)









