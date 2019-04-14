library(ggplot2)
library(Hmisc)

eignir <- read.csv("./GognErling/eignir.txt", header=TRUE, sep="")
kunnar <- read.csv("./GognErling/kunnar.txt", header=TRUE, sep="")
gogn <- merge(eignir, kunnar, by = "gaedi", all=TRUE)

gogn$type[is.na(gogn$nrkunna)] = "eign"
gogn$type[!is.na(gogn$nrkunna)] = "kunni"

gogn$type = factor(gogn$type, 
                      levels = c("eign", "kunni"),
                      labels = c("  Eign", "  Kröfur kúnna"))

ggplot(gogn, aes(x=gaedi, color=type, fill=type)) +
  geom_histogram(binwidth = 0.2, 
                 alpha=0.55, 
                 position="identity") +
  scale_x_continuous(breaks = seq(0, 5, 0.4)) +
  scale_y_continuous(breaks = seq(0, 2000, 100)) +
  xlab("Gæði") +
  ylab("Fjöldi") +
  ggtitle("Gæði eigna og gæðakröfur kúnna") +
  theme(plot.title = element_text(hjust = 0.5),
        legend.title = element_blank())

  ggsave("krofur_vs_eign.png")

