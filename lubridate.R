#Lubridate
#install.packages("lubridate")
library(lubridate)

tdate<-lubridate::now()
tdate
z<-1511870400
x<-lubridate::as_datetime(z)
date<-lubridate::date(x)
class(x)
lubridate::day(x)
lubridate::wday(x)
lubridate::month(x)
lubridate::year(x)
lubridate::isoyear(x)
lubridate::epiyear(x)
lubridate::hour(x)
lubridate::minute(x)
lubridate::second(x)
lubridate::myd(10231010)
lubridate::ymd_h(date)
ymd_hms("2017-11-28T14:02:00")
fdate<-lubridate::as_date(123456)
as.numeric(fdate)
fdate
x
date
hms::as_hms(85)
format(x, "%H:%M:%S")
xx<- "2025-01-27"
class(xx)
zz<-ymd(xx)
class(zz)
bdate<-lubridate::mdy("May 11, 1996")
date2<- ymd(xx)
date2
date1<-format(date2, "%d%b%Y")
date1
d1<-as.Date(xx)
d2<-as.Date(fdate)
days<-d2-d1
difftime(d2,d1)
days
yrs <- c(2001, 2002, 2002, 2002, 2003, 2005)
lubridate::ymd(yrs, truncated = 2L)

ym<- "2025-10"
mm<- as.Date(paste0(yrs,"-01"))
mm

as.Date(ISOdate(yrs, 12, 31))
as.Date(ISOdate(yrs, 1, 1))
as.Date(paste(yrs, 1, 1, sep = "-")) # beginning of year
as.Date(paste(yrs, 12, 31, sep = "-")) # end of year
