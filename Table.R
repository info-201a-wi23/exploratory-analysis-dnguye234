library(dplyr)
setwd("~/Desktop")
getwd()
student_alc <- read.csv("/Users/nish1209/Desktop/student-por.csv", FALSE)
View(student_alc)

student_alc <- student_alc%>% 
  select(V2, V3, V5, V6, V9, V10, V11, V12, V15, V17, V18, V19, V21, V22, V24, V25, V26, V27, V28, V29, V30, V33)
names(student_alc) <- student_alc[1,]
student_alc <- student_alc[-1,]

table_student_alc <- select(student_alc, sex, age, 'Parental Status' = Pstatus , "Family Relationship" = famrel , "Going Out With Friends" = goout, "Weekday Alc Consumption" = Dalc, "Weekend Alc Consumption" = Walc, "Health Condition" = health  )

table_student_alc <- table_student_alc %>% filter(age < 18 ) %>% head(50)

table_student_alc <- table_student_alc %>%  group_by(sex, `Parental Status`) %>% arrange(sex, `Parental Status`)

View(table_student_alc)

