summary_values <- c(not_paid_course, paid_course)




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
