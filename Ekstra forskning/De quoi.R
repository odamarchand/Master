




# laste inn nasha gazeta


# Liste opp filer fra mappe
liste <- list.files(paste0("Downloads/test/2019/Latvia/Kremlnot"), 
                    full.names = TRUE)




# Bruker liste for å hente ut tekstene med pdf_text
NashaGazeta <- lapply(liste[1:11], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 


#   lag dataframe 
NashaGazetaframe <- do.call(rbind, NashaGazeta)  # do call brukes for funksjon på liste, r bind radbinder listen
substr(NashaGazetaframe$text[1], 1, 200) # teskt en, 200 ord - ikke nødvendig


# ta vekk withespace, samtidig lager vi tilfeldigvis om til character og ikke dataframe
library(stringr)

text <- str_trim(str_replace_all(NashaGazetaframe$text,   "\\s+",  " "))


# splitte tekst en til fire (foire tekster) ved linjeshsift
# text_list <- str_split(text[1:4], "\n")
#ta vekk tekst
# text <- str_replace_all(text, "Page [0-9]+ of [0-9]+ © 2019 Factiva, Inc. All rights reserved.", "")

# splitte sider
text_list <- str_split(text[1:11], pattern= "Document NAGAZ") # str_split_fixed og n = X er tatt bort


# se på 
substr(text_list[2], 1,4000)  # se på tekst en, 1000 tegn

# I regex er [0-9]+ tall   + betyr tillegg

# [0-9]+ 2019
# [a-z]+ hey
# [A-Z]+ HEY
# [a-zA-Z]+ HeY

library(tidyverse)

#lage dataframe i stedet for matrix, den ble det av en rar grunn
# text_list<- as_tibble (text_list)



substr(text_list[[1]], 1, 200)

tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble

data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 0,
                       land = "Latvia"),
                  stringAsFactors = FALSE)

library(quanteda)
corpusNashaGazeta <- corpus(data)

corpusNashaGazeta$documents$texts
docvars(corpusNashaGazeta)

summary(corpusNashaGazeta)

# ekstremt viktig å lage nytt navn her
save(corpusNashaGazeta, file = "Downloads/test/2019/Latvia/Kremlnot/Corpus_NashaGazeta.rda")

load("Downloads/test/2019/Latvia/Kremlnot/Corpus_NashaGazeta.rda")








########## Lime sammen alle til slutt ############

# lime sammen corpus for Vesti og Nasha Gazeta

corpus_vesti_nasha <- corpusNashaGazeta + corpusVesti 

summary(corpusNashaGazeta$documents$kreml)
summary(corpusVesti$documents$kreml)
summary(corpus_vesti_nasha$documents$kreml)

summary(corpus_vesti_nasha)

save(corpus_vesti_nasha, file = "Downloads/test/2019/Latvia/Limt_corpus_Vesti_NashaGaz.rda")





