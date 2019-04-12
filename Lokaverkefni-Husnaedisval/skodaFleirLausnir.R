library(tidyr)
library(dplyr)
library(ggplot2)

# Sidustu eignir og kunnar:
#      8530 997

rot <- "C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\amplProjects\\lokaverkefni\\z3\\"

# Read clean information about properties and customers
eignir1 <- read.csv(file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\Lokaverkefni-Husnaedisval\\GognErling\\eignir.txt", sep="\t")
kunnar1 <- read.csv(file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\Lokaverkefni-Husnaedisval\\GognErling\\kunnar.txt", sep="\t")

z3a <- read.table(file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\amplProjects\\lokaverkefni\\z3\\z3a.txt", sep="\t", header=F)
zcolnames <- as.vector(z3a[1,])[2:length(z3a[1,])]
zrownames <- as.vector(z3a[,1])[2:length(z3a[,1])]
z3a <- data.frame(z3a[-1,-1], row.names=zrownames)
names(z3a) <- zcolnames

z3b <- read.csv(file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\amplProjects\\lokaverkefni\\z3\\z3b.txt", sep="\t")
zcolnames <- as.vector(z3b[1,])[2:length(z3b[1,])]
zrownames <- as.vector(z3b[,1])[2:length(z3b[,1])]
z3b <- data.frame(z3b[-1,-1], row.names=zrownames)
names(z3b) <- zcolnames

z3c <- read.csv(file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\amplProjects\\lokaverkefni\\z3\\z3c.txt", sep="\t")
zcolnames <- as.vector(z3c[1,])[2:length(z3c[1,])]
zrownames <- as.vector(z3c[,1])[2:length(z3c[,1])]
z3c <- data.frame(z3c[-1,-1], row.names=zrownames)
names(z3c) <- zcolnames

z3d <- read.csv(file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\amplProjects\\lokaverkefni\\z3\\z3d.txt", sep="\t")
zcolnames <- as.vector(z3d[1,])[2:length(z3d[1,])]
zrownames <- as.vector(z3d[,1])[2:length(z3d[,1])]
z3d <- data.frame(z3d[-1,-1], row.names=zrownames)
names(z3d) <- zcolnames

z3e <- read.csv(file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\amplProjects\\lokaverkefni\\z3\\z3e.txt", sep="\t")
zcolnames <- as.vector(z3e[1,])[2:length(z3e[1,])]
zrownames <- as.vector(z3e[,1])[2:length(z3e[,1])]
z3e <- data.frame(z3e[-1,-1], row.names=zrownames)
names(z3e) <- zcolnames

z3f <- read.csv(file="C:\\Users\\Erling Oskar\\Documents\\hi\\v19\\adggr\\amplProjects\\lokaverkefni\\z3\\z3f.txt", sep="\t")
zcolnames <- as.vector(z3f[1,])[2:length(z3f[1,])]
zrownames <- as.vector(z3f[,1])[2:length(z3f[,1])]
z3f <- data.frame(z3f[-1,-1], row.names=zrownames)
names(z3f) <- zcolnames

Zs <- list(z3a, z3b, z3c, z3d, z3e, z3f)
pairs <- vector()

for(Z in Zs){
  for(i in (1:dim(Z)[1])){
    for(j in (1:dim(Z)[2])){
      if(Z[i,j] == 0){
        pairs <- append(pairs, c(names(Zs)[i],row.names(Zs)[j]))
      }
    }
  }
}




x3 <- c(    1, 1353, 3184, 5797, 9044, 11893, 15013, 17352,
            3, 1467, 3334, 5813, 9156, 11999, 15030, 17373,
            7, 1503, 3447, 5944, 9197, 12335, 15212, 17492,
            8, 1574, 3452, 6032, 9393, 12704, 15420, 17556,
            9, 1584, 3554, 6246, 9489, 12741, 15462, 17686,
            17, 1655, 3617, 6337, 9525, 13071, 15481, 17709,
            39, 1782, 3697, 6564, 9681, 13184, 15649, 18010,
            59, 1800, 3756, 6657, 9905, 13242, 15901, 18034,
            80, 1971, 3929, 6671, 9988, 13286, 15935, 18071,
            101, 1996, 4008, 6716, 10213, 13293, 15948, 18227,
            115, 2099, 4157, 6732, 10221, 13325, 15990, 18247,
            153, 2102, 4279, 6902, 10285, 13375, 16022, 18538,
            433, 2138, 4339, 6988, 10364, 13434, 16364, 18573,
            435, 2347, 4424, 7153, 10371, 13478, 16391, 18707,
            450, 2355, 4522, 7535, 10863, 13548, 16611, 18907,
            640, 2396, 4579, 7752, 10950, 13887, 16683, 18943,
            712, 2458, 4671, 7881, 10968, 14019, 16728, 19234,
            849, 2623, 4726, 8358, 11038, 14174, 16755, 19235,
            891, 2635, 5125, 8409, 11173, 14483, 17076, 19275,
            1110, 2676, 5198, 8613, 11209, 14491, 17257, 19491,
            1112, 2801, 5331, 8617, 11261, 14506, 17285, 19497,
            1185, 2854, 5743, 8862, 11525, 14684, 17290, 19502,
            1270, 2916, 5763, 8936, 11571, 14910, 17335, 19563,
            1348, 3115, 5788, 8939, 11817, 14997, 17350)

y3 <- subset(eignir1, nrhus%in%x3)

sum(y3$nuvirdi)
