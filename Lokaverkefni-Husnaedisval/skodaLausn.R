library(tidyr)
library(dplyr)
library(ggplot2)
library(knitr)
library(reshape2)

eignir1 <- read.csv(file="C:\\Users\\ellio\\Documents\\hi\\v19\\adggr\\Lokaverkefni-Husnaedisval\\GognErling\\eignir.txt", sep="\t")
kunnar1 <- read.csv(file="C:\\Users\\ellio\\Documents\\hi\\v19\\adggr\\Lokaverkefni-Husnaedisval\\GognErling\\kunnar.txt", sep="\t")
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






   1,    23,  1091,  2151,  3704,  5045,  6917,  8202,  9410,
   2,    39,  1127,  2458,  3761,  5137,  6930,  8539,  9703,
   3,    65,  1232,  2692,  3901,  5408,  6979,  8625,
   6,    69,  1440,  2804,  4032,  5436,  7021,  8795, 
   7,   101,  1624,  2901,  4163,  5738,  7022,  8853,
   9,   482,  1668,  2959,  4402,  5743,  7035,  9044,
  11,   601,  1728,  2998,  4409,  5769,  7082,  9060,
  15,  1030,  1784,  3170,  4442,  5881,  7349,  9129,
  17,  1050,  1821,  3345,  4548,  6447,  7676,  9270,
  22,  1084,  1979,  3520,  4828,  6492,  7845,  9309,
"""


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












