library("ggplot2")
library("dplyr")

alc_consumption <- read.csv("C:/Users/mvere/OneDrive/Documents/student-por.csv", FALSE)

student_alc_consumption <- alc_consumption %>% 
  select(V2, V3, V5, V6, V9, V10, V11, V12, V15, V17, V18, V19, V21, V22, V24, V25, V26, V27, V28, V29, V30, V33)
names(student_alc_consumption) <- student_alc_consumption[1,]
student_alc_consumption <- student_alc_consumption[-1,]
ggplot(student_alc_consumption, aes(x = V24,y = V30)) +
  geom_bar(stat = "identity")
