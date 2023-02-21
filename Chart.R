library("ggplot2")
library("dplyr")

alc_consumption <- read.csv("student-por.csv", stringsAsFactors = FALSE)


student_alc_consumption <- alc_consumption %>%
  select(Walc, G1, G2, G3) %>%
  mutate(g_avg = rowMeans(select(alc_consumption, c(G1, G2, G3)))) 


ggplot(student_alc_consumption, aes(x = Walc, y = g_avg)) + geom_point(size = 1.5, color = "red") + ggtitle("Average grades distribution in each level of weekend alcohol consumption") + labs(x = "Weekend Alcohol Consumption", y = "Grade Averages")




num_walc_1 <- student_alc_consumption %>%
  filter(g_avg > 15, Walc == 1) %>%
  summarize(length(g_avg))

num_walc_5 <- student_alc_consumption %>%
  filter(g_avg > 15, Walc == 5) %>%
  summarize(length(g_avg))




