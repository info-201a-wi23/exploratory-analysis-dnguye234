library(dplyr)
student_alc_consumption <- read.csv("student-por.csv")
student_alc_consumption <- student_alc_consumption %>%
  mutate(count = 1)

num_walc <- student_alc_consumption %>%
  group_by(Walc == 3) %>%
  summarise(sum(count)) %>%
  pull()

rating <- student_alc_consumption %>%
  group_by(famrel == 3) %>%
  summarise(avg_walc = mean(as.numeric(Walc))) %>%
  pull()


not_paid_course <- student_alc_consumption %>%
  select(Dalc, paid) %>% 
  filter(paid == "no") %>%
  filter(Dalc >= 2) %>% 
  count() %>% 
  pull()

paid_course <- student_alc_consumption %>%
  select(Dalc, paid) %>% 
  filter(paid == "yes") %>%
  filter(Dalc >= 2) %>% 
  count() %>% 
  pull()

summary_values <- list(not_paid_course, paid_course, num_walc, rating)
