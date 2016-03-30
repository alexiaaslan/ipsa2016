#definindo o diretorio
setwd("/Users/dcplab/Downloads")

#abrindo o banco:
dados <- read.csv("C:/Users/dcplab/Downloads/dados_anpocs.csv", dec=".", header=TRUE, sep=";", stringsAsFactors=FALSE)


#checando como os dados ficaram por variavel
str(dados)

#como os valores vieram em chr, vamos deixa-las como numerico:
dados$v1 <- as.numeric(dados$v1)
dados$v2 <- as.numeric(dados$v2)
dados$v3 <- as.numeric(dados$v3)
dados$v4 <- as.numeric(dados$v4)
dados$v5 <- as.numeric(dados$v5)
dados$v6 <- as.numeric(dados$v6)
dados$v7 <- as.numeric(dados$v7)
dados$v8 <- as.numeric(dados$v8)


#checando se todos os valores estao como numericos:
boxplot(density(dados$v2))

#checando se existe missing:
length(dados$Valor.receita.Recuros.de.origens.nao.identificadas[is.na(dados$Valor.receita.Recuros.de.origens.nao.identificadas)])
recpart <- (log(dados$v4 + dados$v5))

boxplot(recpart~CODIGO_SEXO, data=dados)
summary(dados)
