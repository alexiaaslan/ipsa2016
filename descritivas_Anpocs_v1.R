#definindo o diretorio
setwd("D:/Firefox Downloads")

#abrindo o banco:
dados <- read.csv("/Users/6912700.FFLCH/Desktop", dec=".", header=TRUE, sep=";", stringsAsFactors=FALSE)
dados <- data.frame
#nesse banco, renomeei no Excel as variáveis de recursos para v1 v2, v3 etc pra facilitar a manipulação

#checando como os dados ficaram por variavel
str(dados_anpocs)

#como os valores vieram em chr, vamos deixa-las como numerico:
dados_anpocs$v1 <- as.numeric(dados_anpocs$v1)
dados_anpocs$v2 <- as.numeric(dados_anpocs$v2)
dados_anpocs$v3 <- as.numeric(dados_anpocs$v3)
dados_anpocs$v4 <- as.numeric(dados_anpocs$v4)
dados_anpocs$v5 <- as.numeric(dados_anpocs$v5)
dados_anpocs$v6 <- as.numeric(dados_anpocs$v6)
dados_anpocs$v7 <- as.numeric(dados_anpocs$v7)
dados_anpocs$v8 <- as.numeric(dados_anpocs$v8)


#teste dos dados
boxplot((log(dados_anpocs$v3)), na.rm =T)

#somando as variáveis que sao de origem partidária e tirando o log dela:

rec_part <- is.na(dados_anpocs$v5 + dados_anpocs$v4 + dados_anpocs$v1)
##por algum motivo - suspeito que por ter NAs demais, a V1 dava erro na soma. Desconsiderei ela no valor de recursos partidários sem muito peso na consciência por ter poucos valores. 
summary(rec_part)
recpart <- log(rec_part)
summary (recpart)
boxplot (recpart)

#agora, somando só os recursos do partido e de outros candidados/comitês como recursos partidários:
rec_part2 <- (dados_anpocs$v5 + dados_anpocs$v4)
summary(rec_part2)
#tirando o log dela pra ficar com dimensões padronizadas
recpart2 <- log(rec_part2)
summary (recpart2)

#criando uma dummy para dizer se foi eleito ou não:              

dados_anpocs$eleito <- ifelse(dados_anpocs$COD_SIT_TOT_TURNO == 2 | dados_anpocs$COD_SIT_TOT_TURNO == 3, c("1"), c("0"))
dados_anpocs$eleito <- as.factor(dados_anpocs$eleito)
summary (dados_anpocs$eleito)

#deixando o sexo como factor
dados_anpocs$sexo <- as.factor(dados_anpocs$CODIGO_SEXO)
summary (dados_anpocs$sexo)


#criando uma variável com todos os recursos:

rec_total <- rowSums(dados_anpocs[  ,33:41], na.rm=TRUE)
summary(rec_total)
#deixando o log da variável e também como numérica
rec_total.log <- as.numeric(log(rec_total))
summary(rec_total)

#criando o log de cada tipo de recurso restante:
rec_jur.log <- as.numeric(log(dados_anpocs$v7))
rec_fis.log <- as.numeric(log(dados_anpocs$v6))
rec_part.log <- recpart2

#variável só com recursos externos:
rec_ext.log <- rec_total.log - rec_part.log


#tomei a liberdade de olhar o sexo nos dados também, mas basta tirar esses parâmetros pra olhar os dados inteiros:

#para diferenciar sexo e eleitos nos gráficos:
#Cria cor diferente para homens e mulheres:
cols_sexo = ifelse(sexo=="FEMININO","red","black")
#deixa o quadrado preenchido para eleitos e um x para não-eleitos
pch_eleito = ifelse(dados_anpocs$eleito=="1",15,4)

#scatterplot:
plot(rec_part.log,rec_ext.log, col=cols_sexo, pch=pch_eleito, cex=0.5) 
#linhas para os quartis dos recursos externos
abline(h=0.086)
abline(h=0.727)
abline(h=1.028)
#linhas para os quartis dos recursos do partido
abline(v=8.572)
abline(v=10.370)
abline(v=12.310)

#correlação
corr_part_ext <- lm(rec_part.log ~ rec_ext.log)
#esse é o mais interessante: mostra que a distribuição dos recursos partidários não tem correlação com a de outros recursos, indicando outra estratégia na alocação desses recursos entre os candidatos.

#summary das variáveis de recursos
summary(rec_part.log)
summary(rec_ext.log)
summary(rec_total.log)
