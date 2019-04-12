# Besta lausn med 6% ROI krofu (0.5% per month)
# 221, 31499734.5, 6299947000

# Besta lausn med 7.2% ROI krofu (0.6% per month)
# 239, 37799759.4, 6299959900

# Besta lausn med 8.28% ROI krofu (0.69% per month)
# 257, 43469454.21, 6299920900

# Besta lausn med 8.4% ROI krofu (0.7% per month)
# 247, 42400121.4, 6057160200

# Besta lausn med 9.6% ROI krofu (0.8% per month)
# 133, 23328999.2, 2916124900

# Besta lausn med 10.8% ROI krofu (0.9% per month)
# 77, 13779792, 1531088000

# Besta lausn med 12.0% ROI krofu (1.0% per month)
# 47, 7693413, 769341300

# Besta lausn med 14.2% ROI krofu (1.1% per month)    endurskoda
# 225, 4025249.8, 365931800

# Besta lausn med 14.2% ROI krofu (1.2% per month)
# 39, 1865354.4, 155446200

# Besta lausn med 14.2% ROI krofu (1.3% per month)
# 15, 787844.2, 60603400

# Besta lausn med 14.2% ROI krofu (1.4% per month)
# 4, 810537, 57895500

# Besta lausn med 17.4% ROI krofu (1.5% per month)    endurskoda
# 1, 214500, 14300000

# Besta lausn med 17.4% ROI krofu (1.6% per month)    endurskoda
# 0, 0, 0

naemnigr_prosenta <- append(c(0.5, 0.6, 0.69), c(7:16)/10)
naemnigr_fjoldi_eigna <- c(221, 239, 257, 247, 133, 77, 47, 225, 39, 15, 4, 1, 0)
naemnigr_leigutekjur <- c(31499734.5, 37799759.4, 43469454.21, 42400121.4, 23328999.2, 13779792, 7693413, 4025249.8, 1865354.4, 787844.2, 810537, 214500, 0)
naemnigr_fjarfesting <- c(6299947000, 6299959900, 6299920900, 6057160200, 2916124900, 1531088000, 769341300, 365931800, 155446200, 60603400, 57895500, 14300000, 0)

length(naemnigr_leigutekjur)

# Verðmætasta eignin i thessum skilningi: nr 7850, leigist til kunna 934
# > eignir1[7850,]
# nrhus nuvirdi ibm2 matssvaedi gaedi
# 7850   14300  66.3     Gerdin 2.602
# > kunnar1[934,]
# nrkunna gaedi staerd greidslugeta
# 934     2.566     64       225538
# > kunnar$as_matsvaedi[934]
# [1] "Hlidar Vesturbaer LaugarneshverfiVogar Breidholt Fossvogur Midbaer Haaleiti Gerdin Kopavogur"




# Besta lausn med fostum rekstrarkostnadi
naemingr1_fastur_kostnadur <- c(50000, 100000, 150000, 200000, 230000, 250000)
naemingr1_fjoldi_keyptra_eigna <- c(158, 158, 157, 66, 13, 0)



