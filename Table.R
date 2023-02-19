library(dplyr)
setwd("~/Downloads")
student_alc <- read.csv("student-por.csv")
View(student_alc)

table_student_alc <- select(student_alc, sex, age, 'Parental Status' = Pstatus , "Family Relationship" = famrel , "Going Out With Friends" = goout, "Weekday Alc Consumption" = Dalc, "Weekend Alc Consumption" = Walc, "Health Condition" = health  )

table_student_alc <- table_student_alc %>% filter(age < 18 ) %>% head(50)
View(table_student_alc)
