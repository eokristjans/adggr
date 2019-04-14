rm(list = ls())
library(ggplot2)
library(scales)

# Lesum inn gögnin
eignir <- read.csv("./GognErling/eignir.txt", header=TRUE, sep="")
kunnar <- read.csv("./GognErling/kunnar.txt", header=TRUE, sep="")

# Teiknum tíðnirit (histogram) fyrir gæði húss
# og gæðakröfur kúnna
ggplot(eignir, aes(x = gaedi)) +
  geom_histogram(data = kunnar,
                 binwidth = 0.2,
                 fill = "red",
                 alpha = 0.3) +
  geom_histogram(data = eignir,
                 binwidth = 0.2,
                 fill = "blue",
                 alpha = 0.3) + 
  scale_x_continuous(breaks = seq(min(min(eignir$gaedi, kunnar$gaedi)), 
                                  5, 0.2)) +
  scale_y_continuous(breaks = seq(0, 3000, 100)) +
  xlab("Gæði") +
  ylab("Fjöldi") +
  ggtitle("Gæði eigna og gæðakröfur kúnna") +
  theme(plot.title = element_text(hjust = 0.5))

# Vistum útkomuna
ggsave("krofur_vs_eign.png")

# Leiga er 0.5% af núvirði eignar
eignir$greidslugeta <- 5*eignir$nuvirdi

# Teiknum tíðnirit (histogram) fyrir leigu eignar
# og greiðsluvilja kúnna
ggplot(eignir, aes(x = greidslugeta)) +
  geom_histogram(data = kunnar,
                 binwidth = 50000,
                 fill = "red",
                 alpha = 0.3) +
  geom_histogram(data = eignir,
                 binwidth = 50000,
                 fill = "blue",
                 alpha = 0.3) +
  scale_x_continuous(breaks = seq(0, 
                                  max(max(eignir$greidslugeta),
                                      max(kunnar$greidslugeta)),
                                  100000)) + 
  scale_y_continuous(breaks = seq(0, 10000, 500))
  
  