# Read clean information about properties and customers
eignir1 <- read.csv(file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\Lokaverkefni-Husnaedisval\\GognErling\\eignir.txt", sep="\t")
kunnar1 <- read.csv(file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\Lokaverkefni-Husnaedisval\\GognErling\\kunnar.txt", sep="\t")


# Local location of .txt files with tables of selected customers and properties
rot <- "C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\amplProjects\\lokaverkefni\\Zs\\"


#z4a <- read.csv(file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\amplProjects\\lokaverkefni\\z4a.txt", sep=",", header=F)
# pairs <- c(3548, 15, 3653, 10 ,4935, 4  ,5664, 67 ,5666, 28 ,5967, 2 ,6563, 59 ,8141, 69 ,9227, 43 ,9640, 55 ,11519, 27,11661, 60,12132, 31,13908, 56,15106, 20,17743, 35,18290, 24,19297, 74 ,19, 95 ,1862, 144 ,2037, 136 ,2601, 87  ,2775, 79  ,2780, 115 ,4921, 76  ,6307, 93  ,7430, 131 ,9915, 91  ,13829, 89 ,16089, 92 ,18166, 75 ,18465, 120,18782, 111,18816, 128,19435, 133,19672, 147,1411, 160,1543, 204,1782, 174,2871, 201,3110, 162,3190, 188,4655, 184,5197, 156,9222, 183,9590, 199,9603, 155,9903, 167,12175, 186,13064, 195,16164, 175,17415, 167,18251, 178,18308, 197)


z4 <- read.csv(file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\amplProjects\\lokaverkefni\\zLAUSNWOO.txt", sep=",", header=T)

#z4rn <- as.vector(z4[,1])[1:length(z4[,1])]
z4rn <- as.vector(row.names(z4))
#z4 <- data.frame(z4[,-1], row.names=z4rn)
z4cn <- c(
  879, 884, 886, 888, 889, 890, 905, 906, 908, 917, 924, 931, 932, 933, 936, 945, 959, 968
  )

for(i in (1:length(z4))){
  for(j in (1:length(z4))){
    if(z4[i,j]==1) pairs = append(pairs, c( z4rn[i],z4cn[j] ) )
  }
}

sidustu <- c(2926   ,972, 5713   ,991, 7049   ,986, 11613  ,973, 12376  ,993)

pairs <- append(pairs, sidustu)

pairs.df <- as.data.frame(pairs)
eig <- c()
kun <- c()


for(i in seq(1, length(pairs), 2 )){
  eig <- append(eig, pairs[i])
  kun <- append(kun, pairs[i+1])
}

fjoldi <- length(kun)

kun <- as.numeric(kun)
eig <- as.numeric(eig)


for(i in (1:fjoldi)){
  if( !(kunnar1$gaedi[kun[i]] <= eignir1$gaedi[eig[i]])) {
    print(paste("i", i))
    print(paste("gaedakrofur stodust ekki vegna kunna ",  kun[i], " og eignar ", eig[i]))
    print(paste("gaedakrofur kunnans eru ", kunnar1$gaedi[kun[i]], " og gaedi eignar eru ", eignir1$gaedi[eig[i]]))
  } 
  if( !(kunnar1$staerd[kun[i]] <= eignir1$ibm2[eig[i]])){
    print(paste("staerdarkrofur stodust ekki vegna kunna ",  kun[i], " og eignar ", eig[i]))
    print(paste("staerdarkrofur kunnans eru ", kunnar1$staerd[kun[i]], " og staerd eignar er ", eignir1$ibm2[eig[i]]))
  } 
  if( !(kunnar1$greidslugeta[kun[i]] >= 5*eignir1$nuvirdi[eig[i]])){
    print(paste("verdkrofur stodust ekki vegna kunna ",  kun[i], " og eignar ", eig[i]))
    print(paste("greidslugeta kunnans er ", kunnar1$greidslugeta[kun[i]], " og leigukostnadur eignar er ", 5*eignir1$nuvirdi[eig[i]]))
  } 
}




gaedi.k <- vector()
gaedi.e <- vector()
staerd.k <- vector()
staerd.e <- vector()
leiga.k <- vector()
leiga.e <- vector()

for(i in (1:fjoldi)){
  gaedi.k <- append(gaedi.k, kunnar1$gaedi[kun[i]])
  gaedi.e <- append(gaedi.e, eignir1$gaedi[eig[i]])
  staerd.k <- append(staerd.k, kunnar1$staerd[kun[i]])
  staerd.e <- append(staerd.e, eignir1$ibm2[eig[i]])
  leiga.k <- append(leiga.k, kunnar1$greidslugeta[kun[i]])
  leiga.e <- append(leiga.e, 5.0*eignir1$nuvirdi[eig[i]])
}


svaedi.k <- vector()
svaedi.e <- vector()
for(i in (1:fjoldi)){
  svaedi.k <- append(svaedi.k, kunnar$as_matsvaedi[kun[i]])
  svaedi.e <- append(svaedi.e, eignir_matssvaedi.list[eig[i]])
}

eignir1$matssvaedi[[,2]]
sum(leiga.e)




eig_og_kun.df <- as.data.frame(cbind(eig, kun, gaedi.e, gaedi.k, staerd.e, staerd.k, leiga.e, leiga.k, svaedi.e, svaedi.k))
names(eig_og_kun.df) <- c("i", "k", "gi", "gj", "mi", "mj", "ci", "cj", "si", "sj")



# write.table(x = eig_og_kun.df, row.names = F, col.names = T,
#            file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\Lokaverkefni-Husnaedisval\\GognErling\\grunn_gogn\\eig_og_kun.txt", sep="\t")





AsaettanlegMatssvaedi <- as.data.frame(as_matsvaedi)
paste(eignir1[3653,]$matssvaedi %in% as_matsvaedi[10])


grepl(eignir1[3548,]$matssvaedi, as_matsvaedi[15])
grepl(eignir1[3653,]$matssvaedi, as_matsvaedi[10])
grepl(eignir1[4935,]$matssvaedi, as_matsvaedi[4])
grepl(eignir1[5664,]$matssvaedi, as_matsvaedi[67])
grepl(eignir1[5666,]$matssvaedi, as_matsvaedi[28])
grepl(eignir1[5967,]$matssvaedi, as_matsvaedi[2])
grepl(eignir1[6563,]$matssvaedi, as_matsvaedi[59])
grepl(eignir1[8141,]$matssvaedi, as_matsvaedi[69])
grepl(eignir1[9227,]$matssvaedi, as_matsvaedi[43])
grepl(eignir1[4935,]$matssvaedi, as_matsvaedi[4])
grepl(eignir1[9640,]$matssvaedi, as_matsvaedi[55])

grepl(eignir1[3548,]$matssvaedi, as_matsvaedi[15])
grepl(eignir1[3653,]$matssvaedi, as_matsvaedi[10])
grepl(eignir1[4935,]$matssvaedi, as_matsvaedi[4])
grepl(eignir1[5664,]$matssvaedi, as_matsvaedi[67])
grepl(eignir1[5666,]$matssvaedi, as_matsvaedi[28])
grepl(eignir1[5967,]$matssvaedi, as_matsvaedi[2])
grepl(eignir1[6563,]$matssvaedi, as_matsvaedi[59])
grepl(eignir1[8141,]$matssvaedi, as_matsvaedi[69])
grepl(eignir1[9227,]$matssvaedi, as_matsvaedi[43])
grepl(eignir1[4935,]$matssvaedi, as_matsvaedi[4])
grepl(eignir1[12376,]$matssvaedi, as_matsvaedi[993])

eignir1[5666,]
kunnar1[28,]



# Næmnigreining 
# 




