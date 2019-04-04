library(tidyr)
library(dplyr)
library(ggplot2)
library(knitr)
library(reshape2)

# Sidustu tvaer eignir og kunnar:
#      5813 993 
#      8530 997


# Read clean information about properties and customers
eignir1 <- read.csv(file="C:\\Users\\ellio\\Documents\\hi\\v19\\adggr\\Lokaverkefni-Husnaedisval\\GognErling\\eignir.txt", sep="\t")
kunnar1 <- read.csv(file="C:\\Users\\ellio\\Documents\\hi\\v19\\adggr\\Lokaverkefni-Husnaedisval\\GognErling\\kunnar.txt", sep="\t")


# Local location of .txt files with tables of selected customers and properties
rot <- "C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\amplProjects\\lokaverkefni\\Zs\\"


skrar <- c("z1-18.txt", "z19-36.txt", "z37-54.txt", "z55-72.txt", "z73-90.txt", "z91-108.txt", "z109-126.txt",
           "z127-144.txt", "z145-162.txt", "z163-180.txt", "z181-198.txt", "z199-216.txt", "z217-234.txt",
           "z235-252.txt", "z253-270.txt", "z271-288.txt", "z289-306.txt", "z307-324.txt", "z325-342.txt",
           "z343-360.txt", "z361-378.txt", "z379-396.txt", "z397-414.txt", "z415-432.txt", "z433-450.txt",
           "z451-468.txt", "z469-486.txt", "z487-504.txt", "z505-522.txt", "z523-540.txt", "z541-558.txt",
           "z559-576.txt", "z577-594.txt", "z595-612.txt", "z613-630.txt", "z631-648.txt", "z649-666.txt",
           "z667-684.txt", "z685-702.txt", "z703-720.txt", "z721-738.txt", "z739-756.txt", "z757-774.txt",
           "z775-792.txt", "z793-810.txt", "z811-828.txt", "z829-846.txt", "z847-864.txt", "z865-882.txt",
           "z883-900.txt", "z901-918.txt", "z919-936.txt", "z937-954.txt", "z955-972.txt", "z973-990.txt")

# 990 different potential customers in these files.
colNames <-  matrix(1:990, nrow = 18)

# and these are the 217 properties that were purchased
rowNames = c(5283, 9744, 11994, 19433, 2378, 2518, 2600, 5144, 19071, 8319, 12645, 1098, 5062, 5785, 12673, 12968, 18494, 
           2707, 4398, 6262, 16116, 16392, 18280, 18544, 2834, 4859, 9434, 19152, 148, 4148, 7092, 8681, 18085, 4939, 6127, 
           12152, 17743, 5598, 7579, 405, 4751, 18905, 19159, 1603, 1631, 6351, 6546, 8798, 16865, 9763, 12136, 13423, 
           15654, 18720, 840, 5235, 5421, 6905, 8015, 8853, 9574, 1405, 1414, 7149, 13386, 15726, 108, 349, 719, 3588, 5645, 
           13960, 4494, 7715, 15907, 17118, 18163, 18600, 3049, 3818, 4268, 5068, 10222, 365, 1201, 10685, 15475, 19309,
           4760, 5821, 7962, 13965, 728, 3650, 7279, 8595, 12766, 8324, 8428, 14298, 16890, 1543, 2322, 6308, 15219, 18362,
           19362, 930, 6315, 19351, 2156, 7575, 11412, 12683, 5897, 13225, 17630, 2992, 18132, 897, 1287, 1878, 16591, 17982, 
           18205, 10736, 11339, 19412, 3770, 7489, 8992, 19639, 9612, 11421, 13464, 13923, 17973, 1347, 8498, 18990, 394, 3413,
           7102, 8625, 18328, 2393, 7836, 14933, 5692, 16919, 132, 12964, 17913, 18368, 891, 11871, 16923, 17363, 18853, 6422,
           2716, 4768, 10260, 14887, 520, 4908, 10302, 12180, 18797, 7267, 17709, 19248, 5565, 7376, 9333, 10871, 10977, 14829,
           411, 4557, 5795, 6435, 9790, 6900, 7694, 8360, 8758, 2918, 8340, 11393, 16663, 17778, 6400, 6971, 3507, 7144, 7669,
           9067, 6930, 8302, 9158, 9258, 15613, 355, 2116, 4037, 5595, 11298, 13246, 17450, 18817, 4877, 6395, 9803, 17624, 5813, 8530)

