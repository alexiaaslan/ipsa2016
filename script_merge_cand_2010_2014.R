##dando merge nas candidaturas de 2010 com as de 2014 pra pegar incumbency##

#abrindo os dois bancos:
setwd("C:/Users/Marina/Desktop/")
cand_rec_2014 <- read.csv("C:/Users/Marina/Desktop/cand_rec_2014.txt", sep=";", stringsAsFactors=FALSE)
cand2010 <- read.csv("C:/Users/Marina/Desktop/CandidaturasDepFed2010.txt", sep=";", stringsAsFactors=FALSE)

#limpando o banco de 2010 com variáveis que não precisamos ou que se repetem em 2014
cand2010$DATA_GERACAO_2010 <- NULL
cand2010$DATA_NASCIMENTO_2010 <- NULL
cand2010$DESCRICAO_SEXO_2010 <- NULL
cand2010$HORA_GERACAO_2010 <- NULL
cand2010$NOME_MUNICIPIO_NASCIMENTO_2010 <- NULL
cand2010$NUM_TURNO_2010 <- NULL
cand2010$SIGLA_UE_2010 <- NULL
cand2010$DESC_CARGO_2010 <- NULL
cand2010$SIGLA_UF_NASCIMENTO_2010 <- NULL
cand2010$DESCRICAO_NACIONALIDADE_2010 <- NULL

#deixando a variável de merge igual nos dois bancos

cand2010$SEQUENCIAL_CANDIDATO <- cand2010$SEQUENCIAL_CANDIDATO_2010

#banco com todas as candidaturas de 2014, indicando os que também foram em 2010
cand2010_2014 <- merge(cand2010, cand_rec_2014, by = "SEQUENCIAL_CANDIDATO", all.x=F, all.y=T)

#checando o merge - deve ter o mesmo número de observações que o banco "cand_rec_2014":
str(cand2010_2014)

#salvando
write.table(dadoscompletos, file="cand_2010_2014.csv", sep=";", row.names=FALSE)