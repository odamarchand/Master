

#### Velger å gå inn og slette etterpå, fordi akkumulert kan det gi litt større utslag, med en god del tekster som mangler og 
# plukke tilfeldig fra dem eller å kontrollere for antall tekster (som altså ikke er der). 


### LASTE INN ALLE CORPUSENE - 46 stk





################################################### LATVIA ###################################################



                                    ##################Nasha G################

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_NashaGazeta_Janvier.rda")
summary(corpusNashaGazetaJanvier) 
corpusNashaGazetaJanvier  #           Corpus consisting of 190 documents and 11 docvars.   Ikke 193 som før. 


load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_NashaGazeta_Februar.rda")
summary(corpusNashaGazetaFebruar) 
corpusNashaGazetaFebruar# Corpus consisting of 156 documents and 11 docvars.      -> nå 153 documents. 

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_NashaGazeta_Mars.rda")
summary(corpusNashaGazetaMars)
corpusNashaGazetaMars # Corpus consisting of 182 documents and 11 docvars.      -- >  nå Corpus consisting of 179 documents and 11 docvars.


load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_NashaGazeta_April.rda")
summary(corpusNashaGazetaApril)
corpusNashaGazetaApril # Corpus consisting of 172 documents and 11 docvars.   -----> Corpus consisting of 170 documents and 11 docvars.


