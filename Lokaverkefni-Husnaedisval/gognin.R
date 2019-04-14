library(ggplot2)

eignir <- read.csv("./GognErling/eignir.txt", header=TRUE, sep="")
kunnar <- read.csv("./GognErling/kunnar.txt", header=TRUE, sep="")
gogn <- merge(eignir, kunnar, by = "gaedi", all=TRUE)

gogn$type[is.na(gogn$nrkunna)] = "eign"
gogn$type[!is.na(gogn$nrkunna)] = "kunni"

gogn$type = as.factor(gogn$type)

ggplot(gogn, aes(x=gaedi, color=type, fill=type)) +
  geom_histogram(binwidth = 1, 
                 alpha=0.5, 
                 position="identity")

ggplot(gogn, aes(x=greidslugeta))


