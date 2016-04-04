#definindo o diretorio
setwd("/Users/Marina/Desktop")
#listando os documentos com os dados
lista.arquivos <-list.files(file.path(getwd(),"/Cand 2010"))
#pegando somente os documentos com as candidaturas
lista.arquivos <- grep(pattern="consulta_cand_2010_", lista.arquivos, value=TRUE)
#deletei na mão o arquivo BR na pasta porque tava dando pau no script por algum motivo
lista.arquivos <- lista.arquivos[c(1:27)]

#criando um unico dataframe para todos os Estados
cand2010 <- data.frame()
for(arquivo in lista.arquivos){
  print (arquivo)
  d <- read.table(file.path(getwd(), "/Cand 2010", arquivo), fill = TRUE, sep=";",quote = "\"'",
                  dec = ".", header=FALSE, fileEncoding = "latin2", stringsAsFactors = F)
  cand2010 <-rbind(cand2010, d)
}
#dando nomes pras colunas
names(cand2010) <- c("DATA_GERACAO_2010",
                         "HORA_GERACAO_2010",
                         "ANO_ELEICAO_2010",
                         "NUM_TURNO_2010",
                         "DESCRICAO_ELEICAO_2010",
                         "SIGLA_UF_2010",
                         "SIGLA_UE_2010",
                         "DESCRICAO_UE_2010",
                         "CODIGO_CARGO_2010",
                         "DESC_CARGO_2010",
                         "NOME_CANDIDATO_2010",
                         "SEQUENCIAL_CANDIDATO_2010",
                         "NUMERO_CANDIDATO_2010",
                         "cpf",
                         "NOME_URNA_CANDIDATO_2010",
                         "COD_SITUACAO_CANDIDATURA_2010",
                         "DES_SITUACAO_CANDIDATURA_2010",
                         "NUMERO_PARTIDO_2010",
                         "SIGLA_PARTIDO_2010",
                         "NOME_PARTIDO_2010",
                         "CODIGO_LEGENDA_2010",
                         "SIGLA_LEGENDA_2010",
                         "COMPOSICAO_LEGENDA_2010",
                         "NOME_LEGENDA_2010",
                         "CODIGO_OCUPACAO_2010",
                         "DESCRICAO_OCUPACAO_2010",
                         "DATA_NASCIMENTO_2010",
                         "NUM_TITULO_ELEITORAL_CANDIDATO_2010",
                         "IDADE_DATA_ELEICAO_2010",
                         "CODIGO_SEXO_2010",
                         "DESCRICAO_SEXO_2010",
                         "COD_GRAU_INSTRUCAO_2010",
                         "DESCRICAO_GRAU_INSTRUCAO_2010",
                         "CODIGO_ESTADO_CIVIL_2010",
                         "DESCRICAO_ESTADO_CIVIL_2010",
                         "CODIGO_NACIONALIDADE_2010",
                         "DESCRICAO_NACIONALIDADE_2010",
                         "SIGLA_UF_NASCIMENTO_2010",
                         "CODIGO_MUNICIPIO_NASCIMENTO_2010",
                         "NOME_MUNICIPIO_NASCIMENTO_2010",
                         "DESPESA_MAX_CAMPANHA_2010",
                         "COD_SIT_TOT_TURNO_2010",
                         "DESC_SIT_TOT_TURNO_2010")

# subset de deputado federal
cand2010 <- subset (cand2010, DESC_CARGO_2010=="DEPUTADO FEDERAL")

# salvar em arquivo txt
write.table(cand2010, file.path(getwd(), paste("CandidaturasDepFed", "2010", ".txt", sep = "")),
            sep = ";",
            quote = T,
            dec = ",",
            row.names = F,
            col.names = T)
print ("tarefa completada!")
