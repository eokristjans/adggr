library(tidyr)
library(dplyr)
library(ggplot2)
library(knitr)
library(reshape2)

eignir1 <- read.csv(file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\Lokaverkefni-Husnaedisval\\GognErling\\eignir.txt", sep="\t")
kunnar1 <- read.csv(file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\Lokaverkefni-Husnaedisval\\GognErling\\kunnar.txt", sep="\t")
kunnar1$as_matsvaedi <- as_matsvaedi


valdar.eignir.index <- c(     1,  1810,  3519,  6307,  9360, 11977, 14642, 17024,
                              6,  1856,  3595,  6506,  9386, 12286, 14880, 17270,
                              7,  1911,  3868,  6507,  9633, 12307, 14927, 17350,
                              12,  1992,  3928,  6564,  9716, 12417, 14945, 17431,
                              20,  2012,  3977,  7052,  9821, 12544, 15254, 17672,
                              52,  2037,  4016,  7197,  9936, 12566, 15281, 18141,
                              70,  2038,  4074,  7281, 10361, 12651, 15416, 18359,
                              330,  2195,  4272,  7397, 10604, 12679, 15576, 18441,
                              528,  2241,  4431,  7398, 10646, 12745, 15593, 18803,
                              634,  2381,  4574,  7614, 10787, 13071, 15604, 19067,
                              1137,  2449,  4732,  7987, 11131, 13145, 15702, 19197,
                              1204,  2451,  5018,  8199, 11311, 13350, 15745, 19203,
                              1210,  2745,  5067,  8350, 11325, 13353, 15805, 19431,
                              1262,  2777,  5179,  8466, 11436, 13404, 16139, 19521,
                              1380,  2876,  5474,  8978, 11628, 14003, 16184, 19569,
                              1387,  3020,  5743,  8982, 11692, 14087, 16189, 19688,
                              1389,  3067,  5808,  9044, 11798, 14119, 16278,
                              1448,  3201,  6112,  9234, 11848, 14122, 16408,
                              1620,  3297,  6143,  9267, 11956, 14419, 16429,
                              1724,  3401,  6287,  9335, 11963, 14444, 16963 )


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
(fjarmagn-sum(valdar.eignir$nuvirdi))


ggplot() + geom_histogram(data=valdar.eignir, aes(nuvirdi), binwidth = 1000) + labs(x='Núvirdi', y='Fjöldi')
ggplot() + geom_histogram(data=valdar.eignir, aes(gaedi), binwidth = 0.1) + labs(x='Gæði', y='Fjöldi')
ggplot() + geom_histogram(data=valdar.eignir, aes(ibm2), binwidth = 10) + labs(x='Stærð', y='Fjöldi')
ggplot() + geom_bar(data=valdar.eignir, aes(matssvaedi))












