library(csvread)
data <- read.csv("E:/R practise datasets/input.csv")
datadf<-data.frame(data)

uniqState<-unique(datadf$state)
uniqAccountLength<-unique(datadf$account_length)
UniqAreaCode<-unique(datadf$area_code)
uniqPhoneNumber<-unique(datadf$phone_number)

DayCharge<-sum(datadf$total_day_charge)
EveCharge<-sum(datadf$total_eve_charge)
NightCharge<-sum(datadf$total_night_charge)
InternationalCharge<-sum(datadf$total_intl_charge)
areaDayCharge<-rowsum(datadf$total_day_charge,group = datadf$area_code)
areaEveCharge<-rowsum(datadf$total_eve_charge,group = datadf$area_code)
areaNightCharge<-rowsum(datadf$total_night_charge,group = datadf$area_code)
areaInternationalCharge<-rowsum(datadf$total_intl_charge,group = datadf$area_code)
areaDC<-data.frame(areaDayCharge)
areaEC<-data.frame(areaEveCharge)
areaNC<-data.frame(areaNightCharge)
areaIC<-data.frame(areaInternationalCharge)




x<-c(DayCharge,EveCharge,NightCharge,InternationalCharge)
label<-c("Day","Eve","Night","International")
pie(x,label)


library(ggplot2)
barplot(areaDC$areaDayCharge)
barplot(areaEC$areaEveCharge)
barplot(areaNC$areaNightCharge)
barplot(areaIC$areaInternationalCharge)

