# Example SDTM
install.packages("haven")
library(haven)

#import SAS dataset

dm <- haven::read_sas("dm.sas7bdat")
ex <- haven::read_sas("ex.sas7bdat")
ds <- haven::read_sas("ds.sas7bdat")
class(dm)
install.packages("dplyr")
library(dplyr)
head(dm)
sample_n(dm,2)
#dimensions
dim(dm)
#duplicate removal
dm1 <- dplyr::distinct(dm, RACE)

dm2 <- dm[base::order(dm$AGECAL,decreasing = TRUE),]
dm2
class(dm2)
dm3 <- dm[base::sort(dm$AGECAL,decreasing = FALSE),]
dm3

#Sort mutliple variables within a dataset
dm4 <- dplyr::arrange(dm,AGECAL,RFICDTC)
dm4

#to drop or keep variables
dm5 <- dplyr::select(dm,c(AGECAL, RFICDT, SubjectID))
dm5
dm6 <- dplyr::select(dm,contains("SEX"))
dm6
dm7 <- dplyr::select(dm,-"SEX")
dm7

#Renaming
dm8 <- dplyr::rename(dm,GENDER=SEX)
dm8
class(dm8)

#Where condition
dm9 <- dplyr::filter(dm,SEX=="MALE")
dm9

# SDTM.DM

#install.packages("dplyr")
library(dplyr)
#install.packages("haven")
library(haven)
#install.packages("stringr")
library(stringr)
#https://www.appsilon.com/post/r-lubridate
#install.packages("lubridate")
library(lubridate)

#import SAS dataset
dm_1 <- haven::read_sas("dm.sas7bdat")
ex_1 <- haven::read_sas("ex.sas7bdat")
ds_1 <- haven::read_sas("ds.sas7bdat")

#adding new variables to work dataset
dm_2 <- dplyr::mutate(dm_1, STUDYID="PER977-02-011", DOMAIN="DM", SUBJID=SubjectID)

#deriving USUBJID using the paste0 function to concatenate STUDYID and SUBJECTID
dm_3 <- dplyr::mutate(dm_2,USUBJID=paste0(str_trim(STUDYID),"-",str_trim(SubjectID)))
dm_3 <- dplyr::filter(dm_3,SubjectStatus=="Randomized")

dm_4 <- dm_3 %>% 
  group_by(USUBJID) %>% 
  slice_max(RFICDT) %>% 
  ungroup()

#Class(ex_1$EXDTTMR)
class(ex_1$EXSTDTTM)
#Convert RAW.EX.EXADMMR to character value when RAW.EX.VISIT='DAY 1', as the first exposure datetime.
ex_1 <- dplyr::filter(ex_1,SubjectStatus=="Randomized")
ex_2 <- ex_1 %>% 
        dplyr::filter(Visit=="DAY 1") %>%
        dplyr::select(-EXSTDTTM,-EXENDTTM)
ex_3 <- ex_1 %>%
        dplyr::filter(Visit=="DAY 3") %>%
        dplyr::select(SubjectID,Visit,EXSTDTTM,EXENDTTM)

#Converting numeric datetime to character datetime
ex_4<-dplyr::mutate(ex_2,RFSTDTC= paste0(as.Date(EXDTTMR),"T",format(EXDTTMR, "%H:%M:%S")))
ex_5<-dplyr::mutate(ex_3,RFENDTC= paste0(as.Date(EXENDTTM),"T",format(EXENDTTM, "%H:%M:%S")))
ex_6<-dplyr::mutate(ex_5,RFXSTDTC= paste0(as.Date(EXSTDTTM),"T",format(EXSTDTTM, "%H:%M:%S")))
ex_7<-dplyr::mutate(ex_6,RFXENDTC= paste0(as.Date(EXENDTTM),"T",format(EXENDTTM, "%H:%M:%S")))

#merge ex_4 and ex_5
ex_8<-merge(ex_4, ex_7, by="SubjectID")
dm_5<-merge(dm_4, ex_8, by="SubjectID")

