library(csvread)
data <- read.csv("E://R practise datasets//input.csv")
datadf<-data.frame(data)

uniqState<-unique(datadf$state)
uniqAccountLength<-unique(datadf$account_length)
UniqAreaCode<-unique(datadf$area_code)
UniqAreaCode<-sort(UniqAreaCode,decreasing = FALSE)
uniqPhoneNumber<-unique(datadf$phone_number)

TotalCharge<-c(sum(datadf$total_day_charge),sum(datadf$total_eve_charge),sum(datadf$total_night_charge),sum(datadf$total_intl_charge))

area<-data.frame(UniqAreaCode,c(rowsum(datadf$total_day_charge,group = datadf$area_code)),c(rowsum(datadf$total_eve_charge,group = datadf$area_code)),
                  c(rowsum(datadf$total_night_charge,group = datadf$area_code)),c(rowsum(datadf$total_intl_charge,group = datadf$area_code)),
                  c(rowsum(datadf$number_vmail_messages,group = datadf$area_code)),c(rowsum(datadf$number_customer_service_calls,group = datadf$area_code)))
colnames(area)<-c("AreaCode","DayCharge","EveCharge","NightCharge","InternationalCharge","VmailMessage","CustomerServiceCall")

library(ggplot2)
label<-c("Day","Eve","Night","International")
pie(TotalCharge,label,main = "Total Charge Distribution")
area