load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_NashaGazeta_Mai.rda")
summary(corpusNashaGazetaMai)
corpusNashaGazetaMai # Corpus consisting of 174 documents and 11 docvars.  ---> Corpus consisting of 171 documents and 11 docvars.


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

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/NASHAGAZ.rda")
                                NASHAGAZ                                                
                                                                                
                                                                                
                                    ############### Vesti (kreml) ####################

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Vesti_Januar.rda")
corpusVestiJanuar # Corpus consisting of 222 documents and 11 docvars. ---> Corpus consisting of 218 documents and 11 docvars.

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Vesti_Februar.rda")
corpusVestiFebruar # Corpus consisting of 88 documents and 11 docvars. ---> Corpus consisting of 87 documents and 11 docvars. 

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
 load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/VESTI.rda")
    
                                                                                

                                    #################### Mix News (ikke !! kreml) #####################

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


                                                                                 
              ###lime###                                                        # LATVIA  alle sammen 
                                                                                LATVIA <- NASHAGAZ + VESTI + MIXNEWS
                                                                                summary(LATVIA)  # Corpus consisting of 7787 documents,
                                                                                                                                                                                                               
                                                                                       
                                                                                 
                                                                                 save(LATVIA, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/LATVIA.rda")
                                                                                 
                                                                                 
               ### ekstra varIABEL: arkiv ###                                    # eksra var
                                                                                 corp <- LATVIA
                                                                                 docvars(corp, "arkiv") <- paste("Factiva", sep = "")
                                                                                 summary(corp) # 7787
                                                                                 
                                                                                 head(docvars(corp))
                                                                                 summary(docvars(corp))
                                                                                 docvars(corp)
                                                                                 corp # 7787
                                                                                 
                                                                                 II <- as.data.frame(docvars(corp)) # 7787 obs
                                                                                 
                                                                                 LATVIA <- corp    # Corpus consisting of 7,787 documents and 12 docvars.
                                                                                 
                                                                                 save(LATVIA, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/LATVIA.rda")
                                                                                 load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/LATVIA.rda")
                                                                            
                                                                                 docvars(LATVIA)
                                                                                 
                                                                              
                                                                                 
                                                                                 
#################################################### ESTLAND ######################################################

                                                                                 
                                 ################ MK (Kreml) #####################
                                                                                 
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



                                                                       
                                                                                         
                                                                
                                       ################### Delfi ################### 
                                                                       
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

                                                                                  
                                                                                  
      
                                                                                  
                                                                                                                               

                                ####################   Postimees  ################### 
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


                                                                                      
                                                                                      
                                                                                      
                  # lime sammen                                                                    
                                                                                      # ESTLAND 
                                                                                      ESTLAND <- MK + DELFI + POSTI
                                                                                      summary(ESTLAND) # Corpus consisting of 4239 documents, showing 100 documents:
                                                                                      
                                                                                      save(ESTLAND, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/ESTLAND.rda")
                                                                                      
                                                                                      
                                                                                      
                    ### ekstra varIABEL: arkiv ###                                    # eksra var
                                                                                      corp <- ESTLAND
                                                                                      docvars(corp, "arkiv") <- paste("Factiva", sep = "")
                                                                                      summary(corp)
                                                                                      
                                                                                      head(docvars(corp))
                                                                                      summary(docvars(corp))
                                                                                      docvars(corp)
                                                                                      corp # 4239
                                                                                      
                                                                                      # se på dem i et datasett
                                                                                  
                                                                                      
                                                                                      ESTLAND <- corp    # Corpus consisting of 7,787 documents and 12 docvars.
                                                                                      
                                                                                      II <- as.data.frame(docvars(ESTLAND)) # 4239
                                                                                      
                                                                                      save(ESTLAND, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/ESTLAND.rda")
                                                                                
                                                                                       load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/ESTLAND.rda")
                                                                                      docvars(ESTLAND)
                                                                                      
                                                                                   
                                                                          
                                                                                                       
        ################### ################### ################ LITUEN ################### ################### ################### 

                                                                                      
                                                                                      
                                        ####################  Elta   ###################                                                                             

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

                                                                                    
                  ### ekstra variabel: arkiv ###                                    # eksra var
                                                                                    corp <- ELTA
                                                                                    docvars(corp, "arkiv") <- paste("Factiva", sep = "")
                                                                                    summary(corp) # 
                                                                                    
                                                                                    head(docvars(corp))
                                                                                    summary(docvars(corp))
                                                                                    docvars(corp)
                                                                                    corp # 
                                                                                    
                                                                                    
                                                                                    ELTA <- corp    # Corpus consisting of 
                                                                                    II <- as.data.frame(docvars(ELTA)) #  2324  # se på dem i et datasett
                                                                                    
                                                                                    
                                                                                    
                                                                                   save(ELTA, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/ELTA.rda")
                                                                                   load ("/Users/odasmarchand/Downloads/test/2019/Korpusnye/ELTA.rda")
                                                                                   docvars(ELTA)  
                                                                                   
                                                                                   # endrar navn til LITAUEN - elta eneste rep for Litauen
                                                                                   LITAUEN <- ELTA      
                                                                                   save(LITAUEN, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/LITAUEN.rda")
                                                                                   load ("/Users/odasmarchand/Downloads/test/2019/Korpusnye/LITAUEN.rda")
                                                                                   LITAUEN  # 2,324 documents and 12 docvars.
                                                                                                                                                                    
#################### ################### ###################  UKRAINA ################### ################### ################### ###################                                                                   

                                                                                    
                                    ################### 112 (Kreml) ################### 
                                                                                    
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Ua112_Mai.rda")
Ua112Mai <- corpusUa112 # Corpus consisting of 2,222 documents and 11 docvars.
Ua112Mai  # NÅ: Corpus consisting of 2,200 documents and 11 docvars.

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Ua112_Juni.rda")
Ua112Juni <- corpusUa112 # Corpus consisting of 2,136 documents and 11 docvars.
Ua112Juni  #: Nå  Corpus consisting of 2,114 documents and 11 docvars.

UA112 <- Ua112Mai + Ua112Juni # Corpus consisting of 4,358 documents and 11 docvars.
(UA112) # NÅ: Corpus consisting of 4,314 documents and 11 docvars.

                                                                                               save(UA112, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/UA112.rda")
                                                                                               load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/UA112.rda")
                                                                                               #4314

                             ### ekstra varIABEL: arkiv ###                                    # eksra var                                                       
                                                                                               ### Legge til ekstra variabel: arkiv. 
                                                                                               corp <- UA112
                                                                                               docvars(corp, "arkiv") <- paste("Factiva", sep = "")
                                                                                             
                                                                                               
                                                                                               head(docvars(corp))
                                                                                               summary(docvars(corp))
                                                                                               docvars(corp)
                                                                                               corp # of 4,314 12 docvars 
                                                                                               
                                                                                            
                                                                                               UA112 <- corp    # 
                                                                                               II <- as.data.frame(docvars(UA112)) #  4,314 documents and 12 docvars.
                                                                                               
                                                                                           
                                                                                               
                                                                                               save(UA112, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/UA112.rda")
                                                                                               load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/UA112.rda")
                                                                                               UA112 # 4,314 documents and 12 docvars.
      
                                                                                               

#### OBOZ må tas igjen, fordi jeg ikke har tatt ut autokorrelerte tekster

                                                                                         
                            ################### Oboz ################### 
                                                                                               
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
# lagret på nytt med ny data denne og (selvom det ikke står før og NÅ)
                                                                                   
                                                                                    
                                                                                    load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/OBOz.rda") 
                                                                                    
                 ### ekstra varIABEL: arkiv ###                                    # eksra var 
                                                                                    corp <- OBOz
                                                                                    docvars(corp, "arkiv") <- paste("Integrum", sep = "")
                                                                                    summary(corp) 
                                                                                    
                                                                                    head(docvars(corp))
                                                                                    summary(docvars(corp))
                                                                                    docvars(corp)
                                                                                    corp # 3,580 documents and 12 docvars.
                                                                                    
                                                                                    
                                                                                    OBOz <- corp    # Corpus consisting of 7,787 documents and 12 docvars.
                                                                                    II <- as.data.frame(docvars(OBOz)) # 3580
                                                                                    save(OBOz, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/OBOz.rda")
                                                                                    load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/OBOz.rda")
                                                                                    OBOz # Corpus consisting of 3,580 documents and 12 docvars.
                                                                                    
                                                                                
                                                                                    
                                                                                    
                                                                                    
                                # lime sammen  ukrainske aviser                   # UKRAINA 
                                                                                    UKRAINA <- UA112 + OBOz
                                                                                     # Corpus consisting of 7894 documents, showing 100 documents:
                                                                                    
                                                                                    UKRAINA # Corpus consisting of 7,894 documents and 12 docvars.
                                                                                  
                                                                                    save(UKRAINA, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/UKRAINA.rda")

                                                                                    load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/UKRAINA.rda")
                                                                                    UKRAINA
                                                                          
                                                                                    
                                                                                    
                                                                                              
                            #################### ################### MOLDOVA  ################### ###################                                                                             
                                                                                    
                                                                                    

                                                              

                              ####################  Sputnik (Kreml)################### 
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

                                                                                         

                                                                                          
                                                                                          

                                 #################### KOms Pravda (Kreml)  ##################### 
                                                                                          
                                                                                          
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
                                                                                                  
                                                                                                  
                                                                                                  
                                                                                                  
                                                                                                  
                                                                                                  
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/KOMSPRAVDA.rda")
                                        
                                                    # se på matrise før
                                                                                                  
        DDD <- as.data.frame(docvars(KOMSPRAVDA))
                                                                                                  
                                                                                                  
                                                                                                  
        # Endre variabelen "2" på "Plassering", til 1 
        
        test <- KOMSPRAVDA
        
        test <- test %>% 
          tidytext::tidy() %>% 
          mutate(Plassering = ifelse(Plassering == "2", "1", Plassering)) %>%
          corpus()
        
        table(docvars(test, "Plassering"))
          
        table(docvars(KOMSPRAVDA, "Plassering"))                                                 # se matrise etter                                
                                                                                                  
                                                                                                 
          KOMSPRAVDA <- test                                                                                        
          DDD2 <- as.data.frame(docvars(KOMSPRAVDA))
          
          
          save(KOMSPRAVDA, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/KOMSPRAVDA.rda")
          
                                                                              
                                                                                                
                                                                                                  
                                                                                                                      
                                                                                                  
                                                                                                  
                                                                                                  load ("/Users/odasmarchand/Downloads/test/2019/Korpusnye/KOMSPRAVDA.rda")
                                                                                                  load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/SPUTNIK.rda") 
                                                                                                  SPUTNIK # 3945
                                                                                                  KOMSPRAVDA #  2,723
      
                                                                                                  
                    # lime sammen moldoviske aviser                                              # MOLDOVA 
                                                                                                  MOLDOVA <- SPUTNIK + KOMSPRAVDA
                                                                                                  MOLDOVA # 6668
                                                                                                  summary(MOLDOVA)
                                                                                               
                                                                                                  
                                                                                                  save(MOLDOVA, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/MOLDOVA.rda")
                                                                                                 
                                                                                                  
                                                                                                  
                                                                                                  load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/MOLDOVA.rda")
                                                                                                 
                                                                                                ### Legge til ekstra variabel: arkiv.
                               ### ekstra varIABEL: arkiv ###                                    # eksra var                                                                                     
                                                                                                  corp <- MOLDOVA
                                                                                                  docvars(corp, "arkiv") <- paste("Integrum", sep = "")
                                                                                                  summary(corp) # Corpus consisting of 6668 documents,
                                                                                                  
                                                                                                  head(docvars(corp))
                                                                                                  summary(docvars(corp))
                                                                                                  docvars(corp)
                                                                                                  corp # 6668
                                                                                                  
                                                                                                  # se på dem i et datasett
                                                                                                  MOLDOVA <- corp 
                                                                                                  II <- as.data.frame(docvars(MOLDOVA)) # 6668 12 docvars 
                                                                                                  
                                                                                           
                                                                                                  
                                                                                                  save(MOLDOVA, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/MOLDOVA.rda")
                                                                                                  load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/MOLDOVA.rda")
                                                                                                  
                                              
                                                                                                  
                                                                                                  
                
                
  ##### #####################  ##################### LIME SAMMEN ALLE KORPUS! ##################### ##################### #######
                                                                                                  
                            load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/MOLDOVA.rda")  #  6,668 documents and 12 docvars.
                            load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/UKRAINA.rda") # 7,894 documents and 12 docvars.
                          
                            load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/ESTLAND.rda") # 4,239 documents and 12 docvars.
                            load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/LATVIA.rda") # 7,787 documents and 12 docvars. # en ekstra enn på excel-skjemaet, får tåles
                            load ("/Users/odasmarchand/Downloads/test/2019/Korpusnye/LITAUEN.rda") #  2,324 documents and 12 docvars.
                          
                        
                            
                            
                              
  # HVERT LAND ALLE SAMMEN
                
                KORPUS <-  LATVIA + LITAUEN + ESTLAND + UKRAINA + MOLDOVA 
                summary(KORPUS)
                KORPUS  # Corpus consisting of 28,912 documents and 12 docvars.
                save(KORPUS, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/KORPUS.rda")
                load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/KORPUS.rda")
              
                
                I <- as.data.frame(docvars(KORPUS)) 

          
                
                
                # Endre variabelen "medium" på Russortod, til middels, slik at begge er like
                
                test <- KORPUS
                
                test <- test %>% 
                  tidytext::tidy() %>% 
                  mutate(Russortod = ifelse(Russortod == "medium", "middels", Russortod)) %>%
                  corpus()
                
                table(docvars(test, "Russortod"))
              
                
                Ii <- as.data.frame(docvars(test)) 
                KORPUS <- test
                
                
                
                # endre "medium" på rusetn til middels, bare for ryddigheten
                
                test <- KORPUS
                
                test <- test %>% 
                  tidytext::tidy() %>% 
                  mutate(rusetn = ifelse(rusetn == "medium", "middels", rusetn)) %>%
                  corpus()
                
                table(docvars(test, "rusetn"))
                
                
                Iii <- as.data.frame(docvars(test)) 
                KORPUS <- test
                
                # dtfrm siste gang 
                KORPUSdf <- as.data.frame(docvars(KORPUS)) 
                
                save(KORPUS, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/KORPUS.rda")
                
             
                
                SepaaKorpus <- as.data.frame(docvars(KORPUS)) 
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                                           ########
                
                #DENNE DELEN TRENGER JEG IKKE? 
                
                
                ## FORsøk på å lage CSV 
                # og gjeldene step for å klargjøre ting til å kjøre SearchK og stm, via 
                # å skille mellom meta, data, etc. og gå via csv og dataframe
            
                
                # site del er bare forsøk på å lage csv, men kan bruke dfm i topicmodellen likevel, så det gtrengs ikke eg
                
                                            ######
                
                
                load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/CORPMai.rda")
                
                CORPMaidf <- as.data.frame(docvars(CORPMai)) 
                CSVMai <- CORPMaidf
                
         
                #disse begge to virker men ser ut som Excelfil fordi macen gjør den sånn? mon dieu 
                # Write CSV in R
                write.table(CSVMai, file = "CSVMaii.csv", row.names=FALSE, na="", col.names=FALSE, sep=",")
                # denne virker 
                
                
                #denne virker også... 
                write.table(CSVMai, file = "CSVMai.csv", append = FALSE, quote = TRUE, sep = " ",
                           eol = "\n", na = "NA", dec = ".", row.names = TRUE,
                           col.names = TRUE, qmethod = c("escape", "double"),
                           fileEncoding = "")
                
               # write_delim(x, path, delim = " ", na = "NA", append = FALSE,
                  #          col_names = !append)
                
               #write_delim(CSVMai,"/Users/odasmarchand/Downloads/test/2019/Korpusnye/CSVMai.csv", delim = " ", na = "NA", append = FALSE,
                #          col_names = "da")
                
      
                
                
                
                summary(CORPMai)
                CORPMai
                
                
                # her må du sette wd, også leser den csv med read.csv lengre ned automagisk 
                # load("/Users/odasmarchand/Downloads/test/2019/Korpusnye") 
                
                
                # her lager jeg df som skal brukes til deler av textProcessor- usikker på om bare docvarene
                # eller også teksten skal være med her! må finne ut. 
                # lage dataframe - dette er Corpusen og ikke csv-en! Skal lage dataframe til å putte inn der. 
            # metadata kalles d nedover der har jeg kalt det
                
                CORPMaiDF <- as.data.frame(docvars(CORPMai)) 
                
                
                # eller eventuelt prøve
                
                 #lage dataframe
                CORPMai_DFM <- dfm(CORPMai,       
                                remove_punct = TRUE,
                                remove_symbols = TRUE)
                
                
                #### ta ut denne? er den nødvendig? 
                corp_DFM_trim <- dfm_trim(corp_DFM, # Ord skal dukke opp i minst 1 % og maks 99 % av dokumentene.
                                          min_docfreq = 0.01, # Ord som dukker opp veldig sjelden.
                                          max_docfreq = 0.99, # Ord som dukker opp veldig ofte.
                                          docfreq_type = "prop") # ??
                
              
              
                # nå gikk ddet endelig - her forbereder jeg csv-filen som skal inn
                #data <- read.csv("CORPMai.csv")
                #data2 <- read.csv("CSVMai.csv") # denne er jo helt craxy
                data <- read.csv("CSVMaii.csv") 
                
                # her forbereder du ekstra datamatrix 
                # Additional data about the documents. Specifically a data.frame or matrix object with number of rows equal to the number of documents and one column per meta-data type.
                metadata <- 
                  
                library(quanteda)
                library(tm)
                
                processed <- textProcessor(data$documents, metadata = data)
                
                # data her heter data men er lest inn og endr navn fra CSVMaii.csv
                 #metadata er data.frame eller matrix ob
                yy<- (textProcessor(data, metadata = TRUE, lowercase = TRUE,
                              removestopwords = FALSE, removenumbers = FALSE, removepunctuation = TRUE,
                              stem = FALSE, wordLengths = FALSE, sparselevel = FALSE,
                              language = "ru", verbose = TRUE, onlycharacter = FALSE,
                              striphtml = FALSE, customstopwords = NULL, v1 = FALSE))
                
                out <- prepDocuments(processed$documents, processed$vocab, processed$meta)
                docs <- out$documents
                vocab <- out$vocab
                meta <-out$meta
                
                
