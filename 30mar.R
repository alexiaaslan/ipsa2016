getwd()

dados <- read.csv("dados_anpocs.csv", dec=".", header=TRUE, sep=";", stringsAsFactors=FALSE, fileEncoding = "UTF-8", colClasses = )

dados$DESPESA_MAX_CAMPANHA <- as.numeric(dados$DESPESA_MAX_CAMPANHA)

#

boxplot(log(dados$valor.Recursos.de.origens.nao.identificadas), na.rm = T)

#

dados <- gsub("NA", "-1", dados$valor.Doaçoes.pela.Internet)

anpocs <- dados

table(dados$DESC_SIT_TOT_TURNO, dados$valor.Recursos.próprios)

summary(dados$valor.Doaçoes.pela.Internet)

dados$valor.Recursos.de.origens.nao.identificadas[dados$valor.Recursos.de.origens.nao.identificadas=="NA"] <- -1


barplot(p, where p == "ELEITO POR MÉDIA")

eleito <- dados$COD_SIT_TOT_TURNO


p <- table(dados$DESC_SIT_TOT_TURNO)

x <- (dados$valor.Recursos.próprios)

ddply(eleito, "2", numcolwise(sum))
