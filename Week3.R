### Q1
fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
download.file(fileURL, destfile = './data/ss06hid.csv', method='curl')

df <- read.csv('./data/ss06hid.csv')

names(df)
head(df)

str(df)

df$ACR <- as.factor(df$ACR)

df$agricultureLogical <- ifelse(df$ACR == 3 & df$AGS == 6, TRUE, FALSE)
head(df,20)

which(df$agricultureLogical)[1:3]


### Q2
install.packages('jpeg')
library(jpeg)
imageFileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg'
download.file(imageFileURL, destfile = './data/Fjeff.jpg', method='curl')
img <- readJPEG("./data/Fjeff.jpg", native=TRUE)
options("scipen"=100, "digits"=4)
quantile(img, probs=c(0.3,0.8))


### Q3
fgdpFileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
download.file(fgdpFileURL, destfile = './data/FGDP.csv', method='curl')
df1 <- read.csv('./data/FGDP.csv', skip = 5, header = FALSE)
df1 <- df1[,1:5]
df1 <- df1[,-3]
colnames(df1) <- c('CountryCode', 'Ranking', 'CountryName', 'GDP')
df11 <- subset(df1, factor(Ranking) != "" & factor(CountryCode) != "")


countryFileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv'
download.file(countryFileURL, destfile = './data/Country.csv', method='curl')
df2 <- read.csv('./data/Country.csv')

df3 <- merge(df11, df22, by = "CountryCode")
nrow(df3)

order(df3)
