setwd("/home/lasagna/ANPOCS_2016/Financiamento")
source("receitas2014.R")
source("cand_2014_depfed.R")
receitas <- read.table("receitas_2014.csv", sep = ";", header = T)
candidatos <- read.table("candidatos_2014.txt", sep = ";", header = T, fileEncoding =   "latin2")
candidatos <- candidatos[, c(6, 11:18, 21, 23, 25:45)]
names(candidatos)[5] <- "cpf"
names(candidatos)
names(receitas)
dados <- merge(candidatos, receitas, by = "cpf", all.x = T, all.y = F)

write.table(dados, file="dados_anpocs.csv", sep=";", row.names=FALSE)
