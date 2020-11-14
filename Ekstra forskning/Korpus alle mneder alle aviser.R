

#### Velger å gå inn og slette etterpå, fordi akkumulert kan det gi litt større utslag, med en god del tekster som mangler og 
# plukke tilfeldig fra dem eller å kontrollere for antall tekster (som altså ikke er der). 


### LASTE INN ALLE CORPUSENE - 46 stk

### LATVIA 

#Nasha G
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_NashaGazeta_Janvier.rda")
summary(corpusNashaGazetaJanvier) 
corpusNashaGazetaJanvier#           Corpus consisting of 190 documents and 11 docvars.   Ikke 193 som før. 

# FIN.


corpusNashaGazetaJanvier$documents$texts[1:77]  


load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_NashaGazeta_Februar.rda")
summary(corpusNashaGazetaFebruar) 
corpusNashaGazetaFebruar# Corpus consisting of 156 documents and 11 docvars.      -> nå 153 documents. 

# FIN. 

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_NashaGazeta_Mars.rda")
summary(corpusNashaGazetaMars)
corpusNashaGazetaMars # Corpus consisting of 182 documents and 11 docvars.      -- >  nå Corpus consisting of 179 documents and 11 docvars.
# FIN. 


load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_NashaGazeta_April.rda")
summary(corpusNashaGazetaApril)
corpusNashaGazetaApril # Corpus consisting of 172 documents and 11 docvars.   -----> Corpus consisting of 170 documents and 11 docvars.
# FIN. 


load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_NashaGazeta_Mai.rda")
summary(corpusNashaGazetaMai)
corpusNashaGazetaMai # Corpus consisting of 174 documents and 11 docvars.  ---> Corpus consisting of 171 documents and 11 docvars.
# FIN. 


load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_NashaGazeta_Juni.rda")
summary(corpusNashaGazetaJuni)
corpusNashaGazetaJuni # Corpus consisting of 153 documents and 11 docvars. ---> Corpus consisting of 151 documents and 11 docvars.



