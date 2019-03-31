"""
Comment
"""

eignir.an_matssvaedi <- eignir
eignir.an_matssvaedi$matssvaedi <- NULL
write.table(x = eignir.an_matssvaedi, row.names = F, file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\Lokaverkefni-Husnaedisval\\GognErling\\eignir_an_matssvaedi.txt", sep="\t")



write.table(x = eignir$nuvirdi, row.names = T, col.names = F,
            file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\Lokaverkefni-Husnaedisval\\GognErling\\grunn_gogn\\eignir_nuvirdi.txt", sep="\t")

write.table(x = eignir$ibm2, row.names = T, col.names = F,
            file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\Lokaverkefni-Husnaedisval\\GognErling\\grunn_gogn\\eignir_staerd.txt", sep="\t")

write.table(x = eignir$matssvaedi, row.names = T, col.names = F,
            file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\Lokaverkefni-Husnaedisval\\GognErling\\grunn_gogn\\eignir_svaedi.txt", sep="\t")

write.table(x = eignir$gaedi, row.names = T, col.names = F,
            file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\Lokaverkefni-Husnaedisval\\GognErling\\grunn_gogn\\eignir_gaedi.txt", sep="\t")



write.table(x = kunnar$greidslugeta, row.names = F, col.names = F,
            file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\Lokaverkefni-Husnaedisval\\GognErling\\grunn_gogn\\kunnar_greidslugeta.txt", sep="\t")

write.table(x = kunnar$staerd, row.names = F, col.names = F,
            file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\Lokaverkefni-Husnaedisval\\GognErling\\grunn_gogn\\kunnar_staerd.txt", sep="\t")

write.table(x = as_matssvaedi.df, row.names = F, col.names = F,
            file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\Lokaverkefni-Husnaedisval\\GognErling\\grunn_gogn\\kunnar_svaedi.txt", sep="\t")

write.table(x = kunnar$gaedi, row.names = F, col.names = F,
            file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\Lokaverkefni-Husnaedisval\\GognErling\\grunn_gogn\\kunnar_gaedi.txt", sep="\t")




valdar.eignir.index <- c(    1,   1281,   3265,   6250,   9872,  12245,  14920,  17937,
                             2,   1325,   3364,   6482,   9888,  12342,  15074,  17955,
                             3,   1762,   3478,   6600,  10204,  12444,  15224,  18076,
                             4,   1831,   3541,   6964,  10214,  12474,  15373,  18170,
                             9,   1875,   3901,   7167,  10430,  13071,  15395,  18655,
                             13,   2009,   3954,   7289,  10464,  13143,  15480,  18904,
                             33,   2051,   4056,   7749,  10500,  13146,  15535,  18911,
                             38,   2193,   4217,   7872,  10619,  13570,  15679,  19293,
                             40,   2243,   4366,   7925,  10729,  13579,  15683,  19400,
                             58,   2352,   4514,   7942,  10896,  13806,  16038,  19413,
                             106,   2442,   4677,   8016,  10983,  13899,  16076,  19492,
                             398,   2557,   4943,   8236,  11154,  13935,  16171,  19569,
                             465,   2667,   4948,   9044,  11360,  14083,  16375,  19643,
                             545,   2718,   4990,   9112,  11459,  14187,  17042,
                             650,   2732,   5116,   9148,  11619,  14276,  17180,
                             674,   2756,   5743,   9233,  11669,  14421,  17350,
                             879,   3031,   6060,   9563,  11776,  14623,  17408,
                             1222,   3158,   6096,   9661,  11794,  14712,  17631,
                             1230,   3207,   6214,   9735,  12099,  14731,  17875 )


summa <-0
for(i in valdar.eignir.index){
  summa = summa + eignir$nuvirdi[i]
}


valdar.eignir <- subset(eignir, nrhus%in%valdar.eignir.index)

fjarmagn
(fjarmagn-sum(valdar.eignir$nuvirdi))

str(eignir)


m[m[, "three"] == 11,]