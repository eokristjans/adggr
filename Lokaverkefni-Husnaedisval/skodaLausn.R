library(tidyr)
library(dplyr)
library(ggplot2)
library(knitr)
library(reshape2)

eignir1 <- read.csv(file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\Lokaverkefni-Husnaedisval\\GognErling\\eignir.txt", sep="\t")
kunnar1 <- read.csv(file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\Lokaverkefni-Husnaedisval\\GognErling\\kunnar.txt", sep="\t")
kunnar1$as_matsvaedi <- as_matsvaedi

""" Án svæði constraint (all data)
1 1    1872 1    3606 1    6128 1    9341 1   11621 1   14094 1   17238 1
2 1    1895 1    3696 1    6155 1    9374 1   11704 1   14742 1   17350 1
5 1    2028 1    4013 1    6329 1    9681 1   11730 1   14901 1   17825 1
34 1    2206 1    4270 1    6738 1    9786 1   11786 1   14921 1   18090 1
38 1    2261 1    4388 1    6952 1   10205 1   11905 1   15223 1   18133 1
43 1    2462 1    4424 1    7076 1   10314 1   11924 1   15390 1   18178 1
52 1    2535 1    4565 1    7235 1   10427 1   12223 1   15534 1   18310 1
80 1    2571 1    4717 1    7404 1   10563 1   12583 1   15560 1   18381 1
155 1    2746 1    4850 1    7674 1   10598 1   12618 1   15649 1   19154 1
431 1    2780 1    4925 1    7689 1   10603 1   12810 1   15708 1   19161 1
524 1    3014 1    5000 1    7927 1   11068 1   12993 1   15744 1   19275 1
919 1    3069 1    5008 1    7988 1   11146 1   13071 1   15867 1   19515 1
1048 1    3205 1    5046 1    7989 1   11163 1   13295 1   16142 1   19729 1
1131 1    3310 1    5164 1    8350 1   11198 1   13298 1   16202 1
1201 1    3425 1    5297 1    9044 1   11252 1   13326 1   16216 1
1208 1    3433 1    5714 1    9062 1   11304 1   13415 1   16361 1
1258 1    3434 1    5743 1    9216 1   11561 1   13526 1   16970 1
1373 1    3534 1    5744 1    9247 1   11573 1   13973 1   17036 1
1616 1    3577 1    5810 1    9309 1   11591 1   14057 1   17233 1

Án svæði constraint (half data)
   1 1     30 1   1247 1   2469 1   3561 1   4642 1   6525 1   8491 1   9486 1
   2 1     37 1   1294 1   2493 1   3656 1   5094 1   6668 1   8567 1   9529 1
   3 1     47 1   1799 1   2578 1   3704 1   5216 1   6949 1   8653 1   9583 1
   5 1     70 1   1810 1   2734 1   3804 1   5445 1   7650 1   8661 1   9744 1
   6 1    101 1   1838 1   2848 1   4077 1   5608 1   8157 1   8735 1
   7 1    486 1   1862 1   2943 1   4211 1   5743 1   8188 1   8819 1
   9 1    576 1   1925 1   3044 1   4449 1   5754 1   8192 1   9044 1
  10 1   1084 1   1956 1   3148 1   4456 1   5804 1   8209 1   9309 1
  11 1   1091 1   1999 1   3214 1   4493 1   5935 1   8237 1   9348 1
  21 1   1240 1   2175 1   3262 1   4598 1   6231 1   8258 1   9445 1
"""


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