corpus <- corpusNashaGazetaJanvier + corpusNashaGazetaFebruar 
corpus2 <- corpusNashaGazetaMars + corpusNashaGazetaApril 
Corpus3 <- corpusNashaGazetaMai + corpusNashaGazetaJuni
NASHAGAZ <- corpus + corpus2 + Corpus3
summary(NASHAGAZ$documents$texts)
NASHAGAZ # Corpus consisting of 1,030 documents and 11 docvars.  NÅ:  - > Corpus consisting of 1,014 documents and 11 docvars.
                                                                                save(NASHAGAZ, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/NASHAGAZ.rda")

NASHAGAZ$documents$texts[1:101]                                                                            
                                                                                
                                                                                
                                                                                
#Vesti (kreml)
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Vesti_Januar.rda")
corpusVestiJanuar # Corpus consisting of 222 documents and 11 docvars. ---> Corpus consisting of 218 documents and 11 docvars.



load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Vesti_Februar.rda")
corpusVestiFebruar # Corpus consisting of 88 documents and 11 docvars. ---> Corpus consisting of 87 documents and 11 docvars.



 # på disse har d skjedd en alvorlig feil mtp antall # Mye forskjell her  
# Inn i script der eller her og fjerne de uten tekst - nr 101 på alle  ca, men ikke alltid. 

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Vesti_Mai.rda")
corpusVestiMai # Corpus consisting of 2,763 documents and 11 docvars.    ---> Corpus consisting of 2,735 documents and 11 docvars.

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Vesti_Juni.rda")
corpusVestiJuni # Corpus consisting of 2,919 documents and 11 docvars. -----> Corpus consisting of 2,889 documents and 11 docvars.


corpus1 <- corpusVestiJanuar + corpusVestiFebruar 
corpus2 <- corpusVestiMai  + corpusVestiJuni 
VESTI <- corpus1 + corpus2 
summary(VESTI$documents$texts)
VESTI # Corpus consisting of 5,992 documents and 11 docvars. --- > Corpus consisting of 5,929 documents and 11 docvars.
                                                                                save(VESTI, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/VESTI.rda")
summary(VESTI)

                                                                                

# Mix News (kreml)
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Mixnews_April.rda")
MixApril <- corpusMixNews
summary(MixApril) 
MixApril # Corpus consisting of 729 documents and 11 docvars. ----> Corpus consisting of 721 documents and 11 docvars.



load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Mixnews_Mai.rda")
MixMai <- corpusMixNews
summary(MixMai) 
MixMai  # Corpus consisting of 126 documents and 11 docvars. ------- > Corpus consisting of 123 documents and 11 docvars.



MIXNEWS <- MixMai + MixApril
summary(MIXNEWS)
MIXNEWS  # Corpus consisting of 855 documents and 11 docvars.   -----> Corpus consisting of 844 documents and 11 docvars.
                                                                                 save(MIXNEWS, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/MIXNEWS.rda")


                                                                                 
                                                                                 
# ESTLAND 

# MK (Kreml) 
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_MK_April.rda")
MkApril <- corpusMK
summary(MkApril)
# Corpus consisting of 252 documents and 11 docvars.           ------>  Corpus consisting of 248 documents, showing 100 documents:
MkApril$documents$texts[1:77] 

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_MK_Mai.rda")
MkMai <- corpusMK
summary(MkMai)
# Corpus consisting of 267 documents and 11 docvars.         ---------> Corpus consisting of 264 documents, 

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_MK_Juni.rda")
MkJuni <- corpusMK
summary(MkJuni)
# Corpus consisting of 220 documents and 11 docvars.          --------->  Corpus consisting of 217 documents,

MK <- MkApril + MkMai + MkJuni
summary(MK)
# Corpus consisting of 739 documents and 11 docvars.             --------> Corpus consisting of 729 documents, showing 100 documents:
                                                                       save(MK, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/MK.rda")


                                                              
                                                                
                                                                
# Delfi
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Delfi_April.rda")
DelfiApril <- corpusDelfi
DelfiApril #Corpus consisting of 347 documents and 11 docvars.    ------> Corpus consisting of 343 documents and 11 docvars.

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Delfi_Mai.rda")
DelfiMai <- corpusDelfi
DelfiMai #Corpus consisting of 325 documents and 11 docvars.        ----> Corpus consisting of 321 documents and 11 docvars

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Delfi_Juni.rda")
DelfiJuni  <- corpusDelfi
DelfiJuni #Corpus consisting of 129 documents and 11 docvars.        ----> Corpus consisting of 127 documents


DELFI <- DelfiApril + DelfiMai + DelfiJuni
DELFI # Corpus consisting of 801 documents and 12 docvars.          ------ >  Corpus consisting of 791 documents and 12 docvars.


                                                                                  save(DELFI, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/DELFI.rda")

                                                                                  
                                                                                  
      
                                                                                  
                                                                                                                               

#  Postimees
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Postimees_April.rda")
PostiApril <- corpusPosti # Corpus consisting of 1,039 documents and 11 docvars. (sjekk koden? marker og kjør kun PostiApril for å få denne dataen)
PostiApril                # ---> NÅ: Corpus consisting of 1,027 documents and 11 docvars.

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Postimees_Mai.rda")
PostiMai <- corpusPosti # Corpus consisting of 905 documents and 11 docvars.  (Sensor etc: SVP. kjør delkoden selv fra nå av hvis du vil ha datainfo..)
PostiMai                # ---> NÅ: Corpus consisting of 895 documents and 11 docvars.

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Postimees_Juni.rda")
PostiJuni <- corpusPosti # Corpus consisting of 805 documents and 11 docvars. (.... alors...) 
PostiJuni                # ---> NÅ: Corpus consisting of 797 documents and 11 docvars.

POSTI <- PostiApril+ PostiMai + PostiJuni
POSTI # Corpus consisting of 2,749 documents and 11 docvars.
       # ---> NÅ: Corpus consisting of 2,719 documents and 11 docvars.


                                                                                      save(POSTI, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/POSTI.rda")



# LITUEN 

# Elta                                                                              # Her er det noe alvorlig feil  # Mye forskjell her   # Inn i script der eller her og fjerne de uten tekst - nr 101 på alle 

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_ELTA_Januar.rda")
EltaJanuar <- corpusELTA # Corpus consisting of 443 documents and 11 docvars.
#  NÅ: Corpus consisting of 437 documents, showing 100 documents:


load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_ELTA_Februar.rda")
EltaFebruar <- corpusELTA # Corpus consisting of 479 documents and 11 docvars.
EltaFebruar # NÅ: Corpus consisting of 474 documents and 11 docvars.


load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_ELTA_Mars.rda")
EltaMars <- corpusELTA #Corpus consisting of 606 documents and 11 docvars.
EltaMars # NÅ:  Corpus consisting of 599 documents and 11 docvars.


load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_ELTA_April.rda")
EltaApril <- corpusELTA # Corpus consisting of 473 documents and 11 docvars.
EltaApril # NÅ: Corpus consisting of 467 documents and 11 docvars.


load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_ELTA_Mai.rda")
EltaMai <- corpusELTA # Corpus consisting of 351 documents and 11 docvars.
EltaMai # NÅ: Corpus consisting of 347 documents and 11 docvars. 

ELTA <- EltaJanuar + EltaFebruar + EltaMars + EltaApril + EltaMai
# Corpus consisting of 2,352 documents and 11 docvars. ------------> NÅ: Corpus consisting of 2,324 documents and 11 docvars.
summary(ELTA)
ELTA
                                                                                    save(ELTA, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/ELTA.rda")

                                                                                    
                                                                                    

                                                                               
                                                                                    
# UKRAINA                                                                   # Mye forskjell her   # Inn i script der eller her og fjerne de uten tekst - nr 101 på alle 

# 112 (Kreml)
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Ua112_Mai.rda")
Ua112Mai <- corpusUa112 # Corpus consisting of 2,222 documents and 11 docvars.
Ua112Mai  # NÅ: Corpus consisting of 2,200 documents and 11 docvars.

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Ua112_Juni.rda")
Ua112Juni <- corpusUa112 # Corpus consisting of 2,136 documents and 11 docvars.
Ua112Juni  #: Nå  Corpus consisting of 2,114 documents and 11 docvars.

UA112 <- Ua112Mai + Ua112Juni # Corpus consisting of 4,358 documents and 11 docvars.
(UA112) # NÅ: Corpus consisting of 4,314 documents and 11 docvars.

                                                                                               save(UA112, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/UA112.rda")

                                                                 
print(UA112$documents$texts, options(max.print = 1000)) 
      
                                                                                               

#### OBOZ må tas igjen, fordi jeg ikke har tatt ut autokorrelerte tekster

                                                                                          # stemmer på flekken! - fra Integrum tror jeg. 
# Oboz
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_ObozPDF_Januar.rda")
ObozJanuar <- corpusObozPDF # Corpus consisting of 710 documents and 11 docvars.

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_ObozPDF_Februar.rda")
ObozFebruar <- corpusObozPDF # Corpus consisting of 680 documents and 11 docvars.

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_ObozPDF_Mars.rda")
ObozMars <- corpusObozPDF # Corpus consisting of 580 documents and 11 docvars.
 
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_ObozPDF_April.rda")
ObozApril <- corpusObozPDF # Corpus consisting of 490 documents and 11 docvars.

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_ObozPDF_Mai.rda")
ObozMai <- corpusObozPDF # Corpus consisting of 580 documents and 11 docvars.

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_ObozPDF_Juni.rda")
ObozJuni <- corpusObozPDF # Corpus consisting of 540 documents and 11 docvars.


OBOz <- ObozJanuar + ObozFebruar  + ObozMars + ObozApril + ObozMai + ObozJuni

OBOz # Corpus consisting of 3,580 documents and 11 docvars.

                                                                                    save(OBOz, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/OBOz.rda")


### MUTNIK treger ikke tas på nytt

# MOLDOVA                                                                           # RIKTIG LENGDE!

# Sputnik (Kreml)
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Sputnik_Januar.rda")
SputnikJanuar <- corpus # Corpus consisting of 608 documents and 11 docvars.
summary(SputnikJanuar)

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Sputnik_Februar.rda")
SputnikFebruar <- corpus # Corpus consisting of 669 documents and 11 docvars.
summary(SputnikFebruar)

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Sputnik_Mars.rda")
SputnikMars <- corpus # Corpus consisting of 690 documents and 11 docvars.
summary(SputnikMars)

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Sputnik_April.rda")
SputnikApril <- corpus # Corpus consisting of 679 documents and 11 docvars.
summary(SputnikApril)

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Sputnik_Mai.rda")
SputnikMai <- corpus  # Corpus consisting of 620 documents and 11 docvars.
summary(SputnikMai)

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Sputnik_Juni.rda")
SputnikJuni <- corpus  # Corpus consisting of 679 documents and 11 docvars.


SPUTNIK1 <- SputnikJanuar + SputnikFebruar + SputnikMars
SPUTNIK2 <- SputnikApril + SputnikMai + SputnikJuni

SPUTNIK <- SPUTNIK1 + SPUTNIK2  # Corpus consisting of 3,945 documents and 11 docvars.
summary(SPUTNIK)

                                                                                          save(SPUTNIK, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/SPUTNIK.rda")

# d quoi?? 
#Warning message:
 # In x$metadata[field] <- value :
#  number of items to replace is not a multiple of replacement length





## KOMS pravda trengs ikke på nytt, har tatt autokorr her 


#KOms Pravda (Kreml)                                                                    # Passer perfekt
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_KomsPr_Januar.rda")
KomsPrJan <- corpus # Corpus consisting of 416 documents and 11 docvars.
summary(KomsPrJan)

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_KomsPr_Februar.rda")
KomsPrFeb <- corpus # Corpus consisting of 449 documents and 11 docvars.

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_KomsPr_Mars.rda")
KomsPrMar <- corpus # Corpus consisting of 469 documents and 11 docvars.

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_KomsPr_April.rda")
KomsPrApril <- corpus # Corpus consisting of 450 documents and 11 docvars.

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_KomsPr_Mai.rda")
KomsPrMai <- corpus # Corpus consisting of 429 documents and 11 docvars.

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_KomsPr_Juni.rda")
KomsPrJuni  <- corpus # Corpus consisting of 510 documents and 11 docvars.


KOMSPRAVDA <- KomsPrJan + KomsPrFeb + KomsPrMar + KomsPrApril + KomsPrMai + KomsPrJuni
KOMSPRAVDA # Corpus consisting of 2,723 documents and 11 docvars.

                                                                                                  save(KOMSPRAVDA, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/KOMSPRAVDA.rda")
                                        
      
                summary(KOMSPRAVDA$documents$kreml)
                summary(VESTI$documents$kreml)
                

                
    


