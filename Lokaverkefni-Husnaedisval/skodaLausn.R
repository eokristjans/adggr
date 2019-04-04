library(tidyr)
library(dplyr)
library(ggplot2)
library(knitr)
library(reshape2)

eignir1 <- read.csv(file="C:\\Users\\ellio\\Documents\\hi\\v19\\adggr\\Lokaverkefni-Husnaedisval\\GognErling\\eignir.txt", sep="\t")
kunnar1 <- read.csv(file="C:\\Users\\ellio\\Documents\\hi\\v19\\adggr\\Lokaverkefni-Husnaedisval\\GognErling\\kunnar.txt", sep="\t")
kunnar1$as_matsvaedi <- as_matsvaedi



valdar.eignir.index <- c(      5,   1163,   2074,   3273,   4152,   5237,   6010,   6949,   8546,
                              98,   1173,   2102,   3311,   4169,   5342,   6020,   7180,   8591,
                             245,   1223,   2123,   3320,   4323,   5548,   6043,   7280,   8786,
                             334,   1258,   2139,   3326,   4451,   5622,   6172,   7301,   8797,
                             406,   1411,   2399,   3354,   4580,   5642,   6325,   7556,   8919,
                             449,   1470,   2411,   3393,   4699,   5716,   6368,   7580,   9517,
                             604,   1484,   2437,   3588,   4739,   5725,   6395,   7637,
                             681,   1568,   2649,   3657,   4772,   5747,   6458,   7706,
                             691,   1725,   2714,   3676,   4776,   5751,   6536,   7869,
                             748,   1790,   2828,   3702,   4867,   5760,   6550,   8015,
                             919,   1824,   3008,   3752,   5020,   5762,   6606,   8026,
                             930,   1825,   3070,   3946,   5068,   5783,   6804,   8080,
                             1022,  2014,   3090,   4049,   5091,   5880,   6818,   8319)


matssvaedi.nofn <- c("Ar", "Mi", "Ko", "Hf", "LV", "Ge", "Br", "Gv", "Ve", "Se", "Ha", "Hl", "Fo", "Ga", "Mo", "Gh")



summa <-0
for(i in valdar.eignir.index){
  summa = summa + eignir$nuvirdi[i]
}
valdar.eignir <- subset(eignir1, nrhus%in%valdar.eignir.index)

valdar.eignir_matssvaedi <- valdar.eignir
valdar.eignir_matssvaedi$nuvirdi <- NULL
valdar.eignir_matssvaedi$ibm2 <- NULL
valdar.eignir_matssvaedi$gaedi <- NULL
valdar.eignir_matssvaedi$nrhus <- NULL

valdar.eignir_matssvaedi.list <- vector()
for(j in (1:length(valdar.eignir_matssvaedi$matssvaedi))){
  for(i in (2:length(mnofn2))){
    if(grepl(mnofn[i], valdar.eignir_matssvaedi$matssvaedi[j])){
      valdar.eignir_matssvaedi.list[j] <- mnofn2[i]
    }
  }
}
valdar.eignir$matssvaedi <- valdar.eignir_matssvaedi.list
names(valdar.eignir) <- c("nrhus", "nuvirdi", "ibm2", "matssvaedi", "gaedi")
str(valdar.eignir)

fjarmagn
sum(valdar.eignir$nuvirdi)


ggplot() + geom_histogram(data=valdar.eignir, aes(nuvirdi), binwidth = 1000) + labs(x='Núvirdi', y='Fjöldi')
ggplot() + geom_histogram(data=valdar.eignir, aes(gaedi), binwidth = 0.1) + labs(x='Gæði', y='Fjöldi')
ggplot() + geom_histogram(data=valdar.eignir, aes(ibm2), binwidth = 10) + labs(x='Stærð', y='Fjöldi')
ggplot() + geom_bar(data=valdar.eignir, aes(matssvaedi))












