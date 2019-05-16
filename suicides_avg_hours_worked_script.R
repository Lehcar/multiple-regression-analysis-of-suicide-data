myData <- read.csv("data\\suicideDataWithAnnualHoursWorked.csv")

myData <- myData[myData$year == 2007, ]

response <- myData$rates.of.suicide.per.100k
year <- myData$year
hdi <- myData$HDI.for.year
gdp.capita <-myData$gdp_per_capita....
country <- myData$country
avg.hours.worked <- myData$average.annual.hours.worked
daly <- myData$DALYs..Disability.Adjusted.Life.Years....Alcohol.and.substance.use.disorders..Age.standardized.percent.....

#plot(country, response, xlab = "Country", ylab = "Rates of suicide per 100k")
plot(hdi, response)

plot(avg.hours.worked, response, xlab="Average Annual Hours Worked", ylab = "Rates of Suicide per 100k",
     main="Rates of Suicide per 100k vs. Average Annual Hours Worked")
plot(daly, response)

fit <- lm(response ~ gdp.capita + hdi + avg.hours.worked + daly)
summary(fit)

plot(fit)