#Convert RAW.DM.RFICDT into character value, use the first ICF Date all additional due to amendments are in SUPPDM
dm_6<-dplyr::mutate(dm_5,RFICDTC= as.character(RFICDT))

#Find the last known date in all raw dataset.
RP1 <- dm_3 %>% 
  group_by(SubjectID) %>% 
  slice_max(RFICDT) %>% 
  rename(RFPENDTC=RFICDT) %>%
  select(SubjectID, RFPENDTC) 

RP2 <- ex_8 %>% 
  group_by(SubjectID) %>% 
  slice_max(EXENDTTM) %>% 
  rename(RFPENDTC=EXENDTTM) %>%
  select(SubjectID, RFPENDTC) 

RP3 <- ds %>% 
  dplyr::filter(SubjectStatus=="Randomized") %>%
  group_by(SubjectID) %>% 
  slice_max(DSDT) %>% 
  rename(RFPENDTC=DSDT) %>%
  select(SubjectID, RFPENDTC) 

#RP4<-merge(RP1, RP2, by="SubjectID")
#RP5<-merge(RP3, RP4, by="SubjectID")
#RP5$max_value <- apply(RP5[, c("RFICDT", "EXENDTTM", "DSDT")], 1, max)

RP4 <- rbind(RP1, RP2, RP3)

RP5 <- RP4 %>% 
  group_by(SubjectID) %>% 
  slice_max(RFPENDTC) %>% 
  mutate(RFPENDTC=as.character(RFPENDTC))
#class(RP5$RFPENDTC)

dm_7 <- merge(dm_6,RP5, by="SubjectID")

#If RAW.DS.DSDECOD=""DEATH"" , then set to ""Y""; else set to missing

ds_2 <- ds_1 %>% 
        dplyr::filter(SubjectStatus=="Randomized") %>%
        mutate(DTHFL = ifelse(DSDECOD=="DEATH", "Y", "N")) %>%
        select(SubjectID, DSDECOD, DTHFL, DSDT, DSETDT)

#If DTHFL='Y' then convert RAW.DS.DSDT/DSETDT into character value; else set to missing

#if DTHFL=="N" and DSDT ne " " then DTHDT=DSDT
#else if DTHFL=="N" and DSDT = " " and DSETDT ne " " then DTHDT=DSETDT

ds_3 <- ds_2 %>%
        mutate(DTHDTC = ifelse(DTHFL=="N" & is.na(DSDT)==FALSE, as.character(DSDT), 
                       ifelse(DTHFL=="N" & is.na(DSDT)==TRUE & is.na(DSETDT)==FALSE, as.character(DSETDT)," ")))
                       
dm_8 <- merge(dm_7,ds_3, by="SubjectID")

#SiteID

dm_8 <- mutate(dm_8,SITEID="001")

#Convert RAW.DM.BRTHDT into character value

dm_8 <- mutate(dm_8, BRTHDTC=as.character(BRTHDT))

#RAW.DM.AGECAL

dm_8 <- mutate(dm_8, AGE=lubridate::time_length(difftime(RFICDT+1, BRTHDT), "years"))
dm_8 <- mutate(dm_8, AGEU="YEARS")

#if RAW.DM.SEX='Male' then set 'M'
#else if RAW.DM.SEX='Female' then set 'F'

dm_9 <- dm_8 %>%
        mutate(SEX= ifelse(SEX=="Male","M",ifelse(SEX=="Female","F","")))

dm_9 <- mutate(dm_9, COUNTRY="USA")

dm_10 <- select(dm_9,STUDYID,DOMAIN,USUBJID,SUBJID,RFSTDTC,RFENDTC,RFXSTDTC,RFXENDTC,
                RFICDTC,RFPENDTC,DTHFL,DTHDTC,SITEID,BRTHDTC,AGE,AGEU,SEX,RACE,ETHNIC,
                COUNTRY)
