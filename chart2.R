library("ggplot2")
library("dplyr")

alc_consumption <- read.csv("student-por.csv", FALSE)

student_alc_consumption <- alc_consumption %>% 
  select(V2, V3, V5, V6, V9, V10, V11, V12, V15, V17, V18, V19, V21, V22, V24, V25, V26, V27, V28, V29, V30, V33)
names(student_alc_consumption) <- student_alc_consumption[1, ]
student_alc_consumption <- student_alc_consumption[-1, ]
student_alc_consumption <- student_alc_consumption %>%
  mutate(count = 1)
# Number of students for each rating of weekend alcohol consumption, faceted by rating of family quality
ggplot(data = student_alc_consumption) + 
  geom_bar(stat= "identity", aes(x = count, 
               y = Walc)) +
  facet_wrap(~famrel) +
  labs(title = "Number of student engaging in Weekend Drinking", 
       caption = "Faceted by rating of Family Relationship Quality",
       y = "Rating of Weekend Alcohol Consumption",
       x = "Number of Students")

num_walc <- student_alc_consumption %>%
  group_by(Walc) %>%
  summarise(sum(count))
rating <- student_alc_consumption %>%
  group_by(famrel) %>%
  summarise(avg_walc = mean(as.numeric(Walc)))





