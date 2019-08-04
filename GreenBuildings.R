ggplot(greenbuildings) +
  geom_histogram((aes(x=age), stat='density')) +
  facet_grid(green_rating-.)

greenbuildings = mutate(greenbuildings, agecat = cut(age, c(-1, 10, 20. 50, 75, 200)))

green_su