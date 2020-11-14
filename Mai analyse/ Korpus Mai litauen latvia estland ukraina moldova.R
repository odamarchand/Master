
##### Korpuser for kun Mai ###  Litauen, Latvia, Estland, Ukraina, Moldova



                        # endr3 MAI KOMS PRAVDA, spesifikt denne
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_KomsPr_Mai.rda")  
KomsPrMai <- corpus 



# se på matrise før

DDD <- as.data.frame(docvars(KomsPrMai)) 


# Endre variabelen "2" på "Plassering", til 1 

test <- KomsPrMai 

test <- test %>% 
  tidytext::tidy() %>% 
  mutate(Plassering = ifelse(Plassering == "2", "1", Plassering)) %>%
  corpus()

table(docvars(test, "Plassering"))

table(docvars(KomsPrMai , "Plassering"))                                                 # se matrise etter                                


KomsPrMai <- test                                                                                        
DDD2 <- as.data.frame(docvars(KomsPrMai))


save(KomsPrMai, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_KomsPr_Mai_MAI.rda")

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_KomsPr_Mai_MAI.rda")











# Lage korpus for bare MAI

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_NashaGazeta_Mai.rda")
summary(corpusNashaGazetaMai)

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Vesti_Mai.rda")
corpusVestiMai 

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Mixnews_Mai.rda")
MixMai <- corpusMixNews

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_MK_Mai.rda")
MkMai <- corpusMK

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Delfi_Mai.rda")
DelfiMai <- corpusDelfi

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Postimees_Mai.rda")
PostiMai <- corpusPosti 

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_ELTA_Mai.rda")
EltaMai <- corpusELTA 

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Ua112_Mai.rda")
Ua112Mai <- corpusUa112 

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_ObozPDF_Mai.rda")
ObozMai <- corpusObozPDF 

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Sputnik_Mai.rda")
SputnikMai <- corpus  

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_KomsPr_Mai_MAI.rda")
KomsPrMai 
summary(KomsPrMai)






# Sammenslå den, meni to deler, for factiva og integrum 
CorpusMaiFact1 <- corpusVestiMai + corpusNashaGazetaMai + MixMai 
CorpusMaiFact2 <- MkMai + DelfiMai + PostiMai + EltaMai + Ua112Mai

CorpusFACTmai <- CorpusMaiFact1 + CorpusMaiFact2
save(CorpusFACTmai , file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/CorpusFACTmai.rda")


CorpusInteMai <- KomsPrMai + ObozMai + SputnikMai
save(CorpusInteMai , file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/CorpusInteMai.rda")





# legge til ekstra variabel på alle: arkiv: Integrum og Factiva 

# FACTIVA 
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/CorpusFACTmai.rda")
  
corp <- CorpusFACTmai
docvars(corp, "arkiv") <- paste("Factiva", sep = "")
summary(corp) 

head(docvars(corp))
summary(docvars(corp))
docvars(corp)
corp # 12 docvars

CorpusFACTmai <- corp 

# se på dem i et datasett
II <- as.data.frame(docvars(CorpusFACTmai)) 

save(CorpusFACTmai, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/CorpusFACTmai.rda")



#INTEGRUM
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/CorpusInteMai.rda")

corp <- CorpusInteMai
docvars(corp, "arkiv") <- paste("Integrum", sep = "")
summary(corp) 
head(docvars(corp))
summary(docvars(corp))
docvars(corp)
corp # 12 docvars

CorpusInteMai  <- corp 

# se på dem i et datasett
II <- as.data.frame(docvars(CorpusInteMai)) 

save(CorpusInteMai, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/CorpusInteMai.rda")




# lime sammen de to 
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/CorpusFACTmai.rda")
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/CorpusInteMai.rda")

# sjekke at tilstanden er bra 
FFF <- as.data.frame(docvars(CorpusFACTmai))
III <- as.data.frame(docvars(CorpusInteMai))

CORPMai <- CorpusInteMai + CorpusFACTmai
ww <- as.data.frame(docvars(CORPMai)) 

save(CORPMai, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/CORPMai.rda")



##HUSK Å ALLTID KJØRE DISSE TO KODENE! 

# endre navn på variabler generelt 

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/CORPMai.rda")

# Endre variabelen "medium" på Russortod, til middels, slik at begge er like

test <- CORPMai

test <- test %>% 
  tidytext::tidy() %>% 
  mutate(Russortod = ifelse(Russortod == "medium", "middels", Russortod)) %>%
  corpus()

table(docvars(test, "Russortod"))


Ii <- as.data.frame(docvars(test)) 
CORPMai <- test



# endre "medium" på rusetn til middels, bare for ryddigheten

test <- CORPMai

test <- test %>% 
  tidytext::tidy() %>% 
  mutate(rusetn = ifelse(rusetn == "medium", "middels", rusetn)) %>%
  corpus()

table(docvars(test, "rusetn"))


Iii <- as.data.frame(docvars(test)) 
CORPMai<- test

# sjekke CORPMai
Iii <- as.data.frame(docvars(CORPMai)) 

save(CORPMai, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/CORPMai.rda")

SepaaKorpus <- as.data.frame(docvars(CORPMai)) 

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/CORPMai.rda")



