library(tidyverse)
library(janitor)

hosp_gen_info <- read_csv(file = "Data\\Hospital_General_Information.csv")
hosp_gen_info <- clean_names(hosp_gen_info)

hosp_rrp <- read_csv(file = "Data\\Hospital_Readmissions_Reduction_Program.csv")
hosp_rrp <- clean_names(hosp_rrp)


##### Exploratory Data Analysis ##### 

## hospital overall rating vs hospital ownership ## 
ggplot() + 
  geom_bar(data = hosp_gen_info, mapping = aes(x = hospital_overall_rating), stat = "count") +
  facet_grid(.~hospital_ownership)

hosp_gen_info %>%
  group_by(hospital_ownership, hospital_overall_rating) %>%
  summarise(count = n()) %>%
  mutate(freq = count / sum(count))

## hospital overall rating vs hospital type ## 
ggplot() + 
  geom_bar(data = hosp_gen_info, mapping = aes(x = hospital_overall_rating), stat = "count") +
  facet_grid(.~hospital_type)

hosp_gen_info %>%
  group_by(hospital_ownership, hospital_overall_rating) %>%
  summarise(count = n()) %>%
  mutate(freq = count / sum(count))