# list to store matching customers and properties 
# so that customer valdir.kunnar.list[i] rents property leigdar.eignir.list[i]
valdir.kunnar.list <- vector()
leigdar.eignir.list <- vector()

# iterators
ff <- length(skrar)
L = 0
D = 0

# for each 18 potential customers,
#   if the customer rented a property (z[i,j]= valdir.kunnar.df[i,j]==1),
#     store the index of that customer and property with the same index 
for(f in (1:ff)){
  if(skrar[f]!="z595-612.txt"){ # this one is empty. There were no renters in this range of nrkunna
    valdir.kunnar.df <- read.csv2(file=paste(rot,skrar[f],sep=""), header=F, sep="")
    l = nrow(valdir.kunnar.df)
    d = ncol(valdir.kunnar.df)
    
    for(j in (1:d)){
      for(i in (1:l)){
        if(valdir.kunnar.df[i,j] == 1){
          valdir.kunnar.list = append(valdir.kunnar.list, colNames[D+j])
          leigdar.eignir.list = append(leigdar.eignir.list, rowNames[L+i])
        } 
      }
    }
    L = L+l
    D = D+d
  }
  else {
    D = D+18
  }
}

# add the last two customers and properties, read by the author
valdir.kunnar.list = append(valdir.kunnar.list, c(993,997))
leigdar.eignir.list = append(leigdar.eignir.list, c(5813, 8530))

# store the number of renters
fjoldi_leigjenda <- length(valdir.kunnar.list)
fjoldi_eigna <- length(leigdar.eignir.list)

if(fjoldi_eigna != fjoldi_leigjenda) print("Fjoldi eigna og leigjenda er ekki jafn")


# Now check if all constraints are met for each property and customer combination
for(i in (1:fjoldi_leigjenda)){
  if( !(kunnar1$gaedi[valdir.kunnar.list[i]] <= eignir1$gaedi[leigdar.eignir.list[i]])){
    print(paste("gaedakrofur stodust ekki vegna kunna ",  valdir.kunnar.list[i], " og eignar ", leigdar.eignir.list[i]))
    print(paste("gaedakrofur kunnans eru ", kunnar1$gaedi[valdir.kunnar.list[i]], " og gaedi eignar eru ", eignir1$gaedi[leigdar.eignir.list[i]]))
  } 
  if( !(kunnar1$staerd[valdir.kunnar.list[i]] <= eignir1$ibm2[leigdar.eignir.list[i]])){
    print(paste("staerdarkrofur stodust ekki vegna kunna ",  valdir.kunnar.list[i], " og eignar ", leigdar.eignir.list[i]))
    print(paste("staerdarkrofur kunnans eru ", kunnar1$staerd[valdir.kunnar.list[i]], " og staerd eignar er ", eignir1$ibm2[leigdar.eignir.list[i]]))
  } 
  if( !(kunnar1$greidslugeta[valdir.kunnar.list[i]] >= 5*eignir1$nuvirdi[leigdar.eignir.list[i]])){
    print(paste("verdkrofur stodust ekki vegna kunna ",  valdir.kunnar.list[i], " og eignar ", leigdar.eignir.list[i]))
    print(paste("greidslugeta kunnans er ", kunnar1$greidslugeta[valdir.kunnar.list[i]], " og leigukostnadur eignar er ", 5*eignir1$nuvirdi[leigdar.eignir.list[i]]))
  } 
}

summa = 0
# Calculate the sum of the properties
for(e in leigdar.eignir.list){
  summa = summa + eignir1$nuvirdi[e]
}
print(paste("Keyptum eignir fyrir", summa*1000, "kr."))





### Some other stuff here below.
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












