
                        ########################### LATVIA #############################

                                      ######### Nasha Gazeta #############
                                      
                                         ### Ikke Kreml-linket ###

                                                                                            

                                              # JANUAR #

setwd("~/Downloads/test/2019/Latvia/NashGaz(12) /Januar")
                        
library(pdftools)

  # Liste opp filer fra mappe: Januar
  liste<- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Latvia/NashGaz(12) /Januar"), 
                     full.names = TRUE)
  

  # Bruker liste for å hente ut tekstene for Nasha Gazeta Januar med pdf_text, pakke: pdftools 
  NashaG <- lapply(liste[1:3], function(x){
    message(x)
    tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                     file = x)
    return(tmp)
  }) 
  
  
   
    
    #   lag dataframe Nasha G Januar
    NashaGframe <- do.call(rbind, NashaG)  # do call brukes for funksjon på liste, r bind radbinder listen
    substr(NashaGframe$text[1], 1, 200) # teskt en, 200 ord - ikke nødvendig

    
    # ta vekk withespace, samtidig lager tilfeldigvis om til character og ikke dataframe
    library(stringr)
    
    text <- str_trim(str_replace_all(NashaGframe$text,   "\\s+",  " "))
    
    # ? splitte tekst med linjeshift
    # text_list <- str_split(text[1:3], "\n")
    
# splitte sider
    text_list <- str_split(text[1:3], pattern= "Document NAGAZ") # str_split_fixed og n = X er tatt bort
# se på 
   substr(text_list[2], 1,4000)  # se på tekst to 4000 tegn
   substr(text_list[[3]], 1, 2000)
   
# ta vekk ting 
   text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source", "000")
   text <- str_replace_all(text, "(Latvia, Russian Language)", "000")
   text <- str_replace_all(text, "Or Nasha Gazeta", "000")
   text <- str_replace_all(text, "Or Vesti segodnia", "000")
   text <- str_replace_all(text, "Or Telegraf", "000")
   text <- str_replace_all(text, "Or Lithuanian News Agency", "000")
   text <- str_replace_all(text, "Or TVNET.lv", "000")
   text <- str_replace_all(text, "Or Vesti Segodnya ", "000")
   text <- str_replace_all(text, "- ELTA ", "000")
   text <- str_replace_all(text, " Or 112.ua", "000")
   text <- str_replace_all(text, " All Industries Region All Regions Language Russian", "000")
   text <- str_replace_all(text, " News Filters Source:", "000")
   text <- str_replace_all(text, " Nasha Gazeta", "000")
   text <- str_replace_all(text, "Found 1,014 Timestamp 3 July 2019 7:39", "000")
   text <- str_replace_all(text, "Page 110 of 110 © 2019 Factiva", "000")
   text <- str_replace_all(text, "Inc. All rights reserved.", "000")
   text <- str_replace_all(text, "Ukraine, Russian Language", "000")
   text <- str_replace_all(text, " Delfi ", "000")
   text <- str_replace_all(text, "Russian Language", "000")
   text <- str_replace_all(text, "Inc. All rights reserved.", "000")
   text <- str_replace_all(text, "000", " ")
   text <- str_replace_all(text, "\\(+000+\\)", " ")
   text <- str_replace_all(text, " Or Unian ", " ")
   text <- str_replace_all(text, "\\(+\\s+\\)", " ")
   text <- str_replace_all(text, " , ", " ")
   text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+", " ")
   text <- str_replace_all(text, "Фото+\\:+\\s+[A-Za-z]{1,10}+\\s+[A-Za-z]{1,10}", " ")
   text <- str_replace_all(text, "-     Timestamp  ", " " )
   text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " " )
   text <- str_replace_all(text, "(\")", " ")
   text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}", "ooo") #Page 108 of 110 
   text <- str_replace_all(text, "© 2019 Factiva,", "ooo")#© 2019 Factiva, 
   text <- str_replace_all(text, "[0-9]{1,3}+\\s+words", "ooo")#  196 words
   text <- str_replace_all(text, "[0-9]{1,3}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}", "ooo")#   21 January 2019 
   text <- str_replace_all(text, "Наша Газета NAGAZ", "ooo")# Наша Газета NAGAZ 
   text <- str_replace_all(text, "21 Russian © 2019, ", "ooo")#21 Russian © 2019, 
   text <- str_replace_all(text, " . DLS. All Rights Reserved", "ooo")# . DLS. All Rights Reserved
   text <- str_replace_all(text, "DLS. All Rights Reserved", " ")
   text <- str_replace_all(text, " All Industries Region All Regions Language Russian News Filters Source:", " ")
   text <- str_replace_all(text, " Nasha Gazeta ", " ")
   text <- str_replace_all(text, "  22    Фото:+\\s+[а-яА-ЯёЁ]{1,10}", " ") #  22    Фото: TvNet
   text <- str_replace_all(text, "Фото:+\\s+[а-яА-ЯёЁ]{1,10}+(-)+[а-яА-ЯёЁ]{1,10}+", "FANGET")# пресс-фото
   text <- str_replace_all(text, "ooo", " ")
   text <- str_replace_all(text, "  BBB ", " ")
   text <- str_replace_all(text, "FANGET", " ")
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[0-9]{2}", " ")#20190128ef1l 08 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[0-9]{1}+[A-Za-z]{1}", " ")#20190128ef1m 2t 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{2}", " ")#20190111ef11 ji 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{2}", " ") #20190111ef13 p2 
   text <- str_replace_all(text, "-+\\s+\\s+Results+\\s+Found+\\s+[0-9]{1}+\\,+[0-9]{3}", " ")#-   Results Found 1,014
   text <- str_replace_all(text, "Timestamp+\\s+\\s+[0-9]{1}+\\:+[0-9]{2}", " ")#Timestamp   7:42 
   text <- str_replace_all(text, "[0-9]{1}+\\s+Russian+\\s+\\s+Фото+\\:+\\s+printscreen", " ")# 4 Russian    Фото: printscreen
   text <- str_replace_all(text, "[0-9]{1}+\\s+Russian", " ")# 2 Russian, 1 Russian osv.
   text <- str_replace_all(text, "Фото+\\:+\\s+[а-яА-ЯёЁ]{1,20}", " ")# Фото: иллюстративное фото
   text <- str_replace_all(text, "Фото+\\:+\\s+[а-яА-ЯёЁ]{1,20}+\\s+фото", " ")
   text <- str_replace_all(text, "\\(+Estonia,  +\\)", " ")# (Estonia,  ) 
   text <- str_replace_all(text, " Date: ", " ")# Date: 
   text <- str_replace_all(text, "-         Results ", " ")# -         Results  
   text <- str_replace_all(text, "  22 Russian", " ")
   text <- str_replace_all(text, "© 2019+\\,", " ")
   text <- str_replace_all(text, "(\")", " ")
# classic
   text <- str_replace_all(text, "ELTA (Russian Language) Or Unian (Ukraine, Russian Language) Or 112.ua (Ukraine, Russian Language)", "000")
   text <- str_replace_all(text, "Author All Authors Company All Companies Subject Political/General News Industry", "000")
   text <- str_replace_all(text, "All Industries Region All Regions Language Russian News Filters Source: Nasha Gazeta (Latvia, Russian Language)", "000")
   text <- str_replace_all(text, "Date: 1 January 2019 - 31 December 2019 Page 109 of 110 © 2019 Factiva, Inc. All rights reserved. Results", "000")
   text <- str_replace_all(text, "Found 1,014 Timestamp 3 July 2019 7:39 Page 110 of 110 © 2019 Factiva, Inc. All rights reserved", "000")
   text <- str_replace_all(text, "00020190128ef1l00008 000 ", " ")
   text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " " ) 
   text <- str_replace_all(text, "(\")", " ") 
   text <- str_replace_all(text, "(\n\")", " ")
   text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+\\s", " " )      
   

   #splitte igjen, etter at tekst er tatt vekk
   text_list <- str_split(text[1:3], pattern= "Document NAGAZ") # str_split_fixed og n = X er tatt bort
   substr(text_list[1], 1, 2000)
                                                     # se på / 
                                                     # Finne det som må fjernes med en gjennomgang, eller
                                                       substr(text_list[[1]], 1, 4000)  
                                                       substr(text_list[[2]], 1, 2000)
                                                       substr(text_list[[3]], 1, 2000)
                                                        ###############################
                                                       
                                                    # finne det som må fjernes her ved en matrise på alt, se manuelt
                                                      Matrise <- matrix(unlist(text_list))
                                                     #####################################
                                              
   library(tidyverse)
  
  tekster <- as_tibble(matrix(unlist(text_list))) 
  
                                                      tekster # A tibble: 193 x 1
   
   
   data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  
                          kreml = 0,
                          land = "Latvia",
                          rusetn = "høy", 
                          rusmors = "høy", 
                          rusaffek = 4, 
                          FFPfragile = "lav",
                          Russortod = "middels",
                          Plassering = 3,
                          tekst = "hel", 
                          tid = "Januar", 
                          avis = "NashaGazeta"), 
                     stringAsFactors = FALSE)
                                                          # data har 193 obs. Ser på matrixen.
   
   # ta vekk de uønskede
   dataFF <- data[-c(77, 178, 193), ]                     ### data FF har 190 obs.  Ser på matrixen. 
  ###################################
   
   library(quanteda)
   corpusNashaGazetaJanvier <- corpus(dataFF)             ### dataFF m 190 var brukes i corpus nå! ikke data. 
                               ##############
   
   corpusNashaGazetaJanvier$documents$texts               # Vi ser det er 190 outputs         
   docvars(corpusNashaGazetaJanvier)
   summary(corpusNashaGazetaJanvier)
   
   # ekstremt viktig å lage nytt navn her
   save(corpusNashaGazetaJanvier, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_NashaGazeta_Janvier.rda")
   
   load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_NashaGazeta_Janvier.rda")
  
    
    
   ## FINI
   
   
   
   
   
   
      
   
   
   
   
                                           # FEBRUAR #
   
   setwd("~/Downloads/test/2019/Latvia/NashGaz(12) /Februar")
   
   library(pdftools)
   
   # Liste opp filer fra mappe: Februar
   liste<- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Latvia/NashGaz(12) /Februar"), 
                      full.names = TRUE)
   
   
   # Bruker liste for å hente ut tekstene for Nasha Gazeta Januar med pdf_text, pakke: pdftools 
   NashaG <- lapply(liste[1:3], function(x){
     message(x)
     tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                      file = x)
     return(tmp)
   }) 
   
   
   # 100 +24+ 29 = 153 tekster. + 3 = 156. 
  100+24+29
   # [1] 153
  100+24+29+3
   # [1] 156
   # Outputen vil gi +3 tekster fordi jeg det blir er søke-historikk i slutten av hver PDF
 
   
   #   lag dataframe Nasha G Februar
   NashaGframe <- do.call(rbind, NashaG)  # do call brukes for funksjon på liste, r bind radbinder listen
   substr(NashaGframe$text[1], 1, 200) # teskt en, 200 ord - ikke nødvendig
   
   
   # ta vekk withespace, samtidig lager tilfeldigvis om til character og ikke dataframe
   library(stringr)
   
   text <- str_trim(str_replace_all(NashaGframe$text,   "\\s+",  " "))
  
   
   
   
   # splitte sider
   text_list <- str_split(text[1:3], pattern= "Document NAGAZ") # str_split_fixed og n = X er tatt bort
   # se på 
   substr(text_list[2], 1,4000)  # se på tekst to 4000 tegn
   substr(text_list[[3]], 1, 2000)
   
   
   
                            # alt dette skal tas vekk 
   
   text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source", "000")
   text <- str_replace_all(text, "(Latvia, Russian Language)", "000")
   text <- str_replace_all(text, "Or Nasha Gazeta", "000")
   text <- str_replace_all(text, "Or Vesti segodnia", "000")
   text <- str_replace_all(text, "Or Telegraf", "000")
   text <- str_replace_all(text, "Or Lithuanian News Agency", "000")
   text <- str_replace_all(text, "Or TVNET.lv", "000")
   text <- str_replace_all(text, "Or Vesti Segodnya ", "000")
   text <- str_replace_all(text, "- ELTA ", "000")
   text <- str_replace_all(text, " Or 112.ua", "000")
   text <- str_replace_all(text, " All Industries Region All Regions Language Russian", "000")
   text <- str_replace_all(text, " News Filters Source:", "000")
   text <- str_replace_all(text, " Nasha Gazeta", "000")
   text <- str_replace_all(text, "Found 1,014 Timestamp 3 July 2019 7:39", "000")
   text <- str_replace_all(text, "Page 110 of 110 © 2019 Factiva", "000")
   text <- str_replace_all(text, "Inc. All rights reserved.", "000")
   text <- str_replace_all(text, "Ukraine, Russian Language", "000")
   text <- str_replace_all(text, " Delfi ", "000")
   text <- str_replace_all(text, "Russian Language", "000")
   text <- str_replace_all(text, "Inc. All rights reserved.", "000")
   text <- str_replace_all(text, "000", " ")
   text <- str_replace_all(text, "\\(+000+\\)", " ")
   text <- str_replace_all(text, " Or Unian ", " ")
   text <- str_replace_all(text, "\\(+\\s+\\)", " ")
   text <- str_replace_all(text, " , ", " ")
   #Page 108 of 110 
   text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}", "ooo")
   #© 2019 Factiva, 
   text <- str_replace_all(text, "© 2019 Factiva,", "ooo")
   #  196 words
   text <- str_replace_all(text, "[0-9]{1,3}+\\s+words", "ooo")
   #   21 January 2019 
   text <- str_replace_all(text, "[0-9]{1,3}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}", "ooo")
   # Наша Газета NAGAZ 
   text <- str_replace_all(text, "Наша Газета NAGAZ", "ooo")
   #21 Russian © 2019, 
   text <- str_replace_all(text, "21 Russian © 2019, ", "ooo")
   # . DLS. All Rights Reserved
   text <- str_replace_all(text, " . DLS. All Rights Reserved", "ooo")
   #disse er selvsagte
   text <- str_replace_all(text, "DLS. All Rights Reserved", " ")
   text <- str_replace_all(text, " All Industries Region All Regions Language Russian News Filters Source:", " ")
   text <- str_replace_all(text, " Nasha Gazeta ", " ")
   #  22    Фото: TvNet
   text <- str_replace_all(text, "  22    Фото:+\\s+[а-яА-ЯёЁ]{1,10}", " ")
   # пресс-фото
   text <- str_replace_all(text, "Фото:+\\s+[а-яА-ЯёЁ]{1,10}+(-)+[а-яА-ЯёЁ]{1,10}+", "FANGET")
   # rydde opp etterpå
   text <- str_replace_all(text, "ooo", " ")
   text <- str_replace_all(text, "  BBB ", " ")
   text <- str_replace_all(text, "FANGET", " ")
   #20190128ef1l 08 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[0-9]{2}", " ")
   #20190128ef1m 2t 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[0-9]{1}+[A-Za-z]{1}", " ")
   #20190111ef11 ji 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{2}", " ")
   #-   Results Found 1,014
   text <- str_replace_all(text, "-+\\s+\\s+Results+\\s+Found+\\s+[0-9]{1}+\\,+[0-9]{3}", " ")
   #Timestamp   7:42   
   text <- str_replace_all(text, "Timestamp+\\s+\\s+[0-9]{1}+\\:+[0-9]{2}", " ")
   # 4 Russian    Фото: printscreen
   text <- str_replace_all(text, "[0-9]{1}+\\s+Russian+\\s+\\s+Фото+\\:+\\s+printscreen", " ")
   # 2 Russian, 1 Russian osv.
   text <- str_replace_all(text, "[0-9]{1}+\\s+Russian", " ")
   # Фото: иллюстративное фото
   text <- str_replace_all(text, "Фото+\\:+\\s+[а-яА-ЯёЁ]{1,20}", " ")
   text <- str_replace_all(text, "Фото+\\:+\\s+[а-яА-ЯёЁ]{1,20}+\\s+фото", " ")
   # (Estonia,  ) 
   text <- str_replace_all(text, "\\(+Estonia,  +\\)", " ")
   # Date: 
   text <- str_replace_all(text, " Date: ", " ")
   # -         Results  
   text <- str_replace_all(text, "-         Results ", " ")
   #selvsagt
   text <- str_replace_all(text, "  22 Russian", " ")
   text <- str_replace_all(text, "© 2019+\\,", " ")
   # classic
   text <- str_replace_all(text, "ELTA (Russian Language) Or Unian (Ukraine, Russian Language) Or 112.ua (Ukraine, Russian Language)", "000")
   text <- str_replace_all(text, "Author All Authors Company All Companies Subject Political/General News Industry", "000")
   text <- str_replace_all(text, "All Industries Region All Regions Language Russian News Filters Source: Nasha Gazeta (Latvia, Russian Language)", "000")
   text <- str_replace_all(text, "Date: 1 January 2019 - 31 December 2019 Page 109 of 110 © 2019 Factiva, Inc. All rights reserved. Results", "000")
   text <- str_replace_all(text, "Found 1,014 Timestamp 3 July 2019 7:39 Page 110 of 110 © 2019 Factiva, Inc. All rights reserved", "000")
   text <- str_replace_all(text, "00020190128ef1l00008 000 ", " ")
   
   # Фото: Alise Plu
   text <- str_replace_all(text, "Фото+\\:+\\s+[A-Za-z]{1,10}+\\s+[A-Za-z]{1,10}", " ")
   #  20190205ef21 5m
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", " ")
   
   text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+", " ")
   text <- str_replace_all(text, "Фото+\\:+\\s+[A-Za-z]{1,10}+\\s+[A-Za-z]{1,10}", " ")
   text <- str_replace_all(text, "-     Timestamp  ", " " )
   text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " " )
   
   # FÅ INN  
   text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " " )
   text <- str_replace_all(text, "(\")", " ")
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{2}", " ") #20190111ef13 p2
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}", " ") #20190226ef2n dz  
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", " ") # 20190214ef28 02 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", " ") # 20190205ef23 b8
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190205ef23 b5 
   text <- str_replace_all(text, "(\n\")", " ")
   text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+\\s", " " ) 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190226ef2n e1  




   
   # splitte sider
   text_list <- str_split(text[1:3], pattern= "Document NAGAZ") # str_split_fixed og n = X er tatt bort
   # se på 
   substr(text_list[2], 1,4000)  # se på tekst to 4000 tegn
   substr(text_list[[3]], 1, 2000)
   
   
                                                                                             
                                                                                             # Finne det som må fjernes med en gjennomgang
                                                                                             substr(text_list[[1]], 1, 4000)  
                                                                                             substr(text_list[[2]], 1, 2000)
                                                                                             substr(text_list[[3]], 1, 2000)
                                                                                             ###############################
                                                                                             
                                                                                             
                                                                                             # finne det som må fjernes her ved en matrise på alt
                                                                                             Matrise <- matrix(unlist(text_list))
                                                                                             #####################################
                                                                                             # 30, 131, 156
      
   
   library(tidyverse)
   
   #lage dataframe i stedet for matrix, den ble det av en rar grunn   # text_list<- as_tibble (text_list)
   
   tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble
   
   # hvor mange tekster?
   tekster
   #  A tibble: 156 x 1
   
   data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                          kreml = 0,
                          land = "Latvia",
                          rusetn = "høy", 
                          rusmors = "høy", 
                          rusaffek = 4, 
                          FFPfragile = "lav",
                          Russortod = "middels",
                          Plassering = 3,
                          tekst = "hel", 
                          tid = "Februar", 
                          avis = "NashaGazeta"), 
                     stringAsFactors = FALSE)
   
   
                                                 
                                                    
   
   # Etter laget tibble og data 
   # ta vekk de uønskede
   dataFF <- data[-c(30, 131, 156), ]            ### dataFF  A tibble: 153 x 12  Ser på matrixen. (11 docvars, 12 er text) 
   ###################################
   
   
   library(quanteda)
   corpusNashaGazetaFebruar <- corpus(dataFF)      ### dataFF i corpus nå. ikke data. 
   ##############                                                              
                                                                 
   corpusNashaGazetaFebruar$documents$texts
   docvars(corpusNashaGazetaFebruar)
   summary(corpusNashaGazetaFebruar)
   
   
   
   # ekstremt viktig å lage nytt navn her
   save(corpusNashaGazetaFebruar, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_NashaGazeta_Februar.rda")
   
   load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_NashaGazeta_Februar.rda")
   
   
   # FIN. 
   
   
   
   
   

   
   
   
                                     # MARS #
   
   setwd("~/Downloads/test/2019/Latvia/NashGaz(12) /Mars")
   
   library(pdftools)
   
   # Liste opp filer fra mappe
   liste<- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Latvia/NashGaz(12) /Mars"), 
                      full.names = TRUE)
   
   
   # Bruker liste for å hente ut tekstene for Nasha Gazeta Januar med pdf_text, pakke: pdftools 
   NashaG <- lapply(liste[1:3], function(x){
     message(x)
     tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                      file = x)
     return(tmp)
   }) 
   
   
   100+71+8
   # [1] 179
   100+71+8+3
   # [1] 182
   # Outputen vil gi +3 tekster fordi jeg det blir er søke-historikk i slutten av hver PDF
   
   
   #   lag dataframe Nasha G 
   NashaGframe <- do.call(rbind, NashaG)  # do call brukes for funksjon på liste, r bind radbinder listen
   substr(NashaGframe$text[1], 1, 200) # teskt en, 200 ord - ikke nødvendig
   
   
   # ta vekk withespace, samtidig lager tilfeldigvis om til character og ikke dataframe
   library(stringr)
   
   text <- str_trim(str_replace_all(NashaGframe$text,   "\\s+",  " "))
   
   
   
   
   # splitte sider
   text_list <- str_split(text[1:3], pattern= "Document NAGAZ") # str_split_fixed og n = X er tatt bort
   # se på 
   substr(text_list[2], 1,4000)  # se på tekst to 4000 tegn
   substr(text_list[[3]], 1, 2000)
   
   
   
   # alt dette skal tas vekk 

   
   text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source", "000")
   text <- str_replace_all(text, "(Latvia, Russian Language)", "000")
   text <- str_replace_all(text, "Or Nasha Gazeta", "000")
   text <- str_replace_all(text, "Or Vesti segodnia", "000")
   text <- str_replace_all(text, "Or Telegraf", "000")
   text <- str_replace_all(text, "Or Lithuanian News Agency", "000")
   text <- str_replace_all(text, "Or TVNET.lv", "000")
   text <- str_replace_all(text, "Or Vesti Segodnya ", "000")
   text <- str_replace_all(text, "- ELTA ", "000")
   text <- str_replace_all(text, " Or 112.ua", "000")
   text <- str_replace_all(text, " All Industries Region All Regions Language Russian", "000")
   text <- str_replace_all(text, " News Filters Source:", "000")
   text <- str_replace_all(text, " Nasha Gazeta", "000")
   text <- str_replace_all(text, "Found 1,014 Timestamp 3 July 2019 7:39", "000")
   text <- str_replace_all(text, "Page 110 of 110 © 2019 Factiva", "000")
   text <- str_replace_all(text, "Inc. All rights reserved.", "000")
   text <- str_replace_all(text, "Ukraine, Russian Language", "000")
   text <- str_replace_all(text, " Delfi ", "000")
   text <- str_replace_all(text, "Russian Language", "000")
   text <- str_replace_all(text, "Inc. All rights reserved.", "000")
   text <- str_replace_all(text, "000", " ")
   text <- str_replace_all(text, "\\(+000+\\)", " ")
   text <- str_replace_all(text, " Or Unian ", " ")
   text <- str_replace_all(text, "\\(+\\s+\\)", " ")
   text <- str_replace_all(text, " , ", " ")
   #Page 108 of 110 
   text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}", "ooo")
   #© 2019 Factiva, 
   text <- str_replace_all(text, "© 2019 Factiva,", "ooo")
   #  196 words
   text <- str_replace_all(text, "[0-9]{1,3}+\\s+words", "ooo")
   #   21 January 2019 
   text <- str_replace_all(text, "[0-9]{1,3}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}", "ooo")
   # Наша Газета NAGAZ 
   text <- str_replace_all(text, "Наша Газета NAGAZ", "ooo")
   #21 Russian © 2019, 
   text <- str_replace_all(text, "21 Russian © 2019, ", "ooo")
   # . DLS. All Rights Reserved
   text <- str_replace_all(text, " . DLS. All Rights Reserved", "ooo")
   #disse er selvsagte
   text <- str_replace_all(text, "DLS. All Rights Reserved", " ")
   text <- str_replace_all(text, " All Industries Region All Regions Language Russian News Filters Source:", " ")
   text <- str_replace_all(text, " Nasha Gazeta ", " ")
   #  22    Фото: TvNet
   text <- str_replace_all(text, "  22    Фото:+\\s+[а-яА-ЯёЁ]{1,10}", " ")
   # пресс-фото
   text <- str_replace_all(text, "Фото:+\\s+[а-яА-ЯёЁ]{1,10}+(-)+[а-яА-ЯёЁ]{1,10}+", "FANGET")
   # rydde opp etterpå
   text <- str_replace_all(text, "ooo", " ")
   text <- str_replace_all(text, "  BBB ", " ")
   text <- str_replace_all(text, "FANGET", " ")
   #20190128ef1l 08 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[0-9]{2}", " ")
   #20190128ef1m 2t 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[0-9]{1}+[A-Za-z]{1}", " ")
   #20190111ef11 ji 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{2}", " ")
   #-   Results Found 1,014
   text <- str_replace_all(text, "-+\\s+\\s+Results+\\s+Found+\\s+[0-9]{1}+\\,+[0-9]{3}", " ")
   #Timestamp   7:42   
   text <- str_replace_all(text, "Timestamp+\\s+\\s+[0-9]{1}+\\:+[0-9]{2}", " ")
   # 4 Russian    Фото: printscreen
   text <- str_replace_all(text, "[0-9]{1}+\\s+Russian+\\s+\\s+Фото+\\:+\\s+printscreen", " ")
   # 2 Russian, 1 Russian osv.
   text <- str_replace_all(text, "[0-9]{1}+\\s+Russian", " ")
   # Фото: иллюстративное фото
   text <- str_replace_all(text, "Фото+\\:+\\s+[а-яА-ЯёЁ]{1,20}", " ")
   text <- str_replace_all(text, "Фото+\\:+\\s+[а-яА-ЯёЁ]{1,20}+\\s+фото", " ")
  
   # (Estonia,  ) 
   text <- str_replace_all(text, "\\(+Estonia,  +\\)", " ")
   # Date: 
   text <- str_replace_all(text, " Date: ", " ")
   # -         Results  
   text <- str_replace_all(text, "-         Results ", " ")
   #selvsagt
   text <- str_replace_all(text, "  22 Russian", " ")
   text <- str_replace_all(text, "© 2019+\\,", " ")
   # classic
   text <- str_replace_all(text, "ELTA (Russian Language) Or Unian (Ukraine, Russian Language) Or 112.ua (Ukraine, Russian Language)", "000")
   text <- str_replace_all(text, "Author All Authors Company All Companies Subject Political/General News Industry", "000")
   text <- str_replace_all(text, "All Industries Region All Regions Language Russian News Filters Source: Nasha Gazeta (Latvia, Russian Language)", "000")
   text <- str_replace_all(text, "Date: 1 January 2019 - 31 December 2019 Page 109 of 110 © 2019 Factiva, Inc. All rights reserved. Results", "000")
   text <- str_replace_all(text, "Found 1,014 Timestamp 3 July 2019 7:39 Page 110 of 110 © 2019 Factiva, Inc. All rights reserved", "000")
   text <- str_replace_all(text, "00020190128ef1l00008 000 ", " ")
   
   # Фото: Alise Plu
   text <- str_replace_all(text, "Фото+\\:+\\s+[A-Za-z]{1,10}+\\s+[A-Za-z]{1,10}", " ")
   #  20190205ef21 5m
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", " ")
   #  20190304ef31 02
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", " ")
   #Фото: LETA
   text <- str_replace_all(text, "Фото+\\:+\\s+[A-Za-z]{1,20}", " ")
   
   
   # Nytt
   text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " " )
   text <- str_replace_all(text, "(\")", " ")
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{2}", " ") #20190111ef13 p2
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}", " ") #20190226ef2n dz  
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", " ") # 20190214ef28 02 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", " ") # 20190205ef23 b8
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190205ef23 b5 
   text <- str_replace_all(text, "(\n\")", " ")
   text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+\\s", " " ) 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190226ef2n e1 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190318ef3f b8  
   text <- str_replace_all(text, "[0-9]{8}", " ") # 20190318
   text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}+\\s+\\s+\\s+", " ") #  ef3h gp  
   text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef3f b6 
   text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef38 b5 

   
   # splitte sider
   text_list <- str_split(text[1:3], pattern= "Document NAGAZ") # str_split_fixed og n = X er tatt bort
   # se på 
   substr(text_list[2], 1,4000)  # se på tekst to 4000 tegn
   substr(text_list[[1]], 1, 2000)
   
   
   # finne det som må fjernes her ved en matrise på alt
   Matrise <- matrix(unlist(text_list))
   #####################################
   # 9, 110, 182
   
   library(tidyverse) 
   
   #lage dataframe i stedet for matrix
   
   tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble
   
   # hvor mange tekster?
   tekster
   # A tibble: 182 x 1
   
   
   data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                          kreml = 0,
                          land = "Latvia",
                          rusetn = "høy", 
                          rusmors = "høy", 
                          rusaffek = 4, 
                          FFPfragile = "lav",
                          Russortod = "middels",
                          Plassering = 3,
                          tekst = "hel", 
                          tid = "Mars",
                          avis = "NashaGazeta"), 
                     stringAsFactors = FALSE)
   
   
   dataFF <- data[-c(9, 110, 182), ]                    ### data FF, A tibble: 179 x 12 . 
   ###################################
   
   
   library(quanteda)
   corpusNashaGazetaMars <- corpus(dataFF)             ### dataFF m 190 var brukes i corpus nå! ikke data. 
   ##############
   
   
   corpusNashaGazetaMars$documents$texts
   docvars(corpusNashaGazetaMars)
   summary(corpusNashaGazetaMars)
   
   # ekstremt viktig å lage nytt navn her
   save(corpusNashaGazetaMars, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_NashaGazeta_Mars.rda")
   
   load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_NashaGazeta_Mars.rda")
   
   
    
   
   
    
    
    
                                              # APRIL #
    
    

   
   setwd("~/Downloads/test/2019/Latvia/NashGaz(12) /April")
   
   library(pdftools)
   
   # Liste opp filer fra mappe: Februar
   liste<- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Latvia/NashGaz(12) /April"), 
                      full.names = TRUE)
   
   
   # Bruker liste for å hente ut tekstene for Nasha Gazeta Januar med pdf_text, pakke: pdftools 
   NashaG <- lapply(liste[1:2], function(x){
     message(x)
     tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                      file = x)
     return(tmp)
   }) 
   
   
   92+78+2
   # [1] 172
   # Outputen vil gi +2 tekster med data (2 doc)
   
   
   #   lag dataframe Nasha G 
   NashaGframe <- do.call(rbind, NashaG)  # do call brukes for funksjon på liste, r bind radbinder listen
   substr(NashaGframe$text[1], 1, 200) # teskt en, 200 ord - ikke nødvendig
   
   
   # ta vekk withespace, samtidig lager tilfeldigvis om til character og ikke dataframe
   library(stringr)
   
   text <- str_trim(str_replace_all(NashaGframe$text,   "\\s+",  " "))
   
   
   
   
   # splitte sider
   text_list <- str_split(text[1:2], pattern= "Document NAGAZ") # str_split_fixed og n = X er tatt bort
   # se på 
   substr(text_list[2], 1,4000)  # se på tekst to 4000 tegn
   substr(text_list[[2]], 1, 2000)
   
   
   
   # alt dette skal tas vekk 
   text <- str_replace_all(text, "(\")", " ")
   # tatt vekk text <- str_replace_all(text, "\"+[а-яА-ЯёЁ]{1,10}", " ")
   text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source", "000")
   text <- str_replace_all(text, "(Latvia, Russian Language)", "000")
   text <- str_replace_all(text, "Or Nasha Gazeta", "000")
   text <- str_replace_all(text, "Or Vesti segodnia", "000")
   text <- str_replace_all(text, "Or Telegraf", "000")
   text <- str_replace_all(text, "Or Lithuanian News Agency", "000")
   text <- str_replace_all(text, "Or TVNET.lv", "000")
   text <- str_replace_all(text, "Or Vesti Segodnya ", "000")
   text <- str_replace_all(text, "- ELTA ", "000")
   text <- str_replace_all(text, " Or 112.ua", "000")
   text <- str_replace_all(text, " All Industries Region All Regions Language Russian", "000")
   text <- str_replace_all(text, " News Filters Source:", "000")
   text <- str_replace_all(text, " Nasha Gazeta", "000")
   text <- str_replace_all(text, "Found 1,014 Timestamp 3 July 2019 7:39", "000")
   text <- str_replace_all(text, "Page 110 of 110 © 2019 Factiva", "000")
   text <- str_replace_all(text, "Inc. All rights reserved.", "000")
   text <- str_replace_all(text, "Ukraine, Russian Language", "000")
   text <- str_replace_all(text, " Delfi ", "000")
   text <- str_replace_all(text, "Russian Language", "000")
   text <- str_replace_all(text, "Inc. All rights reserved.", "000")
   text <- str_replace_all(text, "000", " ")
   text <- str_replace_all(text, "\\(+000+\\)", " ")
   text <- str_replace_all(text, " Or Unian ", " ")
   text <- str_replace_all(text, "\\(+\\s+\\)", " ")
   text <- str_replace_all(text, " , ", " ")
   #Page 108 of 110 
   text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}", "ooo")
   #© 2019 Factiva, 
   text <- str_replace_all(text, "© 2019 Factiva,", "ooo")
   #  196 words
   text <- str_replace_all(text, "[0-9]{1,3}+\\s+words", "ooo")
   #   21 January 2019 
   text <- str_replace_all(text, "[0-9]{1,3}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}", "ooo")
   # Наша Газета NAGAZ 
   text <- str_replace_all(text, "Наша Газета NAGAZ", "ooo")
   #21 Russian © 2019, 
   text <- str_replace_all(text, "21 Russian © 2019, ", "ooo")
   # . DLS. All Rights Reserved
   text <- str_replace_all(text, " . DLS. All Rights Reserved", "ooo")
   #disse er selvsagte
   text <- str_replace_all(text, "DLS. All Rights Reserved", " ")
   text <- str_replace_all(text, " All Industries Region All Regions Language Russian News Filters Source:", " ")
   text <- str_replace_all(text, " Nasha Gazeta ", " ")
   #  22    Фото: TvNet
   text <- str_replace_all(text, "  22    Фото:+\\s+[а-яА-ЯёЁ]{1,10}", " ")
   # пресс-фото
   text <- str_replace_all(text, "Фото:+\\s+[а-яА-ЯёЁ]{1,10}+(-)+[а-яА-ЯёЁ]{1,10}+", "FANGET")
   # rydde opp etterpå
   text <- str_replace_all(text, "ooo", " ")
   text <- str_replace_all(text, "  BBB ", " ")
   text <- str_replace_all(text, "FANGET", " ")
   #20190128ef1l 08 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[0-9]{2}", " ")
   #20190128ef1m 2t 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[0-9]{1}+[A-Za-z]{1}", " ")
   #20190111ef11 ji 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{2}", " ")
   #-   Results Found 1,014
   text <- str_replace_all(text, "-+\\s+\\s+Results+\\s+Found+\\s+[0-9]{1}+\\,+[0-9]{3}", " ")
   #Timestamp   7:42   
   text <- str_replace_all(text, "Timestamp+\\s+\\s+[0-9]{1}+\\:+[0-9]{2}", " ")
   # 4 Russian    Фото: printscreen
   text <- str_replace_all(text, "[0-9]{1}+\\s+Russian+\\s+\\s+Фото+\\:+\\s+printscreen", " ")
   # 2 Russian, 1 Russian osv.
   text <- str_replace_all(text, "[0-9]{1}+\\s+Russian", " ")
   # Фото: иллюстративное фото
   text <- str_replace_all(text, "Фото+\\:+\\s+[а-яА-ЯёЁ]{1,20}", " ")
   text <- str_replace_all(text, "Фото+\\:+\\s+[а-яА-ЯёЁ]{1,20}+\\s+фото", " ")
   
   # (Estonia,  ) 
   text <- str_replace_all(text, "\\(+Estonia,  +\\)", " ")
   # Date: 
   text <- str_replace_all(text, " Date: ", " ")
   # -         Results  
   text <- str_replace_all(text, "-         Results ", " ")

   text <- str_replace_all(text, "  22 Russian", " ")
   text <- str_replace_all(text, "© 2019+\\,", " ")
   text <- str_replace_all(text, "ELTA (Russian Language) Or Unian (Ukraine, Russian Language) Or 112.ua (Ukraine, Russian Language)", "000")
   text <- str_replace_all(text, "Author All Authors Company All Companies Subject Political/General News Industry", "000")
   text <- str_replace_all(text, "All Industries Region All Regions Language Russian News Filters Source: Nasha Gazeta (Latvia, Russian Language)", "000")
   text <- str_replace_all(text, "Date: 1 January 2019 - 31 December 2019 Page 109 of 110 © 2019 Factiva, Inc. All rights reserved. Results", "000")
   text <- str_replace_all(text, "Found 1,014 Timestamp 3 July 2019 7:39 Page 110 of 110 © 2019 Factiva, Inc. All rights reserved", "000")
   text <- str_replace_all(text, "00020190128ef1l00008 000 ", " ")
   text <- str_replace_all(text, "Author All Authors Company All Companies", " ")
   text <- str_replace_all(text, "Subject Political/General News Industry ", " ")
   text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+\\s+\\s", " ")
   text <- str_replace_all(text, "nasha.lv", " ")
   text <- str_replace_all(text, "(\")", " ")
   text <- str_replace_all(text, "\\(+000+\\)", " ")
   # Nytt
   text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " " )
   text <- str_replace_all(text, "(\")", " ")
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{2}", " ") #20190111ef13 p2
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}", " ") #20190226ef2n dz  
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", " ") # 20190214ef28 02 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", " ") # 20190205ef23 b8
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190205ef23 b5 
   text <- str_replace_all(text, "(\n\")", " ")
   text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+\\s", " " ) 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190226ef2n e1 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190318ef3f b8  
   text <- str_replace_all(text, "[0-9]{8}", " ") # 20190318
   text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}+\\s+\\s+\\s+", " ") #  ef3h gp  
   text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[A-Za-z]{1}+\\s+\\s+\\s+", " ") #  ef3f b6 
   text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef3f b6 
   text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef38 b5 
  
   
   # Фото: Alise Plu
   text <- str_replace_all(text, "Фото+\\:+\\s+[A-Za-z]{1,10}+\\s+[A-Za-z]{1,10}", " ")
   #  20190205ef21 5m
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", " ")
   #  20190304ef31 02
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", " ")
   #Фото: LETA
   text <- str_replace_all(text, "Фото+\\:+\\s+[A-Za-z]{1,20}", " ")
   
   
   
   
   # splitte sider
   text_list <- str_split(text[1:2], pattern= "Document NAGAZ") # str_split_fixed og n = X er tatt bort
   # se på 
   substr(text_list[2], 1,4000)  # se på tekst to 4000 tegn
   substr(text_list[[2]], 1, 2000)
   
   
   library(tidyverse)
   
   
   Matrise <- matrix(unlist(text_list))
   #####################################
   # 93 ,172
   
   
   
   #lage dataframe i stedet for matrix
   
   tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble
   

   tekster
   # A tibble: 172 x 1
   
   
   data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                          kreml = 0,
                          land = "Latvia",
                          rusetn = "høy", 
                          rusmors = "høy", 
                          rusaffek = 4, 
                          FFPfragile = "lav",
                          Russortod = "middels",
                          Plassering = 3,
                          tekst = "hel", 
                          tid = "April", 
                          avis= "NashaGazeta"), 
                     stringAsFactors = FALSE)
   
  
   dataFF <- data[-c(93, 172), ]                     ### A tibble: 170 x 12 
   ###################################

   
   library(quanteda)
   corpusNashaGazetaApril <- corpus(dataFF)              #############
   corpusNashaGazetaApril$documents$texts
   docvars(corpusNashaGazetaApril)
   summary(corpusNashaGazetaApril)
   
   # ekstremt viktig å lage nytt navn her
   save(corpusNashaGazetaApril, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_NashaGazeta_April.rda")
   
   load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_NashaGazeta_April.rda")
   
    
   
   
   
   
   
                                     # MAI #
    
    
   setwd("~/Downloads/test/2019/Latvia/NashGaz(12) /Mai")
   
   library(pdftools)
   
   # Liste opp filer fra mappe: Februar
   liste<- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Latvia/NashGaz(12) /Mai"), 
                      full.names = TRUE)
   
   
   # Bruker liste for å hente ut tekstene for Nasha Gazeta Januar med pdf_text, pakke: pdftools 
   NashaG <- lapply(liste[1:3], function(x){
     message(x)
     tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                      file = x)
     return(tmp)
   }) 
   
   
   22+49+100+3
   # [1] 174
   # Outputen vil gi +3 tekster  - bør ikke være nødvendig å forklare hver gang

   
   #   lag dataframe Nasha G 
   NashaGframe <- do.call(rbind, NashaG)  # do call brukes for funksjon på liste, r bind radbinder listen
   substr(NashaGframe$text[1], 1, 200) # teskt en, 200 ord - ikke nødvendig
   
   
   # ta vekk withespace, samtidig lager tilfeldigvis om til character og ikke dataframe
   library(stringr)
   
   text <- str_trim(str_replace_all(NashaGframe$text,   "\\s+",  " "))
   
   
   
   
   # splitte sider
   text_list <- str_split(text[1:3], pattern= "Document NAGAZ") # str_split_fixed og n = X er tatt bort
   # se på 
   substr(text_list[2], 1,4000)  # se på tekst to 4000 tegn
   substr(text_list[[2]], 1, 2000)
   
   
   
   # alt dette skal tas vekk 
   
   text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source", "000")
   text <- str_replace_all(text, "(Latvia, Russian Language)", "000")
   text <- str_replace_all(text, "Or Nasha Gazeta", "000")
   text <- str_replace_all(text, "Or Vesti segodnia", "000")
   text <- str_replace_all(text, "Or Telegraf", "000")
   text <- str_replace_all(text, "Or Lithuanian News Agency", "000")
   text <- str_replace_all(text, "Or TVNET.lv", "000")
   text <- str_replace_all(text, "Or Vesti Segodnya ", "000")
   text <- str_replace_all(text, "- ELTA ", "000")
   text <- str_replace_all(text, " Or 112.ua", "000")
   text <- str_replace_all(text, " All Industries Region All Regions Language Russian", "000")
   text <- str_replace_all(text, " News Filters Source:", "000")
   text <- str_replace_all(text, " Nasha Gazeta", "000")
   text <- str_replace_all(text, "Found 1,014 Timestamp 3 July 2019 7:39", "000")
   text <- str_replace_all(text, "Page 110 of 110 © 2019 Factiva", "000")
   text <- str_replace_all(text, "Inc. All rights reserved.", "000")
   text <- str_replace_all(text, "Ukraine, Russian Language", "000")
   text <- str_replace_all(text, " Delfi ", "000")
   text <- str_replace_all(text, "Russian Language", "000")
   text <- str_replace_all(text, "Inc. All rights reserved.", "000")
   text <- str_replace_all(text, "000", " ")
   text <- str_replace_all(text, "\\(+000+\\)", " ")
   text <- str_replace_all(text, " Or Unian ", " ")
   text <- str_replace_all(text, "\\(+\\s+\\)", " ")
   text <- str_replace_all(text, " , ", " ")
   #Page 108 of 110 
   text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}", "ooo")
   #© 2019 Factiva, 
   text <- str_replace_all(text, "© 2019 Factiva,", "ooo")
   #  196 words
   text <- str_replace_all(text, "[0-9]{1,3}+\\s+words", "ooo")
   #   21 January 2019 
   text <- str_replace_all(text, "[0-9]{1,3}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}", "ooo")
   # Наша Газета NAGAZ 
   text <- str_replace_all(text, "Наша Газета NAGAZ", "ooo")
   #21 Russian © 2019, 
   text <- str_replace_all(text, "21 Russian © 2019, ", "ooo")
   # . DLS. All Rights Reserved
   text <- str_replace_all(text, " . DLS. All Rights Reserved", "ooo")
   #disse er selvsagte
   text <- str_replace_all(text, "DLS. All Rights Reserved", " ")
   text <- str_replace_all(text, " All Industries Region All Regions Language Russian News Filters Source:", " ")
   text <- str_replace_all(text, " Nasha Gazeta ", " ")
   #  22    Фото: TvNet
   text <- str_replace_all(text, "  22    Фото:+\\s+[а-яА-ЯёЁ]{1,10}", " ")
   # пресс-фото
   text <- str_replace_all(text, "Фото:+\\s+[а-яА-ЯёЁ]{1,10}+(-)+[а-яА-ЯёЁ]{1,10}+", "FANGET")
   # rydde opp etterpå
   text <- str_replace_all(text, "ooo", " ")
   text <- str_replace_all(text, "  BBB ", " ")
   text <- str_replace_all(text, "FANGET", " ")
   #20190128ef1l 08 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[0-9]{2}", " ")
   #20190128ef1m 2t 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[0-9]{1}+[A-Za-z]{1}", " ")
   #20190111ef11 ji 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{2}", " ")
   #-   Results Found 1,014
   text <- str_replace_all(text, "-+\\s+\\s+Results+\\s+Found+\\s+[0-9]{1}+\\,+[0-9]{3}", " ")
   #Timestamp   7:42   
   text <- str_replace_all(text, "Timestamp+\\s+\\s+[0-9]{1}+\\:+[0-9]{2}", " ")
   # 4 Russian    Фото: printscreen
   text <- str_replace_all(text, "[0-9]{1}+\\s+Russian+\\s+\\s+Фото+\\:+\\s+printscreen", " ")
   # 2 Russian, 1 Russian osv.
   text <- str_replace_all(text, "[0-9]{1}+\\s+Russian", " ")
   # Фото: иллюстративное фото
   text <- str_replace_all(text, "Фото+\\:+\\s+[а-яА-ЯёЁ]{1,20}", " ")
   text <- str_replace_all(text, "Фото+\\:+\\s+[а-яА-ЯёЁ]{1,20}+\\s+фото", " ")
   
   # (Estonia,  ) 
   text <- str_replace_all(text, "\\(+Estonia,  +\\)", " ")
   # Date: 
   text <- str_replace_all(text, " Date: ", " ")
   # -         Results  
   text <- str_replace_all(text, "-         Results ", " ")
   
   text <- str_replace_all(text, "  22 Russian", " ")
   text <- str_replace_all(text, "© 2019+\\,", " ")
   text <- str_replace_all(text, "ELTA (Russian Language) Or Unian (Ukraine, Russian Language) Or 112.ua (Ukraine, Russian Language)", "000")
   text <- str_replace_all(text, "Author All Authors Company All Companies Subject Political/General News Industry", "000")
   text <- str_replace_all(text, "All Industries Region All Regions Language Russian News Filters Source: Nasha Gazeta (Latvia, Russian Language)", "000")
   text <- str_replace_all(text, "Date: 1 January 2019 - 31 December 2019 Page 109 of 110 © 2019 Factiva, Inc. All rights reserved. Results", "000")
   text <- str_replace_all(text, "Found 1,014 Timestamp 3 July 2019 7:39 Page 110 of 110 © 2019 Factiva, Inc. All rights reserved", "000")
   text <- str_replace_all(text, "00020190128ef1l00008 000 ", " ")
   text <- str_replace_all(text, "Author All Authors Company All Companies", " ")
   text <- str_replace_all(text, "Subject Political/General News Industry ", " ")
   text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+\\s+\\s", " ")
   text <- str_replace_all(text, "nasha.lv", " ")
   
   # Фото: Alise Plu
   text <- str_replace_all(text, "Фото+\\:+\\s+[A-Za-z]{1,10}+\\s+[A-Za-z]{1,10}", " ")
   #  20190205ef21 5m
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", " ")
   #  20190304ef31 02
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", " ")
   #Фото: LETA
   text <- str_replace_all(text, "Фото+\\:+\\s+[A-Za-z]{1,20}", " ")
   #        000        
   text <- str_replace_all(text, "000", " ")
  
      text <- str_replace_all(text, "(\")", " ")
 
      # Nytt
      text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " " )
      text <- str_replace_all(text, "(\")", " ")
      text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{2}", " ") #20190111ef13 p2
      text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}", " ") #20190226ef2n dz  
      text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", " ") # 20190214ef28 02 
      text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", " ") # 20190205ef23 b8
      text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190205ef23 b5 
      text <- str_replace_all(text, "(\n\")", " ")
      text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+\\s", " " ) 
      text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190226ef2n e1 
      text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190318ef3f b8  
      text <- str_replace_all(text, "[0-9]{8}", " ") # 20190318
      text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}+\\s+\\s+\\s+", " ") #  ef3h gp  
      text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[A-Za-z]{1}+\\s+\\s+\\s+", " ") #  ef3f b6 
      text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef3f b6 
      text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef38 b5 
      
   
   # splitte sider
   text_list <- str_split(text[1:3], pattern= "Document NAGAZ") # str_split_fixed og n = X er tatt bort
   # se på 
   substr(text_list[2], 1,4000)  # se på tekst to 4000 tegn
   substr(text_list[[2]], 1, 2000)
   
   
   library(tidyverse)
   
   Matrise <- matrix(unlist(text_list))
 
   
   
   
   tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble
   
   # hvor mange tekster?
   tekster
   # A tibble: 174 x 1
   
   
   data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                          kreml = 0,
                          land = "Latvia",
                          rusetn = "høy", 
                          rusmors = "høy", 
                          rusaffek = 4, 
                          FFPfragile = "lav",
                          Russortod = "middels",
                          Plassering = 3,
                          tekst = "hel", 
                          tid = "Mai", 
                          avis = "NashaGazeta"), 
                     stringAsFactors = FALSE)
   
   
   dataFF <- data[-c(50, 151, 174), ]   ##
                        
   library(quanteda)
   corpusNashaGazetaMai <- corpus(dataFF) ##
   corpusNashaGazetaMai$documents$texts
   docvars(corpusNashaGazetaMai)
   summary(corpusNashaGazetaMai)
   
   # ekstremt viktig å lage nytt navn her så den ikke overskriver igjen
   save(corpusNashaGazetaMai, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_NashaGazeta_Mai.rda")
   
   load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_NashaGazeta_Mai.rda")
   
    
    # FIN. 
   

   
   
                                                # JUNI #
   
   
   setwd("~/Downloads/test/2019/Latvia/NashGaz(12) /Juni")
   
   library(pdftools)
   
   # Liste opp filer fra mappe: Februar
   liste<- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Latvia/NashGaz(12) /Juni"), 
                      full.names = TRUE)
   
   
   # Bruker liste for å hente ut tekstene for Nasha Gazeta Januar med pdf_text, pakke: pdftools 
   NashaG <- lapply(liste[1:2], function(x){
     message(x)
     tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                      file = x)
     return(tmp)
   }) 
   
   
   100+51+2
   # [1] 153
   # Outputen vil gi +2 tekster  - bør ikke være nødvendig å forklare hver gang
   
   
   #   lag dataframe Nasha G 
   NashaGframe <- do.call(rbind, NashaG)  # do call brukes for funksjon på liste, r bind radbinder listen
   substr(NashaGframe$text[1], 1, 200) # teskt en, 200 ord - ikke nødvendig
   
   
   # ta vekk withespace, samtidig lager tilfeldigvis om til character og ikke dataframe
   library(stringr)
   
   text <- str_trim(str_replace_all(NashaGframe$text,   "\\s+",  " "))
   
   
   
   
   # splitte sider
   text_list <- str_split(text[1:2], pattern= "Document NAGAZ") # str_split_fixed og n = X er tatt bort
   # se på 
   substr(text_list[2], 1,4000)  # se på tekst to 4000 tegn
   substr(text_list[[2]], 1, 2000)
   
   
   
   # alt dette skal tas vekk 
   
   text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source", "000")
   text <- str_replace_all(text, "(Latvia, Russian Language)", "000")
   text <- str_replace_all(text, "Or Nasha Gazeta", "000")
   text <- str_replace_all(text, "Or Vesti segodnia", "000")
   text <- str_replace_all(text, "Or Telegraf", "000")
   text <- str_replace_all(text, "Or Lithuanian News Agency", "000")
   text <- str_replace_all(text, "Or TVNET.lv", "000")
   text <- str_replace_all(text, "Or Vesti Segodnya ", "000")
   text <- str_replace_all(text, "- ELTA ", "000")
   text <- str_replace_all(text, " Or 112.ua", "000")
   text <- str_replace_all(text, " All Industries Region All Regions Language Russian", "000")
   text <- str_replace_all(text, " News Filters Source:", "000")
   text <- str_replace_all(text, " Nasha Gazeta", "000")
   text <- str_replace_all(text, "Found 1,014 Timestamp 3 July 2019 7:39", "000")
   text <- str_replace_all(text, "Page 110 of 110 © 2019 Factiva", "000")
   text <- str_replace_all(text, "Inc. All rights reserved.", "000")
   text <- str_replace_all(text, "Ukraine, Russian Language", "000")
   text <- str_replace_all(text, " Delfi ", "000")
   text <- str_replace_all(text, "Russian Language", "000")
   text <- str_replace_all(text, "Inc. All rights reserved.", "000")
   text <- str_replace_all(text, "000", " ")
   text <- str_replace_all(text, "\\(+000+\\)", " ")
   text <- str_replace_all(text, " Or Unian ", " ")
   text <- str_replace_all(text, "\\(+\\s+\\)", " ")
   text <- str_replace_all(text, " , ", " ")
   #Page 108 of 110 
   text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}", "ooo")
   #© 2019 Factiva, 
   text <- str_replace_all(text, "© 2019 Factiva,", "ooo")
   #  196 words
   text <- str_replace_all(text, "[0-9]{1,3}+\\s+words", "ooo")
   #   21 January 2019 
   text <- str_replace_all(text, "[0-9]{1,3}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}", "ooo")
   # Наша Газета NAGAZ 
   text <- str_replace_all(text, "Наша Газета NAGAZ", "ooo")
   #21 Russian © 2019, 
   text <- str_replace_all(text, "21 Russian © 2019, ", "ooo")
   # . DLS. All Rights Reserved
   text <- str_replace_all(text, " . DLS. All Rights Reserved", "ooo")
   #disse er selvsagte
   text <- str_replace_all(text, "DLS. All Rights Reserved", " ")
   text <- str_replace_all(text, " All Industries Region All Regions Language Russian News Filters Source:", " ")
   text <- str_replace_all(text, " Nasha Gazeta ", " ")
   #  22    Фото: TvNet
   text <- str_replace_all(text, "  22    Фото:+\\s+[а-яА-ЯёЁ]{1,10}", " ")
   # пресс-фото
   text <- str_replace_all(text, "Фото:+\\s+[а-яА-ЯёЁ]{1,10}+(-)+[а-яА-ЯёЁ]{1,10}+", "FANGET")
   # rydde opp etterpå
   text <- str_replace_all(text, "ooo", " ")
   text <- str_replace_all(text, "  BBB ", " ")
   text <- str_replace_all(text, "FANGET", " ")
   #20190128ef1l 08 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[0-9]{2}", " ")
   #20190128ef1m 2t 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[0-9]{1}+[A-Za-z]{1}", " ")
   #20190111ef11 ji 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{2}", " ")
   #-   Results Found 1,014
   text <- str_replace_all(text, "-+\\s+\\s+Results+\\s+Found+\\s+[0-9]{1}+\\,+[0-9]{3}", " ")
   #Timestamp   7:42   
   text <- str_replace_all(text, "Timestamp+\\s+\\s+[0-9]{1}+\\:+[0-9]{2}", " ")
   # 4 Russian    Фото: printscreen
   text <- str_replace_all(text, "[0-9]{1}+\\s+Russian+\\s+\\s+Фото+\\:+\\s+printscreen", " ")
   # 2 Russian, 1 Russian osv.
   text <- str_replace_all(text, "[0-9]{1}+\\s+Russian", " ")
   # Фото: иллюстративное фото
   text <- str_replace_all(text, "Фото+\\:+\\s+[а-яА-ЯёЁ]{1,20}", " ")
   text <- str_replace_all(text, "Фото+\\:+\\s+[а-яА-ЯёЁ]{1,20}+\\s+фото", " ")
   
   # (Estonia,  ) 
   text <- str_replace_all(text, "\\(+Estonia,  +\\)", " ")
   # Date: 
   text <- str_replace_all(text, " Date: ", " ")
   # -         Results  
   text <- str_replace_all(text, "-         Results ", " ")
   
   text <- str_replace_all(text, "  22 Russian", " ")
   text <- str_replace_all(text, "© 2019+\\,", " ")
   text <- str_replace_all(text, "ELTA (Russian Language) Or Unian (Ukraine, Russian Language) Or 112.ua (Ukraine, Russian Language)", "000")
   text <- str_replace_all(text, "Author All Authors Company All Companies Subject Political/General News Industry", "000")
   text <- str_replace_all(text, "All Industries Region All Regions Language Russian News Filters Source: Nasha Gazeta (Latvia, Russian Language)", "000")
   text <- str_replace_all(text, "Date: 1 January 2019 - 31 December 2019 Page 109 of 110 © 2019 Factiva, Inc. All rights reserved. Results", "000")
   text <- str_replace_all(text, "Found 1,014 Timestamp 3 July 2019 7:39 Page 110 of 110 © 2019 Factiva, Inc. All rights reserved", "000")
   text <- str_replace_all(text, "00020190128ef1l00008 000 ", " ")
   text <- str_replace_all(text, "Author All Authors Company All Companies", " ")
   text <- str_replace_all(text, "Subject Political/General News Industry ", " ")
   text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+\\s+\\s", " ")
   text <- str_replace_all(text, "nasha.lv", " ")
   
   # Фото: Alise Plu
   text <- str_replace_all(text, "Фото+\\:+\\s+[A-Za-z]{1,10}+\\s+[A-Za-z]{1,10}", " ")
   #  20190205ef21 5m
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", " ")
   #  20190304ef31 02
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", " ")
   #Фото: LETA
   text <- str_replace_all(text, "Фото+\\:+\\s+[A-Za-z]{1,20}", " ")
   #        000        
   text <- str_replace_all(text, "000", " ")
   # .lv 
   text <- str_replace_all(text, " .lv ", " ")
   text <- str_replace_all(text, "(\")", " ")
   
   # Nytt
   text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " " )
   text <- str_replace_all(text, "(\")", " ")
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{2}", " ") #20190111ef13 p2
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}", " ") #20190226ef2n dz  
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", " ") # 20190214ef28 02 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", " ") # 20190205ef23 b8
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190205ef23 b5 
   text <- str_replace_all(text, "(\n\")", " ")
   text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+\\s", " " ) 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190226ef2n e1 
   text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190318ef3f b8  
   text <- str_replace_all(text, "[0-9]{8}", " ") # 20190318
   text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}+\\s+\\s+\\s+", " ") #  ef3h gp  
   text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[A-Za-z]{1}+\\s+\\s+\\s+", " ") #  ef3f b6 
   text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef3f b6 
   text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef38 b5 
   
   
   # splitte sider
   text_list <- str_split(text[1:2], pattern= "Document NAGAZ") # str_split_fixed og n = X er tatt bort
   # se på 
   substr(text_list[2], 1,4000)  # se på tekst to 4000 tegn
   substr(text_list[[2]], 1, 2000)
   
   
   library(tidyverse)
   
   Matrise <- matrix(unlist(text_list))
   
   #lage dataframe i stedet for matrix
   
   tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble
   
   # hvor mange tekster?
   tekster
   # A tibble: 153 x 1
   
   
   data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                          kreml = 0,
                          land = "Latvia",
                          rusetn = "høy", 
                          rusmors = "høy", 
                          rusaffek = 4, 
                          FFPfragile = "lav",
                          Russortod = "middels",
                          Plassering = 3,
                          tekst = "hel", 
                          tid = "Juni", 
                          avis = "NashaGazeta"), 
                     stringAsFactors = FALSE)
   

   dataFF <- data[-c(101, 153), ]
   
   library(quanteda)
   corpusNashaGazetaJuni <- corpus(dataFF)
   corpusNashaGazetaJuni$documents$texts
   docvars(corpusNashaGazetaJuni)
   summary(corpusNashaGazetaJuni)
   
   # ekstremt viktig å lage nytt navn her så den ikke overskriver igjen
   save(corpusNashaGazetaJuni, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_NashaGazeta_Juni.rda")
   
   load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_NashaGazeta_Juni.rda")
   
   # FIN. 
   
   
   
   
   
                                          #            #
                                          #          # 
                                          ##        # 
                                             ##   ## 
                                                ## 
   
   
                                         ######### Vesti #############
                                         
                                           ### Kreml-linket ###
   

  
  
    
                                             ##### JANUAR ####
        
   
# Liste opp filer fra mappe 
liste<- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Latvia/Vesti(3)/Januar"), 
                   full.names = TRUE)


# Bruker liste for å hente ut tekstene med pdf_text
Vesti <- lapply(liste[1:4], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
  }) 


                                    #   lag dataframe 
Vestiframe <- do.call(rbind, Vesti)  # do call brukes for funksjon på liste, r bind radbinder listen
substr(Vestiframe$text[1], 1, 200) # teskt en, 200 ord - ikke nødvendig


# ta vekk withespace, samtidig lager vi tilfeldigvis om til character og ikke dataframe
library(stringr)

text <- str_trim(str_replace_all(Vestiframe$text,   "\\s+",  " "))


#forventet tekster
(100*2)+13+5+2
# [1] 220


# splitte sider
text_list <- str_split(text[1:4], pattern= "Document DLSVE") # str_split_fixed og n = X er tatt bort

# se på
substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)


               ### alt dette skal tas vekk ###

text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source", " ")
text <- str_replace_all(text, "(Latvia, Russian Language)", " ")
text <- str_replace_all(text, "Or Nasha Gazeta", " ")
text <- str_replace_all(text, "Or Vesti segodnia", " ")
text <- str_replace_all(text, "Or Telegraf", " ")
text <- str_replace_all(text, "Or Lithuanian News Agency", " ")
text <- str_replace_all(text, "Or TVNET.lv", " ")
text <- str_replace_all(text, "Or Vesti Segodnya ", " ")
text <- str_replace_all(text, "- ELTA ", " ")
text <- str_replace_all(text, " Or 112.ua", " ")
text <- str_replace_all(text, " All Industries Region All Regions Language Russian", " ")
text <- str_replace_all(text, " News Filters Source:", "000")
text <- str_replace_all(text, " Nasha Gazeta", "000")
text <- str_replace_all(text, "Found 1,014 Timestamp 3 July 2019 7:39", " ")
text <- str_replace_all(text, "Page 110 of 110 © 2019 Factiva", " ")
text <- str_replace_all(text, "Inc. All rights reserved.", " ")
text <- str_replace_all(text, "Ukraine, Russian Language", " ")
text <- str_replace_all(text, " Delfi ", " ")
text <- str_replace_all(text, "Russian Language", " ")
text <- str_replace_all(text, "Inc. All rights reserved.", " ")
text <- str_replace_all(text, "000", " ")
text <- str_replace_all(text, "\\(+000+\\)", " ")
text <- str_replace_all(text, " Or Unian ", " ")
text <- str_replace_all(text, "\\(+\\s+\\)", " ")
text <- str_replace_all(text, " , ", " ")
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}", " ")
text <- str_replace_all(text, "© 2019 Factiva,", " ")
text <- str_replace_all(text, "[0-9]{1,3}+\\s+words", " ")
text <- str_replace_all(text, "[0-9]{1,3}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}", " ")
text <- str_replace_all(text, "Наша Газета NAGAZ", " ")
text <- str_replace_all(text, "21 Russian © 2019, ", " ")
text <- str_replace_all(text, " . DLS. All Rights Reserved", " ")
text <- str_replace_all(text, "DLS. All Rights Reserved", " ")
text <- str_replace_all(text, " All Industries Region All Regions Language Russian News Filters Source:", " ")
text <- str_replace_all(text, " Nasha Gazeta ", " ")
text <- str_replace_all(text, "  22    Фото:+\\s+[а-яА-ЯёЁ]{1,10}", " ")
text <- str_replace_all(text, "Фото:+\\s+[а-яА-ЯёЁ]{1,10}+(-)+[а-яА-ЯёЁ]{1,10}+", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[0-9]{2}", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[0-9]{1}+[A-Za-z]{1}", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{2}", " ")
text <- str_replace_all(text, "-+\\s+\\s+Results+\\s+Found+\\s+[0-9]{1}+\\,+[0-9]{3}", " ")
text <- str_replace_all(text, "Timestamp+\\s+\\s+[0-9]{1}+\\:+[0-9]{2}", " ")
text <- str_replace_all(text, "[0-9]{1}+\\s+Russian+\\s+\\s+Фото+\\:+\\s+printscreen", " ")
text <- str_replace_all(text, "[0-9]{1}+\\s+Russian", " ")
text <- str_replace_all(text, "Фото+\\:+\\s+[а-яА-ЯёЁ]{1,20}", " ")
text <- str_replace_all(text, "Фото+\\:+\\s+[а-яА-ЯёЁ]{1,20}+\\s+фото", " ")
text <- str_replace_all(text, "\\(+Estonia,  +\\)", " ")
text <- str_replace_all(text, " Date: ", " ")
text <- str_replace_all(text, "-         Results ", " ")
text <- str_replace_all(text, "  22 Russian", " ")
text <- str_replace_all(text, "© 2019+\\,", " ")
text <- str_replace_all(text, "ELTA (Russian Language) Or Unian (Ukraine, Russian Language) Or 112.ua (Ukraine, Russian Language)", " ")
text <- str_replace_all(text, "Author All Authors Company All Companies Subject Political/General News Industry", "000")
text <- str_replace_all(text, "All Industries Region All Regions Language Russian News Filters Source: Nasha Gazeta (Latvia, Russian Language)", " ")
text <- str_replace_all(text, "Date: 1 January 2019 - 31 December 2019 Page 109 of 110 © 2019 Factiva, Inc. All rights reserved. Results", " ")
text <- str_replace_all(text, "Found 1,014 Timestamp 3 July 2019 7:39 Page 110 of 110 © 2019 Factiva, Inc. All rights reserved", " ")
text <- str_replace_all(text, "00020190128ef1l00008 000 ", " ")
text <- str_replace_all(text, "Author All Authors Company All Companies", " ")
text <- str_replace_all(text, "Subject Political/General News Industry ", " ")
text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+\\s+\\s", " ")
text <- str_replace_all(text, "nasha.lv", " ")
text <- str_replace_all(text, "Фото+\\:+\\s+[A-Za-z]{1,10}+\\s+[A-Za-z]{1,10}", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", " ")
text <- str_replace_all(text, "Фото+\\:+\\s+[A-Za-z]{1,20}", " ")
text <- str_replace_all(text, " .lv ", " ")
text <- str_replace_all(text, "S00", " ")
text <- str_replace_all(text, " 000", " ")
text <- str_replace_all(text, " Vesti Segodnya", " ")
text <- str_replace_all(text, "Results Found+\\s+[0-9]{1,4}", " ")
text <- str_replace_all(text, "Вести сегодня DLSVES   (c) 2019. Vesti Segodnya, DLS. All rights reserved.", " ")
text <- str_replace_all(text, "DLSVES   (c) 2019. , DLS. All rights reserved. ", " ")
text <- str_replace_all(text, "Вести сегодня DLSVES", " ")
text <- str_replace_all(text, "\\(+c++\\)+\\s+2019+\\.+\\s+\\,+\\s+DLS. All rights reserved.", " ")
text <- str_replace_all(text, "    -  ", " ")
text <- str_replace_all(text, "       3    ", " ")
text <- str_replace_all(text, "\\s+\\s+\\s+3+\\s+\\s+", " ")
text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+", " ")
text <- str_replace_all(text, " .lv ", " ")
text <- str_replace_all(text, "(\")", " ")
# tatt vekk text <- str_replace_all(text, "\"+[а-яА-ЯёЁ]{1,10}", " ")
# Nytt
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " " )
text <- str_replace_all(text, "(\")", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{2}", " ") #20190111ef13 p2
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}", " ") #20190226ef2n dz  
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", " ") # 20190214ef28 02 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", " ") # 20190205ef23 b8
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190205ef23 b5 
text <- str_replace_all(text, "(\n\")", " ")
text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+\\s", " " ) 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190226ef2n e1 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190318ef3f b8  
text <- str_replace_all(text, "[0-9]{8}", " ") # 20190318
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}+\\s+\\s+\\s+", " ") #  ef3h gp  
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[A-Za-z]{1}+\\s+\\s+\\s+", " ") #  ef3f b6 
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef3f b6 
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef38 b5 

# så må man selvsagt splitt på nytt, håper de som kjører / tester scriptet mitt forstår det / GIDDER / har grunnleggende respekt nok til det selv om de har PhD liksom og jeg er en underdanig og et null i deres samlebåndsproduksjon
text_list <- str_split(text[1:4], pattern= "Document DLSVE") # str_split_fixed og n = X er tatt bort

substr(text_list[1], 1,4000)
substr(text_list[[3]], 1, 2000)

Matrise <- matrix(unlist(text_list))

library(tidyverse)
tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble

tekster
# A tibble: 222 x 1
# som forventet :)  отлишна!!

data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 1,
                       land = "Latvia",
                       rusetn = "høy", 
                       rusmors = "høy", 
                       rusaffek = 4, 
                       FFPfragile = "lav",
                       Russortod = "middels",
                       Plassering = 1,
                       tekst = "hel", 
                       tid = "Januar",
                       avis = "Vesti"), 
                  stringAsFactors = FALSE)


dataFF <- data[-c(14, 115, 222, 216), ] 

library(quanteda)
corpusVestiJanuar <- corpus(dataFF)  # inneholder 218, ikke 222. 
corpusVestiJanuar$documents$texts
docvars(corpusVestiJanuar)
summary(corpusVestiJanuar$documents$texts)
docvars(corpusVestiJanuar)
summary(corpusVestiJanuar)

#  lage nytt navn her så den ikke overskriver 
save(corpusVestiJanuar, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Vesti_Januar.rda")
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Vesti_Januar.rda")
setwd("~/Downloads/test/2019/Korpusnye")





                                    # FEBRUAR # 


# Liste opp filer fra mappe 
liste<- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Latvia/Vesti(3)/Februar"), 
                   full.names = TRUE)


# Bruker liste for å hente ut tekstene med pdf_text
Vesti <- lapply(liste[1], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 


#   lag dataframe 
Vestiframe <- do.call(rbind, Vesti)  # do call brukes for funksjon på liste, r bind radbinder listen
substr(Vestiframe$text[1], 1, 200) # teskt en, 200 ord - ikke nødvendig


# ta vekk withespace, samtidig lager vi tilfeldigvis om til character og ikke dataframe
library(stringr)

text <- str_trim(str_replace_all(Vestiframe$text,   "\\s+",  " "))


#forventet tekster
87+1
# [1] 88


# splitte sider
text_list <- str_split(text[1], pattern= "Document DLSVE") # str_split_fixed og n = X er tatt bort

# se på
substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)


### alt dette skal tas vekk ###
text <- str_replace_all(text, " .lv ", " ")
text <- str_replace_all(text, "(\")", " ")
# tatt vekk text <- str_replace_all(text, "\"+[а-яА-ЯёЁ]{1,10}", " ")
text <- str_replace_all(text, " .lv ", " ")
text <- str_replace_all(text, "(\")", " ")
text <- str_replace_all(text, "\"+[а-яА-ЯёЁ]{1,10}", " ")
text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source", " ")
text <- str_replace_all(text, "(Latvia, Russian Language)", " ")
text <- str_replace_all(text, "Or Nasha Gazeta", " ")
text <- str_replace_all(text, "Or Vesti segodnia", " ")
text <- str_replace_all(text, "Or Telegraf", " ")
text <- str_replace_all(text, "Or Lithuanian News Agency", " ")
text <- str_replace_all(text, "Or TVNET.lv", " ")
text <- str_replace_all(text, "Or Vesti Segodnya ", " ")
text <- str_replace_all(text, "- ELTA ", " ")
text <- str_replace_all(text, " Or 112.ua", " ")
text <- str_replace_all(text, " All Industries Region All Regions Language Russian", " ")
text <- str_replace_all(text, " News Filters Source:", "000")
text <- str_replace_all(text, " Nasha Gazeta", "000")
text <- str_replace_all(text, "Found 1,014 Timestamp 3 July 2019 7:39", " ")
text <- str_replace_all(text, "Page 110 of 110 © 2019 Factiva", " ")
text <- str_replace_all(text, "Inc. All rights reserved.", " ")
text <- str_replace_all(text, "Ukraine, Russian Language", " ")
text <- str_replace_all(text, " Delfi ", " ")
text <- str_replace_all(text, "Russian Language", " ")
text <- str_replace_all(text, "Inc. All rights reserved.", " ")
text <- str_replace_all(text, "000", " ")
text <- str_replace_all(text, "\\(+000+\\)", " ")
text <- str_replace_all(text, " Or Unian ", " ")
text <- str_replace_all(text, "\\(+\\s+\\)", " ")
text <- str_replace_all(text, " , ", " ")
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}", " ")
text <- str_replace_all(text, "© 2019 Factiva,", " ")
text <- str_replace_all(text, "[0-9]{1,3}+\\s+words", " ")
text <- str_replace_all(text, "[0-9]{1,3}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}", " ")
text <- str_replace_all(text, "Наша Газета NAGAZ", " ")
text <- str_replace_all(text, "21 Russian © 2019, ", " ")
text <- str_replace_all(text, " . DLS. All Rights Reserved", " ")
text <- str_replace_all(text, "DLS. All Rights Reserved", " ")
text <- str_replace_all(text, " All Industries Region All Regions Language Russian News Filters Source:", " ")
text <- str_replace_all(text, " Nasha Gazeta ", " ")
text <- str_replace_all(text, "  22    Фото:+\\s+[а-яА-ЯёЁ]{1,10}", " ")
text <- str_replace_all(text, "Фото:+\\s+[а-яА-ЯёЁ]{1,10}+(-)+[а-яА-ЯёЁ]{1,10}+", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[0-9]{2}", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[0-9]{1}+[A-Za-z]{1}", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{2}", " ")
text <- str_replace_all(text, "-+\\s+\\s+Results+\\s+Found+\\s+[0-9]{1}+\\,+[0-9]{3}", " ")
text <- str_replace_all(text, "Timestamp+\\s+\\s+[0-9]{1}+\\:+[0-9]{2}", " ")
text <- str_replace_all(text, "[0-9]{1}+\\s+Russian+\\s+\\s+Фото+\\:+\\s+printscreen", " ")
text <- str_replace_all(text, "[0-9]{1}+\\s+Russian", " ")
text <- str_replace_all(text, "Фото+\\:+\\s+[а-яА-ЯёЁ]{1,20}", " ")
text <- str_replace_all(text, "Фото+\\:+\\s+[а-яА-ЯёЁ]{1,20}+\\s+фото", " ")
text <- str_replace_all(text, "\\(+Estonia,  +\\)", " ")
text <- str_replace_all(text, " Date: ", " ")
text <- str_replace_all(text, "-         Results ", " ")
text <- str_replace_all(text, "  22 Russian", " ")
text <- str_replace_all(text, "© 2019+\\,", " ")
text <- str_replace_all(text, "ELTA (Russian Language) Or Unian (Ukraine, Russian Language) Or 112.ua (Ukraine, Russian Language)", " ")
text <- str_replace_all(text, "Author All Authors Company All Companies Subject Political/General News Industry", "000")
text <- str_replace_all(text, "All Industries Region All Regions Language Russian News Filters Source: Nasha Gazeta (Latvia, Russian Language)", " ")
text <- str_replace_all(text, "Date: 1 January 2019 - 31 December 2019 Page 109 of 110 © 2019 Factiva, Inc. All rights reserved. Results", " ")
text <- str_replace_all(text, "Found 1,014 Timestamp 3 July 2019 7:39 Page 110 of 110 © 2019 Factiva, Inc. All rights reserved", " ")
text <- str_replace_all(text, "00020190128ef1l00008 000 ", " ")
text <- str_replace_all(text, "Author All Authors Company All Companies", " ")
text <- str_replace_all(text, "Subject Political/General News Industry ", " ")
text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+\\s+\\s", " ")
text <- str_replace_all(text, "nasha.lv", " ")
text <- str_replace_all(text, "Фото+\\:+\\s+[A-Za-z]{1,10}+\\s+[A-Za-z]{1,10}", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", " ")
text <- str_replace_all(text, "Фото+\\:+\\s+[A-Za-z]{1,20}", " ")
text <- str_replace_all(text, " .lv ", " ")
text <- str_replace_all(text, "S00", " ")
text <- str_replace_all(text, " 000", " ")
text <- str_replace_all(text, " Vesti Segodnya", " ")
text <- str_replace_all(text, "Results Found+\\s+[0-9]{1,4}", " ")
text <- str_replace_all(text, "Вести сегодня DLSVES   (c) 2019. Vesti Segodnya, DLS. All rights reserved.", " ")
text <- str_replace_all(text, "DLSVES   (c) 2019. , DLS. All rights reserved. ", " ")
text <- str_replace_all(text, "Вести сегодня DLSVES", " ")
text <- str_replace_all(text, "\\(+c++\\)+\\s+2019+\\.+\\s+\\,+\\s+DLS. All rights reserved.", " ")
text <- str_replace_all(text, "    -  ", " ")
text <- str_replace_all(text, "       3    ", " ")
text <- str_replace_all(text, "\\s+\\s+\\s+3+\\s+\\s+", " ")
text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+", " ")
text <- str_replace_all(text, "1,        ", " " )

# så må man selvsagt splitt på nytt
text_list <- str_split(text[1], pattern= "Document DLSVE") # str_split_fixed og n = X er tatt bort

substr(text_list[1], 1,4000)
substr(text_list[[1]], 1, 2000)

Matrise <- matrix(unlist(text_list))

library(tidyverse)
tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble

tekster
# A tibble: 88 x 1


data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 1,
                       land = "Latvia",
                       rusetn = "høy", 
                       rusmors = "høy", 
                       rusaffek = 4, 
                       FFPfragile = "lav",
                       Russortod = "middels",
                       Plassering = 1,
                       tekst = "hel", 
                       tid = "Februar",
                       avis = "Vesti"), 
                  stringAsFactors = FALSE)

dataFF <- data[-c(88), ]  

library(quanteda)
corpusVestiFebruar <- corpus(dataFF) # 87 obs
corpusVestiFebruar$documents$texts
docvars(corpusVestiFebruar)
summary(corpusVestiFebruar$documents$texts)
docvars(corpusVestiFebruar)
summary(corpusVestiFebruar)

#  lage nytt navn her så den ikke overskriver 
save(corpusVestiFebruar, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Vesti_Februar.rda")
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Vesti_Februar.rda")





# MARS, APRIL = NULL.  Mangler Mars og April. 


                                           ## ### MAI ### ##
                                          # mai og juni er kun med ingress


# Liste opp filer fra mappe 
liste<- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Latvia/Vesti(3)/Mai ingress"), 
                   full.names = TRUE)


# Bruker liste for å hente ut tekstene med pdf_text
Vesti <- lapply(liste[1:28], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 


#   lag dataframe 
Vestiframe <- do.call(rbind, Vesti)  # do call brukes for funksjon på liste, r bind radbinder listen
substr(Vestiframe$text[1], 1, 200) # teskt en, 200 ord - ikke nødvendig


# ta vekk withespace, samtidig lager vi tilfeldigvis om til character og ikke dataframe
library(stringr)

text <- str_trim(str_replace_all(Vestiframe$text,   "\\s+",  " "))


#forventet antall tekster
(27*100)+35+28
# [1] 2763

# splitter sider med linjeshift går ikke, splitter dermed med noe annet.
# text_list <- str_split(text[1:28], "\n")  
text_list <- str_split(text[1:28], pattern= "Page+\\s+[0-9]{1,3}+\\s+of\\s+[0-9]{1,3}") # str_split_fixed og n = X er tatt bort

# se på
substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1, 4000)


### alt dette skal tas vekk ###

text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source", " ")
text <- str_replace_all(text, "(Latvia, Russian Language)", " ")
text <- str_replace_all(text, "Or Nasha Gazeta", " ")
text <- str_replace_all(text, "Or Vesti segodnia", " ")
text <- str_replace_all(text, "Or Telegraf", " ")
text <- str_replace_all(text, "Or Lithuanian News Agency", " ")
text <- str_replace_all(text, "Or TVNET.lv", " ")
text <- str_replace_all(text, "Or Vesti Segodnya ", " ")
text <- str_replace_all(text, "- ELTA ", " ")
text <- str_replace_all(text, " Or 112.ua", " ")
text <- str_replace_all(text, " All Industries Region All Regions Language Russian", " ")
text <- str_replace_all(text, " News Filters Source:", "000")
text <- str_replace_all(text, " Nasha Gazeta", "000")
text <- str_replace_all(text, "Found 1,014 Timestamp 3 July 2019 7:39", " ")
text <- str_replace_all(text, "Page 110 of 110 © 2019 Factiva", " ")
text <- str_replace_all(text, "Inc. All rights reserved.", " ")
text <- str_replace_all(text, "Ukraine, Russian Language", " ")
text <- str_replace_all(text, " Delfi ", " ")
text <- str_replace_all(text, "Russian Language", " ")
text <- str_replace_all(text, "Inc. All rights reserved.", " ") # viktig at er borte når jeg bruker dette for å splitte sider
text <- str_replace_all(text, "© 2019 Factiva,", " ")
text <- str_replace_all(text, "000", " ")
text <- str_replace_all(text, "\\(+000+\\)", " ")
text <- str_replace_all(text, " Or Unian ", " ")
text <- str_replace_all(text, "\\(+\\s+\\)", " ")
text <- str_replace_all(text, " , ", " ")
# text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}", " ") # VIKTIG AT uteblir, hvis ikke mister jeg nøkkelen for å splitte sidene her
text <- str_replace_all(text, "[0-9]{1,3}+\\s+words", " ")
text <- str_replace_all(text, "[0-9]{1,3}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}", " ")
text <- str_replace_all(text, "Наша Газета NAGAZ", " ")
text <- str_replace_all(text, "21 Russian © 2019, ", " ")
text <- str_replace_all(text, " . DLS. All Rights Reserved", " ")
text <- str_replace_all(text, "DLS. All Rights Reserved", " ")
text <- str_replace_all(text, " All Industries Region All Regions Language Russian News Filters Source:", " ")
text <- str_replace_all(text, " Nasha Gazeta ", " ")
text <- str_replace_all(text, "  22    Фото:+\\s+[а-яА-ЯёЁ]{1,10}", " ")
text <- str_replace_all(text, "Фото:+\\s+[а-яА-ЯёЁ]{1,10}+(-)+[а-яА-ЯёЁ]{1,10}+", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[0-9]{2}", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[0-9]{1}+[A-Za-z]{1}", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{2}", " ")
text <- str_replace_all(text, "-+\\s+\\s+Results+\\s+Found+\\s+[0-9]{1}+\\,+[0-9]{3}", " ")
text <- str_replace_all(text, "Timestamp+\\s+\\s+[0-9]{1}+\\:+[0-9]{2}", " ")
text <- str_replace_all(text, "[0-9]{1}+\\s+Russian+\\s+\\s+Фото+\\:+\\s+printscreen", " ")
text <- str_replace_all(text, "[0-9]{1}+\\s+Russian", " ")
text <- str_replace_all(text, "Фото+\\:+\\s+[а-яА-ЯёЁ]{1,20}", " ")
text <- str_replace_all(text, "Фото+\\:+\\s+[а-яА-ЯёЁ]{1,20}+\\s+фото", " ")
text <- str_replace_all(text, "\\(+Estonia,  +\\)", " ")
text <- str_replace_all(text, " Date: ", " ")
text <- str_replace_all(text, "-         Results ", " ")
text <- str_replace_all(text, "  22 Russian", " ")
text <- str_replace_all(text, "© 2019+\\,", " ")
text <- str_replace_all(text, "ELTA (Russian Language) Or Unian (Ukraine, Russian Language) Or 112.ua (Ukraine, Russian Language)", " ")
text <- str_replace_all(text, "Author All Authors Company All Companies Subject Political/General News Industry", "000")
text <- str_replace_all(text, "All Industries Region All Regions Language Russian News Filters Source: Nasha Gazeta (Latvia, Russian Language)", " ")
text <- str_replace_all(text, "Date: 1 January 2019 - 31 December 2019 Page 109 of 110 © 2019 Factiva, Inc. All rights reserved. Results", " ")
text <- str_replace_all(text, "Found 1,014 Timestamp 3 July 2019 7:39 Page 110 of 110 © 2019 Factiva, Inc. All rights reserved", " ")
text <- str_replace_all(text, "00020190128ef1l00008 000 ", " ")
text <- str_replace_all(text, "Author All Authors Company All Companies", " ")
text <- str_replace_all(text, "Subject Political/General News Industry ", " ")
text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+\\s+\\s", " ")
text <- str_replace_all(text, "nasha.lv", " ")
text <- str_replace_all(text, "Фото+\\:+\\s+[A-Za-z]{1,10}+\\s+[A-Za-z]{1,10}", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", " ")
text <- str_replace_all(text, "Фото+\\:+\\s+[A-Za-z]{1,20}", " ")
text <- str_replace_all(text, " .lv ", " ")
text <- str_replace_all(text, "S00", " ")
text <- str_replace_all(text, " 000", " ")
text <- str_replace_all(text, " Vesti Segodnya", " ")
text <- str_replace_all(text, "Results Found+\\s+[0-9]{1,4}", " ")
text <- str_replace_all(text, "Вести сегодня DLSVES   (c) 2019. Vesti Segodnya, DLS. All rights reserved.", " ")
text <- str_replace_all(text, "DLSVES   (c) 2019. , DLS. All rights reserved. ", " ")
text <- str_replace_all(text, "Вести сегодня DLSVES", " ")
text <- str_replace_all(text, "\\(+c++\\)+\\s+2019+\\.+\\s+\\,+\\s+DLS. All rights reserved.", " ")
text <- str_replace_all(text, "    -  ", " ")
text <- str_replace_all(text, "       3    ", " ")
text <- str_replace_all(text, "\\s+\\s+\\s+3+\\s+\\s+", " ")
text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+", " ")
text <- str_replace_all(text, "1,        ", " " )

text <- str_replace_all(text, "-     Timestamp  ", " " )
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " " )
text <- str_replace_all(text, " .lv ", " ")
text <- str_replace_all(text, "(\")", " ")
text <- str_replace_all(text, ",  ,  ,  ,", " " )



# så må man selvsagt splitt på nytt
text_list <- str_split(text[1:28], pattern= "Page+\\s+[0-9]{1,3}+\\s+of\\s+[0-9]{1,3}") # str_split_fixed og n = X er tatt bort

substr(text_list[1], 1,4000)
substr(text_list[[1]], 1, 2000)

Matrise <- matrix(unlist(text_list))


Matrise[c(101, 202, 303, 404, 505, 606, 707, 808, 909, 1010, 1111, 1212, 1313, 1414, 1515, 1616, 1717, 1818, 1919, 2020, 2121, 2222, 2323, 2424, 2525, 2626, 2727, 2763), ]


library(tidyverse)
tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble

tekster
# A tibble: 2,763 x 1

data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 1,
                       land = "Latvia",
                       rusetn = "høy", 
                       rusmors = "høy", 
                       rusaffek = 4, 
                       FFPfragile = "lav",
                       Russortod = "middels",
                       Plassering = 1,
                       tekst = "ingress", 
                       tid = "Mai",
                       avis = "Vesti"), 
                  stringAsFactors = FALSE)

dataFF <- data[-c(101, 202, 303, 404, 505, 606, 707, 808, 909, 1010, 1111, 1212, 1313, 1414, 1515, 1616, 1717, 1818, 1919, 2020, 2121, 2222, 2323, 2424, 2525, 2626, 2727, 2763), ]

library(quanteda)
corpusVestiMai <- corpus(dataFF)

corpusVestiMai$documents$texts
summary(corpusVestiMai$documents$texts)
summary(corpusVestiMai)
docvars(corpusVestiMai)

#  lage nytt navn her så den ikke overskriver 
save(corpusVestiMai, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Vesti_Mai.rda")
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Vesti_Mai.rda")





                                  ##### JUNI #####



# mai og juni er kun med ingress


# Liste opp filer fra mappe 
liste<- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Latvia/Vesti(3)/Juni ingress"), 
                   full.names = TRUE)


# Bruker liste for å hente ut tekstene med pdf_text
Vesti <- lapply(liste[1:31], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 


#   lag dataframe 
Vestiframe <- do.call(rbind, Vesti)  # do call brukes for funksjon på liste, r bind radbinder listen
substr(Vestiframe$text[1], 1, 200) # teskt en, 200 ord - ikke nødvendig


# ta vekk withespace, samtidig lager vi tilfeldigvis om til character og ikke dataframe
library(stringr)

text <- str_trim(str_replace_all(Vestiframe$text,   "\\s+",  " "))


#forventet antall tekster, alt + 31.  31 med tomt innhold, grunnet splitting av sider
(100*26)+26+75+62+99+26+31
# [1] 2919


text_list <- str_split(text[1:31], pattern= "Page+\\s+[0-9]{1,3}+\\s+of\\s+[0-9]{1,3}") # str_split_fixed og n = X er tatt bort

# se på
substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1, 4000)


### alt dette skal tas vekk ###
text <- str_replace_all(text, " .lv ", " ")
text <- str_replace_all(text, "(\")", " ")
# tatt vekk text <- str_replace_all(text, "\"+[а-яА-ЯёЁ]{1,10}", " ")
text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source", " ")
text <- str_replace_all(text, "(Latvia, Russian Language)", " ")
text <- str_replace_all(text, "Or Nasha Gazeta", " ")
text <- str_replace_all(text, "Or Vesti segodnia", " ")
text <- str_replace_all(text, "Or Telegraf", " ")
text <- str_replace_all(text, "Or Lithuanian News Agency", " ")
text <- str_replace_all(text, "Or TVNET.lv", " ")
text <- str_replace_all(text, "Or Vesti Segodnya ", " ")
text <- str_replace_all(text, "- ELTA ", " ")
text <- str_replace_all(text, " Or 112.ua", " ")
text <- str_replace_all(text, " All Industries Region All Regions Language Russian", " ")
text <- str_replace_all(text, " News Filters Source:", "000")
text <- str_replace_all(text, " Nasha Gazeta", "000")
text <- str_replace_all(text, "Found 1,014 Timestamp 3 July 2019 7:39", " ")
text <- str_replace_all(text, "Page 110 of 110 © 2019 Factiva", " ")
text <- str_replace_all(text, "Inc. All rights reserved.", " ")
text <- str_replace_all(text, "Ukraine, Russian Language", " ")
text <- str_replace_all(text, " Delfi ", " ")
text <- str_replace_all(text, "Russian Language", " ")
text <- str_replace_all(text, "Inc. All rights reserved.", " ") # viktig at er borte når jeg bruker dette for å splitte sider
text <- str_replace_all(text, "© 2019 Factiva,", " ")
text <- str_replace_all(text, "000", " ")
text <- str_replace_all(text, "\\(+000+\\)", " ")
text <- str_replace_all(text, " Or Unian ", " ")
text <- str_replace_all(text, "\\(+\\s+\\)", " ")
text <- str_replace_all(text, " , ", " ")
# text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}", " ") # VIKTIG AT uteblir, hvis ikke mister jeg nøkkelen for å splitte sidene her
text <- str_replace_all(text, "[0-9]{1,3}+\\s+words", " ")
text <- str_replace_all(text, "[0-9]{1,3}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}", " ")
text <- str_replace_all(text, "Наша Газета NAGAZ", " ")
text <- str_replace_all(text, "21 Russian © 2019, ", " ")
text <- str_replace_all(text, " . DLS. All Rights Reserved", " ")
text <- str_replace_all(text, "DLS. All Rights Reserved", " ")
text <- str_replace_all(text, " All Industries Region All Regions Language Russian News Filters Source:", " ")
text <- str_replace_all(text, " Nasha Gazeta ", " ")
text <- str_replace_all(text, "  22    Фото:+\\s+[а-яА-ЯёЁ]{1,10}", " ")
text <- str_replace_all(text, "Фото:+\\s+[а-яА-ЯёЁ]{1,10}+(-)+[а-яА-ЯёЁ]{1,10}+", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[0-9]{2}", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[0-9]{1}+[A-Za-z]{1}", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{2}", " ")
text <- str_replace_all(text, "-+\\s+\\s+Results+\\s+Found+\\s+[0-9]{1}+\\,+[0-9]{3}", " ")
text <- str_replace_all(text, "Timestamp+\\s+\\s+[0-9]{1}+\\:+[0-9]{2}", " ")
text <- str_replace_all(text, "[0-9]{1}+\\s+Russian+\\s+\\s+Фото+\\:+\\s+printscreen", " ")
text <- str_replace_all(text, "[0-9]{1}+\\s+Russian", " ")
text <- str_replace_all(text, "Фото+\\:+\\s+[а-яА-ЯёЁ]{1,20}", " ")
text <- str_replace_all(text, "Фото+\\:+\\s+[а-яА-ЯёЁ]{1,20}+\\s+фото", " ")
text <- str_replace_all(text, "\\(+Estonia,  +\\)", " ")
text <- str_replace_all(text, " Date: ", " ")
text <- str_replace_all(text, "-         Results ", " ")
text <- str_replace_all(text, "  22 Russian", " ")
text <- str_replace_all(text, "© 2019+\\,", " ")
text <- str_replace_all(text, "ELTA (Russian Language) Or Unian (Ukraine, Russian Language) Or 112.ua (Ukraine, Russian Language)", " ")
text <- str_replace_all(text, "Author All Authors Company All Companies Subject Political/General News Industry", "000")
text <- str_replace_all(text, "All Industries Region All Regions Language Russian News Filters Source: Nasha Gazeta (Latvia, Russian Language)", " ")
text <- str_replace_all(text, "Date: 1 January 2019 - 31 December 2019 Page 109 of 110 © 2019 Factiva, Inc. All rights reserved. Results", " ")
text <- str_replace_all(text, "Found 1,014 Timestamp 3 July 2019 7:39 Page 110 of 110 © 2019 Factiva, Inc. All rights reserved", " ")
text <- str_replace_all(text, "00020190128ef1l00008 000 ", " ")
text <- str_replace_all(text, "Author All Authors Company All Companies", " ")
text <- str_replace_all(text, "Subject Political/General News Industry ", " ")
text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+\\s+\\s", " ")
text <- str_replace_all(text, "nasha.lv", " ")
text <- str_replace_all(text, "Фото+\\:+\\s+[A-Za-z]{1,10}+\\s+[A-Za-z]{1,10}", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", " ")
text <- str_replace_all(text, "Фото+\\:+\\s+[A-Za-z]{1,20}", " ")
text <- str_replace_all(text, " .lv ", " ")
text <- str_replace_all(text, "S00", " ")
text <- str_replace_all(text, " 000", " ")
text <- str_replace_all(text, " Vesti Segodnya", " ")
text <- str_replace_all(text, "Results Found+\\s+[0-9]{1,4}", " ")
text <- str_replace_all(text, "Вести сегодня DLSVES   (c) 2019. Vesti Segodnya, DLS. All rights reserved.", " ")
text <- str_replace_all(text, "DLSVES   (c) 2019. , DLS. All rights reserved. ", " ")
text <- str_replace_all(text, "Вести сегодня DLSVES", " ")
text <- str_replace_all(text, "\\(+c++\\)+\\s+2019+\\.+\\s+\\,+\\s+DLS. All rights reserved.", " ")
text <- str_replace_all(text, "    -  ", " ")
text <- str_replace_all(text, "       3    ", " ")
text <- str_replace_all(text, "\\s+\\s+\\s+3+\\s+\\s+", " ")
text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+", " ")
text <- str_replace_all(text, "1,        ", " " )
text <- str_replace_all(text, "Search Summary Text Date 06/01/2019 to 06/30/2019 Source Vesti segodnia", " " )
text <- str_replace_all(text, "All Industries Region All Regions Language All Languages News Filters ", " " )
text <- str_replace_all(text, "-     Timestamp  ", " " )
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " " )
text <- str_replace_all(text, ",  ,", " " )
text <- str_replace_all(text, "\\(+Russian+\\)", " " ) 
text <- str_replace_all(text, "��", " ") 

# så må man selvsagt splitt på nytt
text_list <- str_split(text[1:31], pattern= "Page+\\s+[0-9]{1,3}+\\s+of\\s+[0-9]{1,3}") # str_split_fixed og n = X er tatt bort

substr(text_list[1], 1,4000)
substr(text_list[[5]], 1, 2000)

Matrise <- matrix(unlist(text_list))

Matrise[c(101, 128, 229, 330, 431, 532, 633, 733, 834, 935, 1036, 1137, 1200, 1301, 1402, 1503, 1604, 1705,  1806, 1907, 2008, 2109,  2286, 2488, 2387, 2589, 2690, 2791, 2919, 2892), ]


library(tidyverse)
tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble

tekster
# A tibble: 2,919 x 1


data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 1,
                       land = "Latvia",
                       rusetn = "høy", 
                       rusmors = "høy", 
                       rusaffek = 4, 
                       FFPfragile = "lav",
                       Russortod = "middels",
                       Plassering = 1,
                       tekst = "ingress", 
                       tid = "Juni",
                       avis = "Vesti"), 
                  stringAsFactors = FALSE)

dataFF <- data[-c(101, 128, 229, 330, 431, 532, 633, 733, 834, 935, 1036, 1137, 1200, 1301, 1402, 1503, 1604, 1705, 1806, 1907, 2008, 2109, 2286, 2387, 2488, 2589, 2690, 2791, 2892, 2919), ]

# A tibble: 2,889 x 12

library(quanteda)
corpusVestiJuni <- corpus(dataFF)

corpusVestiJuni$documents$texts
summary(corpusVestiJuni$documents$texts)
summary(corpusVestiJuni)
docvars(corpusVestiJuni)

#  lage nytt navn her så den ikke overskriver 
save(corpusVestiJuni, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Vesti_Juni.rda")
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Vesti_Juni.rda")










                                                #
                                                 ##      #
                                                 ###     # #
                                                #    #  #   ##    #
                                               ##     ##     ### #
                                            
                             ####     ###     ##### Mixnews ####    ###    ####

                                       

# Mixnews har Factiva bare tilgjengelig overskrift og ingress. 
# Når man klikker på artikkeformat får man fortsatt bare opp overskrift og ingress. 
# Jeg må ta utganspunkt i den dataen vi har tilgjengelig, men med forbehold om at dette kun er ingress. 
# Mye taler for å fortsatt kun benytte dette som datamateriale. (spør martin om obama08valget og datamaterialet vi brukte der - de sa 50 ord holdt )
# Ingresser er benyttet i andre analyser. Jeg måler også effekten av ingressn mot hel artikkel. 



# kun April og Mai med tilstrekkelig data





                                          ###### APRIL ######


# Liste opp filer fra mappe
liste <- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Latvia/mixNews/April"), 
                    full.names = TRUE)

library(pdftools)


# Bruker liste for å hente ut tekstene med pdf_text
MixNews <- lapply(liste[1:8], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 


#   lag dataframe 
MixNewsframe <- do.call(rbind, MixNews)  # do call brukes for funksjon på liste, r bind radbinder listen
substr(MixNewsframe$text[1], 1, 200) # teskt en, 200 ord - ikke nødvendig


# ta vekk withespace
# samtidig lager tilfeldigvis om til character og ikke dataframe
library(stringr)



#først lage teksten
text <- str_trim(str_replace_all(MixNewsframe$text,   "\\s+",  " "))  


                             #  FJERNE TEKST #



text <- str_replace_all(text, "[0-9]{4}+,", "") 
text <- str_replace_all(text," [0-9]+[0-9]+:+[0-9]+[0-9],", "") 
text <- str_replace_all(text, "mixnews.lv,", "") 
text <- str_replace_all(text, "[0-9]+\\s+January", "")  
text <- str_replace_all(text, "[0-9]+\\s+February", "")  
text <- str_replace_all(text, "[0-9]+\\s+March", "")  
text <- str_replace_all(text, "[0-9]+\\s+April", "")  
text <- str_replace_all(text, "[0-9]+\\s+May", "")  
text <- str_replace_all(text, "[0-9]+\\s+June", "")  
text <- str_replace_all(text, "[0-9]+\\s+July", "")  
text <- str_replace_all(text, "[0-9]{2,3}+\\s+words,", "") #14 ou 149 words
text <- str_replace_all(text, "[0-9]{2}+\\s+words,", "") #14 words,
text <- str_replace_all(text, "(Russian)", "")  
text <- str_replace_all(text, "\\(+\\)", "") 
text <- str_replace_all(text, "\\s+\\(+\\)+\\s", "") 
text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source mixnews.lv", "")
text <- str_replace_all(text, "Author All Authors Company All Companies Subject Political/General News", "")
text <- str_replace_all(text, "Industry All Industries Region All Regions Language Russian News", "")
text <- str_replace_all(text, "Filters Date: 1 January  - 31 December  Results Found 912 Timestamp", "") 
text<- str_replace_all(text, "News Filters Date:  2019 - 31 December 2019 Results Found 912 Timestamp", "")
text<- str_replace_all(text, "Industry All Industries Region All RegionsNews Filters", "")
text<- str_replace_all(text, "Industry All Industries Region All Regions    2019  ", "")
text<- str_replace_all(text, "Date:2019 - 31 December 2019 ", "")
text<- str_replace_all(text, "Results Found 912 Timestamp2019 ", "")
text <- str_replace_all(text, "Page [0-9]+ of [0-9]+ © 2019 Factiva,", "")
text <- str_replace_all(text, "( Language)", "")
text <- str_replace_all(text,"[0-9]+[0-9]+:+[0-9]+[0-9]", "") # 09:52 etc 
text <- str_replace_all(text," [0-9]+[0-9]+:+[0-9]+[0-9]", "") #" 07:32 
text <- str_replace_all(text,",", ", ")      # ,  ,*[]
text <- str_replace_all(text,",  ", ", ")      # ,  ,*[] 
text <- str_replace_all(text," , ", "")      # ,  ,*[]   # alt med et mellomrom foran komma tas vekk 
text <- str_replace_all(text,"ЛАТВИЯ", "") #ЛАТВИЯ
text <- str_replace_all(text," ЛАТВИЯ", "")# ЛАТВИЯ
text <- str_replace_all(text,"В МИРЕ", "") # В МИРЕ
text <- str_replace_all(text,"ЭКСКЛЮЗИВ", "") # ЭКСКЛЮЗИВ
text <- str_replace_all(text," ЭКСКЛЮЗИВ", "") #ЭКСКЛЮЗИВО
text <- str_replace_all(text,"RIGATV24", "") #RIGATV24
text <- str_replace_all(text, "ЧПФОТО", "") #ЧПФОТО
text <- str_replace_all(text, "ОНЛАЙН", "") #ОНЛАЙН

text <- str_replace_all(text, " .lv ", " ")
text <- str_replace_all(text, "(\")", " ")
# tatt vekk text <- str_replace_all(text, "\"+[а-яА-ЯёЁ]{1,10}", " ")


# Viktig at sidene splittes med Inc, fordi side 85 i dokument 7 (her) og 6 i mappen, har en ekstrea "All rights reserved". 
text_list <- str_split(text[1:8], pattern= "Inc. All rights reserved.")

substr(text_list[[7]], 1, 700)
substr(text_list[1], 1, 700)  # se på doc no, 700 tegn

Matrise <- matrix(unlist(text_list))  # sjekket i matrisen vel

library(tidyverse)

tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble

#forventet antall tekster, alt + 8 (pdf-dokumenter)
(6*100)+82+39+8
# [1] 729

tekster
# 729 x 1


data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 1,
                       land = "Latvia",
                       rusetn = "høy", 
                       rusmors = "høy", 
                       rusaffek = 4, 
                       FFPfragile = "lav",
                       Russortod = "middels",
                       Plassering = 2,
                       tekst = "ingress", 
                       tid = "April",
                       avis = "MixNews"), 
                  stringAsFactors = FALSE)

dataFF <- data[-c(83, 184, 285, 386, 487, 558, 689, 729), ]   # 721 obs


library(quanteda)
corpusMixNews <- corpus(dataFF)
corpusMixNews$documents$texts
docvars(corpusMixNews)
summary(corpusMixNews)

# ekstremt viktig å lage nytt navn her
save(corpusMixNews, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Mixnews_April.rda")
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Mixnews_April.rda")






###### MAI ######


# Liste opp filer fra mappe
liste <- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Latvia/mixNews/Mai"), 
                    full.names = TRUE)

library(pdftools)


# Bruker liste for å hente ut tekstene med pdf_text
MixNews <- lapply(liste[1:3], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 


#   lag dataframe 
MixNewsframe <- do.call(rbind, MixNews)  # do call brukes for funksjon på liste, r bind radbinder listen
substr(MixNewsframe$text[1], 1, 200) # teskt en, 200 ord - ikke nødvendig


# ta vekk withespace
# samtidig lager tilfeldigvis om til character og ikke dataframe
library(stringr)



#først lage teksten
text <- str_trim(str_replace_all(MixNewsframe$text,   "\\s+",  " "))  


#  FJERNE TEKST #

text <- str_replace_all(text, "[0-9]{4}+,", "") 
text <- str_replace_all(text," [0-9]+[0-9]+:+[0-9]+[0-9],", "") 
text <- str_replace_all(text, "mixnews.lv,", "") 
text <- str_replace_all(text, "[0-9]+\\s+January", "")  
text <- str_replace_all(text, "[0-9]+\\s+February", "")  
text <- str_replace_all(text, "[0-9]+\\s+March", "")  
text <- str_replace_all(text, "[0-9]+\\s+April", "")  
text <- str_replace_all(text, "[0-9]+\\s+May", "")  
text <- str_replace_all(text, "[0-9]+\\s+June", "")  
text <- str_replace_all(text, "[0-9]+\\s+July", "")  
text <- str_replace_all(text, "[0-9]{2,3}+\\s+words,", "") #14 ou 149 words
text <- str_replace_all(text, "[0-9]{2}+\\s+words,", "") #14 words,
text <- str_replace_all(text, "(Russian)", "")  
text <- str_replace_all(text, "\\(+\\)", "") 
text <- str_replace_all(text, "\\s+\\(+\\)+\\s", "") 
text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source mixnews.lv", "")
text <- str_replace_all(text, "Author All Authors Company All Companies Subject Political/General News", "")
text <- str_replace_all(text, "Industry All Industries Region All Regions Language Russian News", "")
text <- str_replace_all(text, "Filters Date: 1 January  - 31 December  Results Found 912 Timestamp", "") 
text<- str_replace_all(text, "News Filters Date:  2019 - 31 December 2019 Results Found 912 Timestamp", "")
text<- str_replace_all(text, "Industry All Industries Region All RegionsNews Filters", "")
text<- str_replace_all(text, "Industry All Industries Region All Regions    2019  ", "")
text<- str_replace_all(text, "Date:2019 - 31 December 2019 ", "")
text<- str_replace_all(text, "Results Found 912 Timestamp2019 ", "")
text <- str_replace_all(text, "Page [0-9]+ of [0-9]+ © 2019 Factiva,", "")
text <- str_replace_all(text, "( Language)", "")
text <- str_replace_all(text,"[0-9]+[0-9]+:+[0-9]+[0-9]", "") # 09:52 etc 
text <- str_replace_all(text," [0-9]+[0-9]+:+[0-9]+[0-9]", "") #" 07:32 
text <- str_replace_all(text,",", ", ")      # ,  ,*[]
text <- str_replace_all(text,",  ", ", ")      # ,  ,*[] 
text <- str_replace_all(text," , ", "")      # ,  ,*[]   # alt med et mellomrom foran komma tas vekk 
text <- str_replace_all(text,"ЛАТВИЯ", "") #ЛАТВИЯ
text <- str_replace_all(text," ЛАТВИЯ", "")# ЛАТВИЯ
text <- str_replace_all(text,"В МИРЕ", "") # В МИРЕ
text <- str_replace_all(text,"ЭКСКЛЮЗИВ", "") # ЭКСКЛЮЗИВ
text <- str_replace_all(text," ЭКСКЛЮЗИВ", "") #ЭКСКЛЮЗИВО
text <- str_replace_all(text,"RIGATV24", "") #RIGATV24
text <- str_replace_all(text, "ЧПФОТО", "") #ЧПФОТО
text <- str_replace_all(text, "ОНЛАЙН", "") #ОНЛАЙН
text <- str_replace_all(text, "Search Summary Text mixnews Date In the last 5 years Source mixnews.lv ()", "") 
text <- str_replace_all(text, "Industry All Industries Region All Regions Alls ", "") 
text <- str_replace_all(text, "News Filters Date:  2019 - 31 December 2019 Results ", "") 
text <- str_replace_all(text, "Found 29 Timestamp 8 August 2019 9:2", "") 
text <- str_replace_all(text, "News Filters Date:  2019 -  2019 Results Found 29 Timestamp 8 August 2019 9:18", "") 
text <- str_replace_all(text, "Search Summary Text mixnews Date In the last 6 months Source mixnews.lv ()", "") 
text <- str_replace_all(text, "Industry All Industries Region All Regions    2019", "") 
text <- str_replace_all(text, " .lv ", " ")
text <- str_replace_all(text, "(\")", " ")
# tatt vekk text <- str_replace_all(text, "\"+[а-яА-ЯёЁ]{1,10}", " ")





# Viktig at sidene splittes med Inc, fordi side 85 i dokument 7 (her) og 6 i mappen, har en ekstrea "All rights reserved". 
text_list <- str_split(text[1:3], pattern= "Inc. All rights reserved.")

substr(text_list[[1]], 1, 700)
substr(text_list[1], 1, 700)  # se på doc no, 700 tegn


Matrise <- matrix(unlist(text_list))

library(tidyverse)

tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble

#forventet antall tekster + 3
80+14+29+3
# [1] 126

tekster
# A tibble: 126 x 1

data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 1,
                       land = "Latvia",
                       rusetn = "høy", 
                       rusmors = "høy", 
                       rusaffek = 4, 
                       FFPfragile = "lav",
                       Russortod = "middels",
                       Plassering = 2,
                       tekst = "ingress", 
                       tid = "Mai",
                       avis = "MixNews"), 
                  stringAsFactors = FALSE)

dataFF <- data[-c(81, 111, 126), ]  
Matrise[c(81, 111, 126), ] # test

library(quanteda)
corpusMixNews <- corpus(dataFF)
corpusMixNews$documents$texts
docvars(corpusMixNews)
summary(corpusMixNews)

# ekstremt viktig å lage nytt navn her
save(corpusMixNews, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Mixnews_Mai.rda")
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_Mixnews_Mai.rda")








          
                                                ##################
                                    ################ ESTLAND ####################
                                              ## ############### ##
                                                       ###
  



                                         
                                        # ################### #

                                            #   #    #   ##
                                           # # # #   ###
                                          #  ##  #   #  #
                                         #       #   #   # #

                                        ######## MK.ee #######
                      
                                          # Kreml-assosiert#


                        # MK har Factiva bare tilgjengelig overskrift og ingress





                                        ###    # APRIL #   ###

                        library(rvest)   




setwd("~/Downloads/test/2019/Estland")

# laste inn MK

liste<- list.files(paste0("~/Downloads/test/2019/Estland/MK/April"), 
                   full.names = TRUE)


# Bruker liste for å hente ut tekstene med pdf_text
MK <- lapply(liste[1:4], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 




##########   lag dataframe   ###########

### MKframe #### radbinde i et frame
MKframe <- do.call(rbind, MK)  # do call brukes for funksjon på liste, r bind radbinder listen
substr(MKframe$text[1], 1, 200) # teskt en, 200 ord - ikke nødvendig


library(stringr)

text <- str_trim(str_replace_all(MKframe$text,   "\\s+",  " ")) 


# splitte tekst
text_list <- str_split(text[1:4], pattern= "Inc. All rights reserved.") 

# se på tekst
substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn


#########Fjerne ting############

#МК Эстония+,+\\s+[0-9]{2}+\\:+[0-9]{2}+,+\\s+[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}+,+\\s+[0-9]{2,3}+\\s+words+,+\\s+(Russian)+\\s+©Читатель+\\s+\МК-Эстонии\
text <- str_replace_all(text, "МК Эстония", "") 
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}+\\,", "") 
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}+,", "") 
text <- str_replace_all(text, "[0-9]{2,3}+\\s+words,", "") 
text <- str_replace_all(text, "\\(+Russian+\\)", "") 
text <- str_replace_all(text, "©Читатель", "")
text <- str_replace_all(text, "МК Эстония,", "")
text <- str_replace_all(text, "(\"\")", "")
text <- str_replace_all(text, "     ", "")
text <- str_replace_all(text, " ,", "")
#7 July 2019 14:08
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}", " ")
text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source mke.ee", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "Or Delfi ", " ")
text <- str_replace_all(text, "Or Postimees", " ")
text <- str_replace_all(text, "Author All Authors Company", " ")
text <- str_replace_all(text, "All Companies Subject Political ", " ")
text <- str_replace_all(text, "General News Industry All Industries Region All Regions Language", " ")
text <- str_replace_all(text, "Russian News Filters Source: mke.ee", " ")
text <- str_replace_all(text, "Results Found 838 Timestamp", " ")
text <- str_replace_all(text, "All Companies Subject Political", "")
text <- str_replace_all(text, "14:08", " ")

text <- str_replace_all(text, "[0-9]{1,3}+\\:+[0-9]{2}", " ")
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}", " ")
text <- str_replace_all(text, "© 2019 Factiva,", " ")

text <- str_replace_all(text, " .lv ", " ")
text <- str_replace_all(text, "(\")", " ")
# tatt vekk text <- str_replace_all(text, "\"+[а-яА-ЯёЁ]{1,10}", " ")
text <- str_replace_all(text, "( \", \n\") ", " ")

# Nytt
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " " )
text <- str_replace_all(text, "(\")", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{2}", " ") #20190111ef13 p2
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}", " ") #20190226ef2n dz  
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", " ") # 20190214ef28 02 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", " ") # 20190205ef23 b8
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190205ef23 b5 
text <- str_replace_all(text, "(\n\")", " ")
text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+\\s", " " ) 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190226ef2n e1 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190318ef3f b8  
text <- str_replace_all(text, "[0-9]{8}", " ") # 20190318
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}+\\s+\\s+\\s+", " ") #  ef3h gp  
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[A-Za-z]{1}+\\s+\\s+\\s+", " ") #  ef3f b6 
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef3f b6 
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef38 b5 

text <- str_replace_all(text, "��", " ") 


text_list <- str_split(text[1:4], pattern= "Inc. All rights reserved.") 

# se her på teksten etterpå
substr(text_list[[4]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn


Matrise <- matrix(unlist(text_list))

# lage tibble 
library(tidyverse)

tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble

#forventet antall tekster + 3
100+100+29+19+4
# [1] 252

tekster
# A tibble: 252 x 1



##### lage variabler #####


data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 1,
                       land = "Estland",
                       rusetn = "høy", 
                       rusmors = "høy", 
                       rusaffek = 2, 
                       FFPfragile = "lav",
                       Russortod = "middels",
                       Plassering = 2,
                       tekst = "ingress", 
                       tid = "April",
                       avis = "MK"), 
                  stringAsFactors = FALSE)


dataFF <- data[-c(20, 121, 222, 252), ] 

library(quanteda)
corpusMK <- corpus(dataFF) 
corpusMK$documents$texts
docvars(corpusMK)
summary(corpusMK)

save(corpusMK, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_MK_April.rda")
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_MK_April.rda")




                                                  #### MAI ####



library(rvest)   


setwd("~/Downloads/test/2019/Estland")

# laste inn MK

liste<- list.files(paste0("~/Downloads/test/2019/Estland/MK/Mai"), 
                   full.names = TRUE)


# Bruker liste for å hente ut tekstene med pdf_text
MK <- lapply(liste[1:3], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 




##########   lag dataframe   ###########

### MKframe #### radbinde i et frame
MKframe <- do.call(rbind, MK)  # do call brukes for funksjon på liste, r bind radbinder listen
substr(MKframe$text[1], 1, 200) # teskt en, 200 ord - ikke nødvendig

library(stringr)

text <- str_trim(str_replace_all(MKframe$text,   "\\s+",  " ")) 


# splitte tekst
text_list <- str_split(text[1:3], pattern= "Inc. All rights reserved.") 

# se på tekst
substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn


#########Fjerne ting############
text <- str_replace_all(text, "МК Эстония", "") 
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}+\\,", "") 
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}+,", "") 
text <- str_replace_all(text, "[0-9]{2,3}+\\s+words,", "") 
text <- str_replace_all(text, "\\(+Russian+\\)", "") 
text <- str_replace_all(text, "©Читатель", "")
text <- str_replace_all(text, "МК Эстония,", "")
text <- str_replace_all(text, "(\"\")", "")
text <- str_replace_all(text, "     ", "")
text <- str_replace_all(text, " ,", "")
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}", " ")
text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source mke.ee", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "Or Delfi ", " ")
text <- str_replace_all(text, "Or Postimees", " ")
text <- str_replace_all(text, "Author All Authors Company", " ")
text <- str_replace_all(text, "All Companies Subject Political ", " ")
text <- str_replace_all(text, "General News Industry All Industries Region All Regions Language", " ")
text <- str_replace_all(text, "Russian News Filters Source: mke.ee", " ")
text <- str_replace_all(text, "Results Found 838 Timestamp", " ")
text <- str_replace_all(text, "All Companies Subject Political", "")
text <- str_replace_all(text, "14:08", " ")

text <- str_replace_all(text, "[0-9]{1,3}+\\:+[0-9]{2}", " ")
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}", " ")
text <- str_replace_all(text, "© 2019 Factiva,", " ")

text <- str_replace_all(text, " .lv ", " ")
text <- str_replace_all(text, "(\")", " ")
# tatt vekk text <- str_replace_all(text, "\"+[а-яА-ЯёЁ]{1,10}", " ")

# Nytt
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " " )
text <- str_replace_all(text, "(\")", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{2}", " ") #20190111ef13 p2
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}", " ") #20190226ef2n dz  
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", " ") # 20190214ef28 02 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", " ") # 20190205ef23 b8
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190205ef23 b5 
text <- str_replace_all(text, "(\n\")", " ")
text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+\\s", " " ) 
text <- str_replace_all(text, "\\s+\\s+[0-9]{1}+\\s+\\s", " " ) 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190226ef2n e1 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190318ef3f b8  
text <- str_replace_all(text, "[0-9]{8}", " ") # 20190318
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}+\\s+\\s+\\s+", " ") #  ef3h gp  
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[A-Za-z]{1}+\\s+\\s+\\s+", " ") #  ef3f b6 
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef3f b6 
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef38 b5 
text <- str_replace_all(text, "��", " ") 
text <- str_replace_all(text, "(\n\")", " ")

text_list <- str_split(text[1:3], pattern= "Inc. All rights reserved.") 

# se her på teksten etterpå
substr(text_list[[3]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn

Matrise <- matrix(unlist(text_list))

# lage tibble 
library(tidyverse)
tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble

#forventet antall tekster + 3
81+100+83+  # [1] 267
tekster  #  A tibble: 267 x 1

##### lage variabler #####

data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 1,
                       land = "Estland",
                       rusetn = "høy", 
                       rusmors = "høy", 
                       rusaffek = 2, 
                       FFPfragile = "lav",
                       Russortod = "middels",
                       Plassering = 2,
                       tekst = "ingress", 
                       tid = "Mai",
                       avis = "MK"), 
                  stringAsFactors = FALSE)

dataFF <- data[-c(267, 185, 84), ] # ta ut de rare, fra matrixen (Matrise)  (Kan bruke data også, men den er større og tar lengre tid å laste)

library(quanteda)
corpusMK <- corpus(dataFF)
corpusMK$documents$texts
docvars(corpusMK)
summary(corpusMK)

save(corpusMK, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_MK_Mai.rda")
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_MK_Mai.rda")




                                                  ### JUNI #### 




library(rvest)   


setwd("~/Downloads/test/2019/Estland")

# laste inn MK

liste<- list.files(paste0("~/Downloads/test/2019/Estland/MK/Juni"), 
                   full.names = TRUE)


# Bruker liste for å hente ut tekstene med pdf_text
MK <- lapply(liste[1:3], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 


##########   lag dataframe   ###########

### MKframe #### radbinde i et frame
MKframe <- do.call(rbind, MK)  # do call brukes for funksjon på liste, r bind radbinder listen
substr(MKframe$text[1], 1, 200) # teskt en, 200 ord - ikke nødvendig

library(stringr)

text <- str_trim(str_replace_all(MKframe$text,   "\\s+",  " ")) 


# splitte tekst
text_list <- str_split(text[1:3], pattern= "Inc. All rights reserved.") 

# se på tekst
substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn


#########Fjerne ting############
text <- str_replace_all(text, "МК Эстония", "") 
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}+\\,", "") 
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}+,", "") 
text <- str_replace_all(text, "[0-9]{2,3}+\\s+words,", "") 
text <- str_replace_all(text, "\\(+Russian+\\)", "") 
text <- str_replace_all(text, "©Читатель", "")
text <- str_replace_all(text, "МК Эстония,", "")
text <- str_replace_all(text, "(\"\")", "")
text <- str_replace_all(text, "     ", "")
text <- str_replace_all(text, " ,", "")
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}", " ")
text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source mke.ee", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "Or Delfi ", " ")
text <- str_replace_all(text, "Or Postimees", " ")
text <- str_replace_all(text, "Author All Authors Company", " ")
text <- str_replace_all(text, "All Companies Subject Political ", " ")
text <- str_replace_all(text, "General News Industry All Industries Region All Regions Language", " ")
text <- str_replace_all(text, "Russian News Filters Source: mke.ee", " ")
text <- str_replace_all(text, "Results Found 838 Timestamp", " ")
text <- str_replace_all(text, "All Companies Subject Political", "")
text <- str_replace_all(text, "14:08", " ")

text <- str_replace_all(text, "[0-9]{1,3}+\\:+[0-9]{2}", " ")
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}", " ")
text <- str_replace_all(text, "© 2019 Factiva,", " ")
text <- str_replace_all(text, " .lv ", " ")
text <- str_replace_all(text, "(\")", " ")
# tatt vekk text <- str_replace_all(text, "\"+[а-яА-ЯёЁ]{1,10}", " ")

# Nytt
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " " )
text <- str_replace_all(text, "(\")", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{2}", " ") #20190111ef13 p2
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}", " ") #20190226ef2n dz  
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", " ") # 20190214ef28 02 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", " ") # 20190205ef23 b8
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190205ef23 b5 
text <- str_replace_all(text, "(\n\")", " ")
text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+\\s", " " ) 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190226ef2n e1 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190318ef3f b8  
text <- str_replace_all(text, "[0-9]{8}", " ") # 20190318
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}+\\s+\\s+\\s+", " ") #  ef3h gp  
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[A-Za-z]{1}+\\s+\\s+\\s+", " ") #  ef3f b6 
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef3f b6 
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef38 b5 
text <- str_replace_all(text, "\\s+\\s+[0-9]{1}+\\s+\\s", " " ) 
text <- str_replace_all(text, "��", " ") 
text <- str_replace_all(text, "(\n\")", " ")


text_list <- str_split(text[1:3], pattern= "Inc. All rights reserved.") 

# se her på teksten etterpå
substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn

# trenger ikke lage egen matrix mes å då lister, for å sjekke. Kan gjøre det i "data"-matrix. 
# lage tibble 

library(tidyverse)

tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble

#forventet antall tekster + 3
100+100+17+3 # [1] 220

tekster #  A tibble: 220 x 1


##### lage variabler #####

data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 1,
                       land = "Estland",
                       rusetn = "høy", 
                       rusmors = "høy", 
                       rusaffek = 2, 
                       FFPfragile = "lav",
                       Russortod = "middels",
                       Plassering = 2,
                       tekst = "ingress", 
                       tid = "Juni",
                       avis = "MK"), 
                  stringAsFactors = FALSE)

dataFF <- data[-c(101, 202, 220), ]     # sjekket "data", fordi  er lite å laste inn når det er så få lister

library(quanteda)
corpusMK <- corpus(dataFF)
corpusMK$documents$texts
docvars(corpusMK)
summary(corpusMK)

save(corpusMK, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_MK_Juni.rda")
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_MK_Juni.rda")








                            #### # #
                            ##     ###       
                            ##      ###
                            ##      ###
                            ##     ##
                            ## ## # 


                        ##### Delfi #####
                        # IKKE Kreml-basert # 
                        # Delfi har Factiva bare tilgjengelig overskrift og ingress
                        
                        
                        
                   ##########    APRIL    ###########
setwd("~/Downloads/test/2019/Estland/Delfi (2)/")

# laste inn MK

liste<- list.files(paste0("~/Downloads/test/2019/Estland/Delfi (2)/April"), 
                   full.names = TRUE)


# Bruker liste for å hente ut tekstene med pdf_text
Delfi <- lapply(liste[1:4], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 




                                      ############   lag dataframe   ###########

### MKframe #### radbinde i et frame
Delfiframe <- do.call(rbind, Delfi)  # do call brukes for funksjon på liste, r bind radbinder listen
substr(Delfiframe$text[1], 1, 200) # teskt en, 200 ord - ikke nødvendig



                                      ############ LAGE TEKSTEN OG FJERNE TEKST #########
library(stringr)
# samtidig lager tilfeldigvis om til character og ikke dataframe

#først plukke ut tekstvariabelen på (data)framen og kalle den text, samtidig fjerne whitespace
text <- str_trim(str_replace_all(Delfiframe$text,   "\\s+",  " ")) 


# splitte tekst
text_list <- str_split(text[1:4], pattern= "All rights reserved.") # eller /n ?? ved linjeshift

# se på tekst
substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn


#########Fjerne ting############
# Delfi, 03:26, 29 June 2019, 39 words, (Russian)
# Page 3 of 100 © 2019 Factiva, In
# \\\"Tenet\\\" 
# Page 99 of 100 © 2019 Factiva, Inc. " 

text <- str_replace_all(text, "Delfi,", "") 
text <- str_replace_all(text, "(\\\"Tenet\\\")", "") 
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}+\\,", "") #kl.slett
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}+,", "")  # dato
text <- str_replace_all(text, "[0-9]{2,3}+\\s+words,", "") #antall ord
text <- str_replace_all(text, "\\(+Russian+\\)", "") 
#text <- str_replace_all(text, "(\"\")", "")
#text <- str_replace_all(text, "     ", "")
#text <- str_replace_all(text, " ,", "")
#text <- str_replace_all(text, "[A-Za-z]+\\.+ru.+\\s+Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}+\\s+©+\\s+2019+\\s+Factiva, Inc.", "")
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}+\\s+©+\\s+2019+\\s+Factiva,+\\s+Inc", "")

text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}", " ")
text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source mke.ee", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "Or Delfi ", " ")
text <- str_replace_all(text, "Or Postimees", " ")
text <- str_replace_all(text, "Author All Authors Company", " ")
text <- str_replace_all(text, "All Companies Subject Political ", " ")
text <- str_replace_all(text, "General News Industry All Industries Region All Regions Language", " ")
text <- str_replace_all(text, "Russian News Filters Source: Delfi", " ")
text <- str_replace_all(text, "Results Found 838 Timestamp", " ")
text <- str_replace_all(text, "All Companies Subject Political", "")
text <- str_replace_all(text, "14:08", " ")
text <- str_replace_all(text, "Results Found 1,119 Timestamp   14:46", " ")
text <- str_replace_all(text, "Results Found 1,119 Timestamp   15:04", " ")


#nytt 
text <- str_replace_all(text, "Results Found 1,119 Timestamp   14:46", " ")
text <- str_replace_all(text, "Results Found 1,119 Timestamp   15:04", " ")
text <- str_replace_all(text, " /      Results Found 1,119 Timestamp   14:52 .", " ")
text <- str_replace_all(text, "[0-9]{1}+\\,+[0-9]{3}+\\s+Timestamp", " ")
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " ")
text <- str_replace_all(text, "    /      Results Found  " , "")
text <- str_replace_all(text, "ГЛАВНОЕ ЗА ДЕНЬ:", " ")
text <- str_replace_all(text, "ИНТЕРАКТИВНАЯ КАРТА И ГРАФИКИ:", " ")
text <- str_replace_all(text, "ФОТО: ", " ")
text <- str_replace_all(text, "ОНЛАЙН-БЛОГ: ", " ")
text <- str_replace_all(text, "ПРЯМАЯ ТРАНСЛЯЦИЯ: ", " ")
text <- str_replace_all(text, "СМИ: ", " ")
text <- str_replace_all(text, "ФОТО и ВИДЕО", " ")
text <- str_replace_all(text, "ВИДЕО:", " ")
text <- str_replace_all(text, " ИЗ АРХИВОВ", " ")
text <- str_replace_all(text, " ФОТО DELFI", " ")
text <- str_replace_all(text, "ФОТО И   Керсти", " ")
text <- str_replace_all(text, "ВПЕРВЫЕ И ТОЛЬКО НА DELFI", " ")
text <- str_replace_all(text, "ГАЛЕРЕЯ:", " ")
test <- str_replace_all(text, "ВИДЕО DELFI", " ")
text <- str_replace_all(text, " .lv ", " ")
text <- str_replace_all(text, "(\")", " ")
# tatt vekk text <- str_replace_all(text, "\"+[а-яА-ЯёЁ]{1,10}", " ")
 
# Nytt
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " " )
text <- str_replace_all(text, "(\")", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{2}", " ") #20190111ef13 p2
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}", " ") #20190226ef2n dz  
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", " ") # 20190214ef28 02 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", " ") # 20190205ef23 b8
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190205ef23 b5 
text <- str_replace_all(text, "(\n\")", " ")
text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+\\s", " " ) 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190226ef2n e1 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190318ef3f b8  
text <- str_replace_all(text, "[0-9]{8}", " ") # 20190318
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}+\\s+\\s+\\s+", " ") #  ef3h gp  
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[A-Za-z]{1}+\\s+\\s+\\s+", " ") #  ef3f b6 
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef3f b6 
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef38 b5 
text <- str_replace_all(text, "\\s+\\s+[0-9]{1}+\\s+\\s", " " ) 
text <- str_replace_all(text, "��", " ") 
text <- str_replace_all(text, "(\n\")", " ")

text <- str_replace_all(text, "АНОНС", " ")
text <- str_replace_all(text, "ПРЯМАЯ ТРАНСЛЯЦИЯ", " ")
text <- str_replace_all(text, "ФОТО С МЕСТА ПРОИСШЕСТВИЯ:", " ")
text <- str_replace_all(text, "ВИДЕО DELFI", " ")
text <- str_replace_all(text, "ФОТО", " ")
text <- str_replace_all(text, "ВИДЕО", " ")


# SPLITTING AV SIDER
text_list <- str_split(text[1:4], pattern= "All rights reserved.") # eller /n ?? ved linjeshift

# se her på teksten etterpå
substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)  


# LAGE TIBBLE
library(tidyverse)

tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble

# Forventet antall tekster
100+100+91+52+4 #[1] 347
tekster # A tibble: 347 x 1


##### lage variabler #####

data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 0,
                       land = "Estland",
                       rusetn = "høy", 
                       rusmors = "høy", 
                       rusaffek = 2, 
                       FFPfragile = "lav",
                       Russortod = "medium",
                       Plassering = 1,
                       tekst = "ingress",
                       tid = "April", 
                       Avis = "Delfi"), 
                  stringAsFactors = FALSE)

dataFF <- data[-c(53, 154, 255, 347), ]  

# måtte hatt mange flere land statistisk for å lage kontinuerlige variabler for å bli et poeng ut av 
library(quanteda)

corpusDelfi <- corpus(dataFF)
corpusDelfi$documents$texts
docvars(corpusDelfi)
summary(corpusDelfi)   # Corpus consisting of 343 documents

# ekstremt viktig å lage nytt navn her
save(corpusDelfi, file = "~/Downloads/test/2019/Korpusnye/Corpus_Delfi_April.rda")
load("~/Downloads/test/2019/Korpusnye/Corpus_Delfi_April.rda")







                                                    #### MAI ####

setwd("~/Downloads/test/2019/Estland/Delfi (2)")

# laste inn MK
liste<- list.files(paste0("~/Downloads/test/2019/Estland/Delfi (2)/Mai "), 
                   full.names = TRUE)


# Bruker liste for å hente ut tekstene med pdf_text
Delfi <- lapply(liste[1:4], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 




############   lag dataframe   ###########

### MKframe #### radbinde i et frame
Delfiframe <- do.call(rbind, Delfi)  # do call brukes for funksjon på liste, r bind radbinder listen
substr(Delfiframe$text[1], 1, 200) # teskt en, 200 ord - ikke nødvendig



############ LAGE TEKSTEN OG FJERNE TEKST #########
library(stringr)

#først plukke ut tekstvariabelen på (data)framen og kalle den text, samtidig fjerne whitespace
text <- str_trim(str_replace_all(Delfiframe$text,   "\\s+",  " ")) 


# splitte tekst
text_list <- str_split(text[1:4], pattern= "All rights reserved.") # eller /n ?? ved linjeshift

# se på tekst
substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn


#########Fjerne ting############


# 

text <- str_replace_all(text, "Delfi,", "") 
text <- str_replace_all(text, "(\\\"Tenet\\\")", "") 
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}+\\,", "") #kl.slett
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}+,", "")  # dato
text <- str_replace_all(text, "[0-9]{2,3}+\\s+words,", "") #antall ord
text <- str_replace_all(text, "\\(+Russian+\\)", "") 
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}+\\s+©+\\s+2019+\\s+Factiva,+\\s+Inc", "")

text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}", " ")
text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source mke.ee", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "Or Delfi ", " ")
text <- str_replace_all(text, "Or Postimees", " ")
text <- str_replace_all(text, "Author All Authors Company", " ")
text <- str_replace_all(text, "All Companies Subject Political ", " ")
text <- str_replace_all(text, "General News Industry All Industries Region All Regions Language", " ")
text <- str_replace_all(text, "Russian News Filters Source: Delfi", " ")
text <- str_replace_all(text, "Results Found 838 Timestamp", " ")
text <- str_replace_all(text, "All Companies Subject Political", "")
text <- str_replace_all(text, "14:08", " ")


#nytt 
text <- str_replace_all(text, "Results Found 1,119 Timestamp   14:46", " ")
text <- str_replace_all(text, "Results Found 1,119 Timestamp   15:04", " ")
text <- str_replace_all(text, " /      Results Found 1,119 Timestamp   14:52 .", " ")
text <- str_replace_all(text, "[0-9]{1}+\\,+[0-9]{3}+\\s+Timestamp", " ")
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " ")
text <- str_replace_all(text, "    /      Results Found  " , "")
text <- str_replace_all(text, "ГЛАВНОЕ ЗА ДЕНЬ:", " ")
text <- str_replace_all(text, "ИНТЕРАКТИВНАЯ КАРТА И ГРАФИКИ:", " ")
text <- str_replace_all(text, "ФОТО: ", " ")
text <- str_replace_all(text, "ОНЛАЙН-БЛОГ: ", " ")
text <- str_replace_all(text, "ПРЯМАЯ ТРАНСЛЯЦИЯ: ", " ")
text <- str_replace_all(text, "СМИ: ", " ")
text <- str_replace_all(text, "ФОТО и ВИДЕО", " ")
text <- str_replace_all(text, "ВИДЕО:", " ")
text <- str_replace_all(text, " ИЗ АРХИВОВ", " ")
text <- str_replace_all(text, " ФОТО DELFI", " ")
text <- str_replace_all(text, "ФОТО И   Керсти", " ")
text <- str_replace_all(text, "ВПЕРВЫЕ И ТОЛЬКО НА DELFI", " ")
text <- str_replace_all(text, "ГАЛЕРЕЯ:", " ")
test <- str_replace_all(text, "ВИДЕО DELFI", " ")
test <- str_replace_all(text, "ГРАФИК", " ")
test <- str_replace_all(text, "МИЛЫЕ ФОТО", " ")
test <- str_replace_all(text, "В КНДР 10", " ")
test <- str_replace_all(text, "ВИДЕО", " ")
test <- str_replace_all(text, "ФОТО ", " ")
text <- str_replace_all(text, " .lv ", " ")
text <- str_replace_all(text, "(\")", " ")
# tatt vekk text <- str_replace_all(text, "\"+[а-яА-ЯёЁ]{1,10}", " ")

text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " " )
text <- str_replace_all(text, "(\")", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{2}", " ") #20190111ef13 p2
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}", " ") #20190226ef2n dz  
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", " ") # 20190214ef28 02 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", " ") # 20190205ef23 b8
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190205ef23 b5 
text <- str_replace_all(text, "(\n\")", " ")
text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+\\s", " " ) 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190226ef2n e1 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190318ef3f b8  
text <- str_replace_all(text, "[0-9]{8}", " ") # 20190318
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}+\\s+\\s+\\s+", " ") #  ef3h gp  
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[A-Za-z]{1}+\\s+\\s+\\s+", " ") #  ef3f b6 
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef3f b6 
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef38 b5 
text <- str_replace_all(text, "\\s+\\s+[0-9]{1}+\\s+\\s", " " ) 
text <- str_replace_all(text, "��", " ") 
text <- str_replace_all(text, "(\n\")", " ")

text <- str_replace_all(text, "АНОНС", " ")
text <- str_replace_all(text, "ПРЯМАЯ ТРАНСЛЯЦИЯ", " ")
text <- str_replace_all(text, "ФОТО С МЕСТА ПРОИСШЕСТВИЯ:", " ")
text <- str_replace_all(text, "ВИДЕО DELFI  ", " ")
text <- str_replace_all(text, "ФОТО", " ")

  
# SPLITTING AV SIDER
text_list <- str_split(text[1:4], pattern= "All rights reserved.") # eller /n ?? ved linjeshift

# se her på teksten etterpå
substr(text_list[[3]], 1, 2000)
substr(text_list[1], 1,4000)  


# LAGE TIBBLE
library(tidyverse)

tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble

# Forventet antall tekster
100+100+48+73+4 #[1] 325
tekster # A tibble: 325 x 1


##### lage variabler #####

data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 0,
                       land = "Estland",
                       rusetn = "høy", 
                       rusmors = "høy", 
                       rusaffek = 2, 
                       FFPfragile = "lav",
                       Russortod = "medium",
                       Plassering = 1,
                       tekst = "ingress",
                       tid = "Mai", 
                       Avis = "Delfi"), 
                  stringAsFactors = FALSE)

dataFF <- data[-c(74, 175, 276, 325), ]   # har vel bladd gjennom manuelt i data (matrisen som heter data) for å finne verdiene

# måtte hatt mange flere land statistisk for å lage kontinuerlige variabler for å bli et poeng ut av 
library(quanteda)

corpusDelfi <- corpus(dataFF)
corpusDelfi$documents$texts
docvars(corpusDelfi)
summary(corpusDelfi)

# ekstremt viktig å lage nytt navn her
save(corpusDelfi, file = "~/Downloads/test/2019/Korpusnye/Corpus_Delfi_Mai.rda")
load("~/Downloads/test/2019/Korpusnye/Corpus_Delfi_Mai.rda")




#### JUNI #####


# laste inn MK
liste<- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Estland/Delfi (2)/Juni"), 
                   full.names = TRUE)


# Bruker liste for å hente ut tekstene med pdf_text
Delfi <- lapply(liste[1:2], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 




############   lag dataframe   ###########

### MKframe #### radbinde i et frame
Delfiframe <- do.call(rbind, Delfi)  # do call brukes for funksjon på liste, r bind radbinder listen
substr(Delfiframe$text[1], 1, 200) # teskt en, 200 ord - ikke nødvendig



############ LAGE TEKSTEN OG FJERNE TEKST #########
library(stringr)

#først plukke ut tekstvariabelen på (data)framen og kalle den text, samtidig fjerne whitespace
text <- str_trim(str_replace_all(Delfiframe$text,   "\\s+",  " ")) 


# splitte tekst
text_list <- str_split(text[1:2], pattern= "All rights reserved.") # eller /n ?? ved linjeshift

# se på tekst
substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn


#########Fjerne ting############


# 

text <- str_replace_all(text, "Delfi,", "") 
text <- str_replace_all(text, "(\\\"Tenet\\\")", "") 
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}+\\,", "") #kl.slett
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}+,", "")  # dato
text <- str_replace_all(text, "[0-9]{2,3}+\\s+words,", "") #antall ord
text <- str_replace_all(text, "\\(+Russian+\\)", "") 
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}+\\s+©+\\s+2019+\\s+Factiva,+\\s+Inc", "")

text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}", " ")
text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source mke.ee", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "Or Delfi ", " ")
text <- str_replace_all(text, "Or Postimees", " ")
text <- str_replace_all(text, "Author All Authors Company", " ")
text <- str_replace_all(text, "All Companies Subject Political ", " ")
text <- str_replace_all(text, "General News Industry All Industries Region All Regions Language", " ")
text <- str_replace_all(text, "Russian News Filters Source: Delfi", " ")
text <- str_replace_all(text, "Results Found 838 Timestamp", " ")
text <- str_replace_all(text, "All Companies Subject Political", "")
text <- str_replace_all(text, "14:08", " ")


#nytt 
text <- str_replace_all(text, "Results Found 1,119 Timestamp   14:46", " ")
text <- str_replace_all(text, "Results Found 1,119 Timestamp   15:04", " ")
text <- str_replace_all(text, " /      Results Found 1,119 Timestamp   14:52 .", " ")
text <- str_replace_all(text, "[0-9]{1}+\\,+[0-9]{3}+\\s+Timestamp", " ")
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " ")
text <- str_replace_all(text, "    /      Results Found  " , "")
text <- str_replace_all(text, "ГЛАВНОЕ ЗА ДЕНЬ:", " ")
text <- str_replace_all(text, "ИНТЕРАКТИВНАЯ КАРТА И ГРАФИКИ:", " ")
text <- str_replace_all(text, "ФОТО: ", " ")
text <- str_replace_all(text, "ОНЛАЙН-БЛОГ: ", " ")
text <- str_replace_all(text, "ПРЯМАЯ ТРАНСЛЯЦИЯ: ", " ")
text <- str_replace_all(text, "СМИ: ", " ")
text <- str_replace_all(text, "ФОТО и ВИДЕО", " ")
text <- str_replace_all(text, "ВИДЕО:", " ")
text <- str_replace_all(text, " ИЗ АРХИВОВ", " ")
text <- str_replace_all(text, " ФОТО DELFI", " ")
text <- str_replace_all(text, "ФОТО И ", " ")
text <- str_replace_all(text, "ВПЕРВЫЕ И ТОЛЬКО НА DELFI", " ")
text <- str_replace_all(text, "ГАЛЕРЕЯ:", " ")
test <- str_replace_all(text, "ВИДЕО DELFI", " ")
test <- str_replace_all(text, "ГРАФИК", " ")
test <- str_replace_all(text, "МИЛЫЕ ФОТО", " ")
test <- str_replace_all(text, "В КНДР 10", " ")
test <- str_replace_all(text, "ВИДЕО", " ")
text <- str_replace_all(text, " .lv ", " ")
text <- str_replace_all(text, "(\")", " ")
# tatt vekk text <- str_replace_all(text, "\"+[а-яА-ЯёЁ]{1,10}", " ")

# test <- str_replace_all(text, "ФОТО |", " ") # går ikke vekk


text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " " )
text <- str_replace_all(text, "(\")", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{2}", " ") #20190111ef13 p2
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}", " ") #20190226ef2n dz  
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", " ") # 20190214ef28 02 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", " ") # 20190205ef23 b8
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190205ef23 b5 
text <- str_replace_all(text, "(\n\")", " ")
text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+\\s", " " ) 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190226ef2n e1 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190318ef3f b8  
text <- str_replace_all(text, "[0-9]{8}", " ") # 20190318
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}+\\s+\\s+\\s+", " ") #  ef3h gp  
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[A-Za-z]{1}+\\s+\\s+\\s+", " ") #  ef3f b6 
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef3f b6 
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef38 b5 
text <- str_replace_all(text, "\\s+\\s+[0-9]{1}+\\s+\\s", " " ) 
text <- str_replace_all(text, "��", " ") 
text <- str_replace_all(text, "(\n\")", " ")

text <- str_replace_all(text, "АНОНС", " ")
text <- str_replace_all(text, "ПРЯМАЯ ТРАНСЛЯЦИЯ", " ")
text <- str_replace_all(text, "ФОТО С МЕСТА ПРОИСШЕСТВИЯ:", " ")
text <- str_replace_all(text, "ВИДЕО DELFI  ", " ")
text <- str_replace_all(text, "ФОТО", " ")


# SPLITTING AV SIDER
text_list <- str_split(text[1:2], pattern= "All rights reserved.") # eller /n ?? ved linjeshift


# se her på teksten etterpå
substr(text_list[[2]], 1, 2000)
substr(text_list[1], 1,4000)  


# LAGE TIBBLE
library(tidyverse)

tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble

# Forventet antall tekster
27+100+2
#[1] 129
tekster
# A tibble: 129 x 1


##### lage variabler #####
data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 1,
                       land = "Estland",
                       rusetn = "høy", 
                       rusmors = "høy", 
                       rusaffek = 2, 
                       FFPfragile = "lav",
                       Russortod = "middels",
                       Plassering = 2,
                       tekst = "ingress", 
                       tid = "Juni",
                       avis = "Delfi"), 
                  stringAsFactors = FALSE)

dataFF <- data[-c(101, 129), ]  

# måtte hatt mange flere land statistisk for å lage kontinuerlige variabler for å bli et poeng ut av 
library(quanteda)

corpusDelfi <- corpus(dataFF)
corpusDelfi$documents$texts
docvars(corpusDelfi)
summary(corpusDelfi)

# ekstremt viktig å lage nytt navn her
save(corpusDelfi, file = "~/Downloads/test/2019/Korpusnye/Corpus_Delfi_Juni.rda")
load("~/Downloads/test/2019/Korpusnye/Corpus_Delfi_Juni.rda")







                                                                      # 
                         #  #  #  #  # ## ## ## #  # # # # # # # ## #
                      #               ## ##          ## ###     
                                       #                 ###
                                      #                   ###
                                      #                   ###
                                      #                   ###
                                      #                  ###
              ###POSTIMEES###         #                   ##
              ###############         #                   ##
                                      #                  ##
                                     #                    #    #
                                    #                     # # #


                        
                        ##### Postimees ####
                        # IKKE Kreml-basert#
                        # Postimees har Factiva bare tilgjengelig overskrift og ingress






setwd("/Users/odasmarchand/Downloads/test/2019/Estland/Postimees (1)")


liste<- list.files(paste0("~/Downloads/test/2019/Estland/Postimees (1)/April"), 
                   full.names = TRUE)


# Bruker liste for å hente ut tekstene med pdf_text
Postimees <- lapply(liste[1:12], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 




##########   lag dataframe   ###########

Postiframe <- do.call(rbind, Postimees)  # do call brukes for funksjon på liste, r bind radbinder listen
substr(Postiframe$text[1], 1, 200) # teskt en, 200 ord - ikke nødvendig


############################## LAGE TEKSTEN OG FJERNE TEKST ####################################
library(stringr)
# samtidig lager tilfeldigvis om til character og ikke dataframe

#først plukke ut tekstvariabelen på (data)framen og kalle den text, samtidig fjerne whitespace
text <- str_trim(str_replace_all(Postiframe$text,   "\\s+\\s+\\s+",  " ")) 


# splitte tekst
text_list <- str_split(text[1:12], pattern= "Factiva, Inc. All rights reserved.") # eller /n ?? ved linjeshift

# se på tekst
substr(text_list[[11]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn


#########Fjerne ting############

text <- str_replace_all(text, "Postimees,", "") 
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}+\\,", "") #kl.slett,
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", "") #kl.slett uten komma
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}+,", "")  # dato
text <- str_replace_all(text, "[0-9]{2,3}+\\s+words,", "") #antall ord
text <- str_replace_all(text, "\\(+Russian+\\)", "") 
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}+\\s+©+\\s+2019", " ")# Page 97 of 100 © 2019 
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}", " ")
text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source mke.ee", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "Or Delfi ", " ")
text <- str_replace_all(text, "Or Postimees", " ")
text <- str_replace_all(text, "Author All Authors Company", " ")
text <- str_replace_all(text, "All Companies Subject Political ", " ")
text <- str_replace_all(text, "General News Industry All Industries Region All Regions Language", " ")
text <- str_replace_all(text, "Russian News Filters Source: Delfi", " ")
text <- str_replace_all(text, "Results Found 838 Timestamp", " ")
text <- str_replace_all(text, "All Companies Subject Political", "")
text <- str_replace_all(text, "Results Found 1,119 Timestamp", " ")
text <- str_replace_all(text, "Timestamp", " ")
text <- str_replace_all(text, "Russian News Filters Source: Postimees   Results Found 3,079", " ")
text <- str_replace_all(text, "Фото:", " ")
text <- str_replace_all(text, "Russian News Filters Source: Postimees   Results Found 3,079", " ")
text <- str_replace_all(text, "/", " ")
text <- str_replace_all(text, "(\")", " ")
# tatt vekk text <- str_replace_all(text, "\"+[а-яА-ЯёЁ]{1,10}", " ")
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " " )
text <- str_replace_all(text, "(\")", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{2}", " ") #20190111ef13 p2
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}", " ") #20190226ef2n dz  
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", " ") # 20190214ef28 02 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", " ") # 20190205ef23 b8
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190205ef23 b5 
text <- str_replace_all(text, "(\n\")", " ")
text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+\\s", " " ) 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190226ef2n e1 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190318ef3f b8  
text <- str_replace_all(text, "[0-9]{8}", " ") # 20190318
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}+\\s+\\s+\\s+", " ") #  ef3h gp  
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[A-Za-z]{1}+\\s+\\s+\\s+", " ") #  ef3f b6 
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef3f b6 
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef38 b5 
text <- str_replace_all(text, "\\s+\\s+[0-9]{1}+\\s+\\s", " " ) 
text <- str_replace_all(text, "��", " ") 
text <- str_replace_all(text, "(\n\")", " ")
text <- str_replace_all(text, "(\\n)", " ") 

text <- str_replace_all(text, "[а-яА-ЯёЁ]{1,9}+\\(+[0-9]{1,2}+\\)+\\s+\\s+\\s", " ")
text <- str_replace_all(text, "[а-яА-ЯёЁ]{1,9}+\\(+[0-9]{1,2}+\\)", " ") 
text <- str_replace_all(text, "[A-Za-z]{1,9}+\\(+[0-9]{1,2}+\\)", " ") 
text <- str_replace_all(text, "\\(+[0-9]{1,2}+\\)", " ")
text <- str_replace_all(text, "\"", " ") 

# kjøre denne to ganger for å renske 
text <- str_replace_all(text, "Or Postimees", " ")
text <- str_replace_all(text, "Author All Authors Company", " ")
text <- str_replace_all(text, "All Companies Subject Political ", " ")
text <- str_replace_all(text, "General News Industry All Industries Region All Regions Language", " ")
text <- str_replace_all(text, "Russian News Filters Source: Delfi", " ")
text <- str_replace_all(text, "Results Found 838 Timestamp", " ")
text <- str_replace_all(text, "All Companies Subject Political", "")
text <- str_replace_all(text, "Results Found 1,119 Timestamp", " ")
text <- str_replace_all(text, "Timestamp", " ")
text <- str_replace_all(text, "Russian News Filters Source: Postimees   Results Found 3,079", " ")
text <- str_replace_all(text, "Фото:", " ")
text <- str_replace_all(text, "Russian News Filters Source: Postimees   Results Found 3,079", " ")
text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source mke.ee", " ")



# SPLITTING AV SIDER
# splitte sider basert på mønster: 
text_list <- str_split(text[1:12], pattern= "Factiva, Inc. All rights reserved.") # eller /n ?? ved linjeshift

# se her på teksten etterpå
substr(text_list[[1]], 1, 3000)
substr(text_list[[2]], 1, 3000)
substr(text_list[[3]], 1, 3000)
substr(text_list[[4]], 1, 3000)
substr(text_list[[5]], 1, 300)
substr(text_list[[6]], 1, 300)
substr(text_list[[7]], 1, 300)
substr(text_list[[8]], 1, 300)
substr(text_list[[9]], 1, 300)
substr(text_list[[10]], 1, 300)
substr(text_list[[11]], 1, 3000)
substr(text_list[[12]], 1, 3000)

substr(text_list[1], 1,4000)  

# 9, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 20  # slutt  på hvert av de 12 doc. 

a<- 9
b <- a+101
c <- b+101
d <- c+101
e <- d+101
f <- e+101
g <- f+101
h <- g+101
i <- h+101
j <- i+101
k <- j+101
l <- k+20 

tt<- print(c(a, b, c, d, e, f, g, h, i, j, k, l)) 

# LAGE TIBBLE
library(tidyverse)

tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble


# April forventet tekster
8+19+(100*10)+12 # [1] 1039

tekster # A tibble: 1,039 x 1

##### lage variabler #####

data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 0,
                       land = "Estland",
                       rusetn = "høy", 
                       rusmors = "høy", 
                       rusaffek = 2, 
                       FFPfragile = "lav",
                       Russortod = "middels",
                       Plassering = 1,
                       tekst = "ingress",
                       tid = "April", 
                       avis = "Postimees"), 
                  stringAsFactors = FALSE)



# sjekker at jeg fikk ingenting eller NA på alle de før jeg sletter dem 
# evnt prøve met Matrise

Matrise <- matrix(unlist(text_list))
tt
# nå kan vi sjekke fra den unlistede lista
substr(Matrise[9], 1, 300)
substr(Matrise[110], 1, 300) 
substr(Matrise[211], 1, 300)
substr(Matrise[312], 1, 300)
substr(Matrise[413], 1, 300)
substr(Matrise[514], 1, 300)
substr(Matrise[615], 1, 300)
substr(Matrise[716], 1, 300)
substr(Matrise[817], 1, 300)
substr(Matrise[918], 1, 300)
substr(Matrise[1019], 1, 300)
substr(Matrise[1039], 1, 300)

# ser bra ut

# se hva som er i - dobbeltsjekk
datasjekkFF <- data[c( 9, 110, 211, 312, 413, 514, 615, 716, 817, 918, 1019, 1039), ] 

# OK! 

# kjør
 dataFF <- data[-c( 9, 110, 211, 312, 413, 514, 615, 716, 817, 918, 1019, 1039), ]  
 
library(quanteda)
corpusPosti <- corpus(dataFF)
corpusPosti$documents$texts  # Corpus consisting of 1027 documents, showing 100 documents:
docvars(corpusPosti)
summary(corpusPosti)

save(corpusPosti, file = "~/Downloads/test/2019/Korpusnye/Corpus_Postimees_April.rda")
load("~/Downloads/test/2019/Korpusnye/Corpus_Postimees_April.rda")







                                      ##### MAI ###### 

setwd("/Users/odasmarchand/Downloads/test/2019/Estland/Postimees (1)") 


liste<- list.files(paste0("~/Downloads/test/2019/Estland/Postimees (1)/Mai"), 
                   full.names = TRUE)


# Bruker liste for å hente ut tekstene med pdf_text
Postimees <- lapply(liste[1:10], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 




##########   lag dataframe   ###########
Postiframe <- do.call(rbind, Postimees)  # do call brukes for funksjon på liste, r bind radbinder listen
substr(Postiframe$text[1], 1, 200) # teskt en, 200 ord - ikke nødvendig


################## LAGE TEKSTEN OG FJERNE TEKST ##########
library(stringr)

text <- str_trim(str_replace_all(Postiframe$text,   "\\s+\\s+\\s+\\s",  " ")) #tekstvariablene fra dataframet + fjerne store mellomrom med en gang


# splitte tekst 1.gang
text_list <- str_split(text[1:10], pattern= "Factiva, Inc. All rights reserved.") # eller /n ?? ved linjeshift

# se på tekst
substr(text_list[[10]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn


#########Fjerne ting############
text <- str_replace_all(text, "Postimees,", "") 
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}+\\,", "") #kl.slett,
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", "") #kl.slett uten komma
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}+,", "")  # dato
text <- str_replace_all(text, "[0-9]{2,3}+\\s+words,", "") #antall ord
text <- str_replace_all(text, "\\(+Russian+\\)", "") 
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}+\\s+©+\\s+2019", " ") # Page 97 of 100 © 2019 Factiva, Inc. " 
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}", " ")
text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source mke.ee", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "Or Delfi ", " ")
text <- str_replace_all(text, "Or Postimees", " ")
text <- str_replace_all(text, "Author All Authors Company", " ")
text <- str_replace_all(text, "All Companies Subject Political ", " ")
text <- str_replace_all(text, "General News Industry All Industries Region All Regions Language", " ")
text <- str_replace_all(text, "Russian News Filters Source: Delfi", " ")
text <- str_replace_all(text, "Results Found 838 Timestamp", " ")
text <- str_replace_all(text, "All Companies Subject Political", "")
text <- str_replace_all(text, "Results Found 1,119 Timestamp", " ")
text <- str_replace_all(text, "Timestamp", " ")
text <- str_replace_all(text, "Russian News Filters Source: Postimees   Results Found 3,079", " ")
text <- str_replace_all(text, "Фото:", " ")
text <- str_replace_all(text, "Russian News Filters Source: Postimees   Results Found 3,079", " ")
text <- str_replace_all(text, "/", " ")
text <- str_replace_all(text, "\n", " ")

text <- str_replace_all(text, "[а-яА-ЯёЁ]{1,9}+\\(+[0-9]{1,2}+\\)+\\s+\\s+\\s", " ")
text <- str_replace_all(text, "[а-яА-ЯёЁ]{1,9}+\\(+[0-9]{1,2}+\\)", " ") 
text <- str_replace_all(text, "[A-Za-z]{1,9}+\\(+[0-9]{1,2}+\\)", " ") 
text <- str_replace_all(text, "\\(+[0-9]{1,2}+\\)", " ")
text <- str_replace_all(text, "\"", " ") 
text <- str_replace_all(text, "(\")", " ")
# tatt vekk text <- str_replace_all(text, "\"+[а-яА-ЯёЁ]{1,10}", " ")
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " " )
text <- str_replace_all(text, "(\")", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{2}", " ") #20190111ef13 p2
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}", " ") #20190226ef2n dz  
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", " ") # 20190214ef28 02 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", " ") # 20190205ef23 b8
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190205ef23 b5 
text <- str_replace_all(text, "(\n\")", " ")
text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+\\s", " " ) 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190226ef2n e1 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190318ef3f b8  
text <- str_replace_all(text, "[0-9]{8}", " ") # 20190318
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}+\\s+\\s+\\s+", " ") #  ef3h gp  
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[A-Za-z]{1}+\\s+\\s+\\s+", " ") #  ef3f b6 
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef3f b6 
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef38 b5 
text <- str_replace_all(text, "\\s+\\s+[0-9]{1}+\\s+\\s", " " ) 
text <- str_replace_all(text, "��", " ") 
text <- str_replace_all(text, "(\n\")", " ")
text <- str_replace_all(text, "(\n\")", " ")
text <- str_replace_all(text, "(\\n)", " ") 

text <- str_replace_all(text, "[а-яА-ЯёЁ]{1,9}+\\(+[0-9]{1,2}+\\)+\\s+\\s+\\s", " ")
text <- str_replace_all(text, "[а-яА-ЯёЁ]{1,9}+\\(+[0-9]{1,2}+\\)", " ") 
text <- str_replace_all(text, "[A-Za-z]{1,9}+\\(+[0-9]{1,2}+\\)", " ") 
text <- str_replace_all(text, "\\(+[0-9]{1,2}+\\)", " ")
text <- str_replace_all(text, "\"", " ") 

# kjøre denne to ganger for å renske 
text <- str_replace_all(text, "Or Postimees", " ")
text <- str_replace_all(text, "Author All Authors Company", " ")
text <- str_replace_all(text, "All Companies Subject Political ", " ")
text <- str_replace_all(text, "General News Industry All Industries Region All Regions Language", " ")
text <- str_replace_all(text, "Russian News Filters Source: Delfi", " ")
text <- str_replace_all(text, "Results Found 838 Timestamp", " ")
text <- str_replace_all(text, "All Companies Subject Political", "")
text <- str_replace_all(text, "Results Found 1,119 Timestamp", " ")
text <- str_replace_all(text, "Timestamp", " ")
text <- str_replace_all(text, "Russian News Filters Source: Postimees   Results Found 3,079", " ")
text <- str_replace_all(text, "Фото:", " ")
text <- str_replace_all(text, "Russian News Filters Source: Postimees   Results Found 3,079", " ")
text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source mke.ee", " ")





# SPLITTING AV SIDER
text_list <- str_split(text[1:10], pattern= "Factiva, Inc. All rights reserved.") # eller /n ?? ved linjeshift

substr(text_list[[7]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn


# se her på teksten etterpå. Finne ut hvilke som skal fjernes (grunnet str_split: tomme, med 00, intetsigende etc.)
substr(text_list[[1]], 1, 300)
substr(text_list[[2]], 1, 300)
substr(text_list[[3]], 1, 300)
substr(text_list[[4]], 1, 300)
substr(text_list[[5]], 1, 3000)
substr(text_list[[6]], 1, 300)
substr(text_list[[7]], 1, 300)
substr(text_list[[8]], 1, 300)
substr(text_list[[9]], 1, 300)
substr(text_list[[10]], 1, 3000)


OO <- matrix(1:1500, ncol=1)
a <- OO[4,]
b <- OO[101,]
c <- OO[101,]
d <- OO[101,]
e <- OO[101,]
f <- OO[101,]
g <- OO[101,]
h <- OO[101,]
i <- OO[101,]
j <- OO[93,]


OOO <- matrix(1:1500, ncol=10)
aa <- OO[a,]
bb <- OO[aa+b,]
cc <- OO[bb+c,]
dd <- OO[cc+d,]
ee <- OO[dd+e,]
ff <- OO[ee+f,]
gg <- OO[ff+g,]
hh <- OO[gg+h,]
ii <- OO[hh+i,]
jj <- OO[ii+j,]

tt<- print(c(aa, bb, cc, dd, ee, ff, gg, hh, ii, jj)) 
print(c(a, (a+b), (a+b+c), (a+b+c+d), (a+b+c+d+e), (a+b+c+d+e+f), (a+b+c+d+e+f+g), (a+b+c+d+e+f+g+h), (a+b+c+d+e+f+g+h+i), (a+b+c+d+e+f+g+h+i+j))) 
# [1]   4 105 206 307 408 509 610 711 812 905



# alle var NA eller "" og derfor skal disse fjernes fra corpus etterpå

# LAGE TIBBLE
library(tidyverse)

tekster <- as_tibble(matrix(unlist(text_list))) 


# Mai forventet
(8*100)+92+3+10 # [1] 905

tekster # A tibble: 905 x 1

##### lage variabler #####

data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 0,
                       land = "Estland",
                       rusetn = "høy", 
                       rusmors = "høy", 
                       rusaffek = 2, 
                       FFPfragile = "lav",
                       Russortod = "middels",
                       Plassering = 1,
                       tekst = "ingress",
                       tid = "Mai", 
                       avis = "Postimees"), 
                  stringAsFactors = FALSE)

Matrise <- matrix(unlist(text_list))
tt
substr(Matrise[4], 1, 300)
substr(Matrise[105], 1, 300)
substr(Matrise[206], 1, 300)
substr(Matrise[307], 1, 300)
substr(Matrise[408], 1, 300)
substr(Matrise[509], 1, 300)
substr(Matrise[610], 1, 300)
substr(Matrise[711], 1, 300)
substr(Matrise[812], 1, 300)
substr(Matrise[905], 1, 300)
# ser kjempebra ut. Kjempemessig.

dataFFsjekk <- data[c(4, 105, 206, 307, 408, 509, 610, 711, 812, 905), ]  # Knall!

# kjør dersom "" eller ingenting i de over
dataFF <- data[-c(4, 105, 206, 307, 408, 509, 610, 711, 812, 905), ] 

library(quanteda)
corpusPosti <- corpus(dataFF)
corpusPosti$documents$texts
docvars(corpusPosti)
summary(corpusPosti)

save(corpusPosti, file = "~/Downloads/test/2019/Korpusnye/Corpus_Postimees_Mai.rda")
load("~/Downloads/test/2019/Korpusnye/Corpus_Postimees_Mai.rda")








                                             ### JUNI ### 




setwd("/Users/odasmarchand/Downloads/test/2019/Estland/Postimees (1)")


liste<- list.files(paste0("~/Downloads/test/2019/Estland/Postimees (1)/Juni"), 
                   full.names = TRUE)


# Bruker liste for å hente ut tekstene med pdf_text
Postimees <- lapply(liste[1:8], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 




##########   lag dataframe   ###########
Postiframe <- do.call(rbind, Postimees)  # do call brukes for funksjon på liste, r bind radbinder listen
substr(Postiframe$text[1], 1, 200) # teskt en, 200 ord - ikke nødvendig


################## LAGE TEKSTEN OG FJERNE TEKST ##########
library(stringr)

text <- str_trim(str_replace_all(Postiframe$text,   "\\s+\\s+\\s+\\s",  " ")) #tekstvariablene fra dataframet + fjerne store mellomrom med en gang


# splitte tekst 1.gang
text_list <- str_split(text[1:8], pattern= "Factiva, Inc. All rights reserved.") # eller /n ?? ved linjeshift

# se på tekst
substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn


#########Fjerne ting############
text <- str_replace_all(text, "Postimees,", "") 
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}+\\,", "") #kl.slett,
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", "") #kl.slett uten komma
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}+,", "")  # dato
text <- str_replace_all(text, "[0-9]{2,3}+\\s+words,", "") #antall ord
text <- str_replace_all(text, "\\(+Russian+\\)", "") 
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}+\\s+©+\\s+2019", " ") # Page 97 of 100 © 2019 Factiva, Inc. " 
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}", " ")
text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source mke.ee", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "Or Delfi ", " ")
text <- str_replace_all(text, "Or Postimees", " ")
text <- str_replace_all(text, "Author All Authors Company", " ")
text <- str_replace_all(text, "All Companies Subject Political ", " ")
text <- str_replace_all(text, "General News Industry All Industries Region All Regions Language", " ")
text <- str_replace_all(text, "Russian News Filters Source: Delfi", " ")
text <- str_replace_all(text, "Results Found 838 Timestamp", " ")
text <- str_replace_all(text, "All Companies Subject Political", "")
text <- str_replace_all(text, "Results Found 1,119 Timestamp", " ")
text <- str_replace_all(text, "Timestamp", " ")
text <- str_replace_all(text, "Russian News Filters Source: Postimees   Results Found 3,079", " ")
text <- str_replace_all(text, "Фото:", " ")
text <- str_replace_all(text, "Russian News Filters Source: Postimees   Results Found 3,079", " ")
text <- str_replace_all(text, "/", " ")
text <- str_replace_all(text, "Or Delfi ", " ")
text <- str_replace_all(text, "Or Postimees", " ")
text <- str_replace_all(text, "Author All Authors Company", " ")
text <- str_replace_all(text, "All Companies Subject Political ", " ")
text <- str_replace_all(text, "General News Industry All Industries Region All Regions Language", " ")
text <- str_replace_all(text, "Russian News Filters Source: Delfi", " ")
text <- str_replace_all(text, "Results Found 838 Timestamp", " ")
text <- str_replace_all(text, "All Companies Subject Political", "")
text <- str_replace_all(text, "Results Found 1,119 Timestamp", " ")
text <- str_replace_all(text, "Timestamp", " ")
text <- str_replace_all(text, "Russian News Filters Source: Postimees   Results Found 3,079", " ")
text <- str_replace_all(text, "Фото:", " ")
text <- str_replace_all(text, "Russian News Filters Source: Postimees   Results Found 3,079", " ")
text <- str_replace_all(text, "[а-яА-ЯёЁ]{1,9}+\\(+[0-9]{1,2}+\\)+\\s+\\s+\\s", " ")
text <- str_replace_all(text, "[а-яА-ЯёЁ]{1,9}+\\(+[0-9]{1,2}+\\)", " ") 
text <- str_replace_all(text, "[A-Za-z]{1,9}+\\(+[0-9]{1,2}+\\)", " ") 
text <- str_replace_all(text, "\\(+[0-9]{1,2}+\\)", " ")
text <- str_replace_all(text, "\"", " ") 
text <- str_replace_all(text, "\\n", " ") 
text <- str_replace_all(text, "(\")", " ")
# tatt vekk text <- str_replace_all(text, "\"+[а-яА-ЯёЁ]{1,10}", " ")
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " " )
text <- str_replace_all(text, "(\")", " ")
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{2}", " ") #20190111ef13 p2
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}", " ") #20190226ef2n dz  
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", " ") # 20190214ef28 02 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", " ") # 20190205ef23 b8
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190205ef23 b5 
text <- str_replace_all(text, "(\n\")", " ")
text <- str_replace_all(text, "\\s+\\s+\\s+[0-9]{1}+\\s+\\s+\\s", " " ) 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190226ef2n e1 
text <- str_replace_all(text, "[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") # 20190318ef3f b8  
text <- str_replace_all(text, "[0-9]{8}", " ") # 20190318
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{2}+\\s+\\s+\\s+", " ") #  ef3h gp  
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[A-Za-z]{1}+\\s+\\s+\\s+", " ") #  ef3f b6 
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef3f b6 
text <- str_replace_all(text, "[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{1}+[0-9]{1}", " ") #ef38 b5 
text <- str_replace_all(text, "\\s+\\s+[0-9]{1}+\\s+\\s", " " ) 
text <- str_replace_all(text, "��", " ") 
text <- str_replace_all(text, "(\n\")", " ")
text <- str_replace_all(text, "Or Postimees", " ")
text <- str_replace_all(text, "Author All Authors Company", " ")
text <- str_replace_all(text, "All Companies Subject Political ", " ")
text <- str_replace_all(text, "General News Industry All Industries Region All Regions Language", " ")
text <- str_replace_all(text, "Russian News Filters Source: Delfi", " ")
text <- str_replace_all(text, "Results Found 838 Timestamp", " ")
text <- str_replace_all(text, "All Companies Subject Political", "")
text <- str_replace_all(text, "Results Found 1,119 Timestamp", " ")
text <- str_replace_all(text, "Timestamp", " ")
text <- str_replace_all(text, "Russian News Filters Source: Postimees   Results Found 3,079", " ")
text <- str_replace_all(text, "Фото:", " ")
text <- str_replace_all(text, "Russian News Filters Source: Postimees   Results Found 3,079", " ")
text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source mke.ee", " ")
text <- str_replace_all(text, "(\n\")", " ")
text <- str_replace_all(text, "(\\n)", " ") 

text <- str_replace_all(text, "[а-яА-ЯёЁ]{1,9}+\\(+[0-9]{1,2}+\\)+\\s+\\s+\\s", " ")
text <- str_replace_all(text, "[а-яА-ЯёЁ]{1,9}+\\(+[0-9]{1,2}+\\)", " ") 
text <- str_replace_all(text, "[A-Za-z]{1,9}+\\(+[0-9]{1,2}+\\)", " ") 
text <- str_replace_all(text, "\\(+[0-9]{1,2}+\\)", " ")
text <- str_replace_all(text, "\"", " ") 

# kjøre denne to ganger for å renske 
text <- str_replace_all(text, "Or Postimees", " ")
text <- str_replace_all(text, "Author All Authors Company", " ")
text <- str_replace_all(text, "All Companies Subject Political ", " ")
text <- str_replace_all(text, "General News Industry All Industries Region All Regions Language", " ")
text <- str_replace_all(text, "Russian News Filters Source: Delfi", " ")
text <- str_replace_all(text, "Results Found 838 Timestamp", " ")
text <- str_replace_all(text, "All Companies Subject Political", "")
text <- str_replace_all(text, "Results Found 1,119 Timestamp", " ")
text <- str_replace_all(text, "Timestamp", " ")
text <- str_replace_all(text, "Russian News Filters Source: Postimees   Results Found 3,079", " ")
text <- str_replace_all(text, "Фото:", " ")
text <- str_replace_all(text, "Russian News Filters Source: Postimees   Results Found 3,079", " ")
text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source mke.ee", " ")



# SPLITTING AV SIDER
text_list <- str_split(text[1:8], pattern= "Factiva, Inc. All rights reserved.") # eller /n ?? ved linjeshift

substr(text_list[[3]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn

substr(text_list[[1]], 1, 300)
substr(text_list[[2]], 1, 300)
substr(text_list[[3]], 1, 300)
substr(text_list[[4]], 1, 300)
substr(text_list[[5]], 1, 300)
substr(text_list[[6]], 1, 300)
substr(text_list[[7]], 1, 300)
substr(text_list[[8]], 1, 300)


a<- 101
b <- a+101
c <- b+101
d <- c+101
e <- d+101
f <- e+101
g <- f+101
h <- g+98

tt<- print(c(a, b, c, d, e, f, g, h)) 



# LAGE TIBBLE
library(tidyverse)
tekster <- as_tibble(matrix(unlist(text_list))) 




# Juni forventet
(100*7)+97+8 # [1] 805
  
tekster # A tibble: 805 x 1

##### lage variabler #####

data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 0,
                       land = "Estland",
                       rusetn = "høy", 
                       rusmors = "høy", 
                       rusaffek = 2, 
                       FFPfragile = "lav",
                       Russortod = "middels",
                       Plassering = 1,
                       tekst = "ingress",
                       tid = "Juni", 
                       avis = "Postimees"), 
                  stringAsFactors = FALSE)


# sjekk om linjene stemmer 
Matrise <- matrix(unlist(text_list))
tt
substr(Matrise[101], 1, 300)
substr(Matrise[202], 1, 300)
substr(Matrise[303], 1, 300)
substr(Matrise[404], 1, 300)
substr(Matrise[505], 1, 300)
substr(Matrise[606], 1, 300)
substr(Matrise[707], 1, 300)
substr(Matrise[805], 1, 300)

# ser bra ut! 

# sjekk
dataFFsjekk <- data[c(101, 202, 303, 404, 505, 606, 707, 805), ] 
# kjør
dataFF <- data[-c(101, 202, 303, 404, 505, 606, 707, 805), ] 


library(quanteda)
corpusPosti <- corpus(dataFF)
corpusPosti$documents$texts
docvars(corpusPosti)
summary(corpusPosti)

save(corpusPosti, file = "~/Downloads/test/2019/Korpusnye/Corpus_Postimees_Juni.rda")
load("~/Downloads/test/2019/Korpusnye/Corpus_Postimees_Juni.rda")








                                                        ####
                                                  ##################
                                  #################### Сдйест #########################

                                ###########         # LITAUEN #            ############
                                          
                                                    ##   #   ##
                                        ###                               ###
                                              
                                              #########################




                                                        # ~ # 






                                                                  #
                                                # ############### 
                                                  ##
                                                  ##
                                                  ##
                                                  # ###### ## #
                                                  ##
                                                  ##
                                                  ##
                                                  ############# ##


                                            ##   ######  ELTA  ######  ##
                                               ## ikke Kreml-basert ##








# Kjøre alle Elta januar, feb, mars, april, mai på nytt
# pga 
# text <- str_replace_all(text, "ELTA+\\s+Вильнюс,", "") # ELTA Вильнюс, 



                                            ##### JANUAR #####     kjøre på nytt


# laste inn ELTA 


# Liste opp filer fra mappe

setwd("~/Downloads/test/2019")

liste <- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Litauen/Elta(18) /Januar"), 
                    full.names = TRUE)


library(pdftools)


# Bruker liste for å hente ut tekstene med pdf_text
Elta <- lapply(liste[1:6], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 


                                          ##########   lag dataframe   ###########

Eltaframe <- do.call(rbind, Elta)  
substr(Eltaframe$text[1], 1, 200)

library(stringr)


text <- str_trim(str_replace_all(Eltaframe$text,   "\\s+",  " ")) 


text_list <- str_split(text[1:6], pattern= "Document ")

substr(text_list[[2]], 1, 2000)
substr(text_list[1], 1,4000)

# text <- str_replace_all(text, "ELTA+\\s+Вильнюс,", "") # ELTA Вильнюс,


text <- str_replace_all(text, "(Russian)", "")   # da, virker
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}+\\s+Factiva, Inc. All rights reserved.", "BBB") 
text <- str_replace_all(text, " © 2019", "") # © 2019
text <- str_replace_all(text, "Литовское Агентство Новостей", "")  # Литовское Агентство Новостей
# Prøver å catche denne:       2019     Брюссель        ,   13            мая           .   
text <- str_replace_all(text, "2019+\\s+[а-яА-ЯёЁ]{1,10}+,+\\s+[0-9]{2}+\\s+[а-яА-ЯёЁ]{1,10}+.", "OOO") # bytt ut med små russiske bokstaver
#84 words  "[0-9]{1,3}+\\s+words"
text <- str_replace_all(text, "[0-9]{1,3}+\\s+words", "BBB")
#2019 Каунасский р-он., 18 мая.
text <- str_replace_all(text, "2019+\\s+[а-яА-ЯёЁ]{1,10}+\\s+р-он+\\s+.+\\s+,+\\s+[0-9]{2}+\\s[а-яА-ЯёЁ]{1,10}", "BBB") 
text <- str_replace_all(text, "2019+\\s+[а-яА-ЯёЁ]{1,10}+\\s+,+\\s+[0-9]{2}+\\s[а-яА-ЯёЁ]{1,10}", "BBB") 
text <- str_replace_all(text, "(ЭЛЬТА)", "000") #den tar det vekk på noen 
text <- str_replace_all(text, "(ЭЛЬТА).", "000") #den tar det vekk med 
text <- str_replace_all(text, "[0-9]{3}+\\s+words+\\s", "") #14 ou 149 words
text <- str_replace_all(text, "[0-9]{2}+\\s+words,", "") #14 words,
text <- str_replace_all(text, " /ТАСС/. ", " ") # /TACC/. 
text <- str_replace_all(text, "[0-9]{1,2}+\\s+May\\s+2019", "")  #dato May 2019
text <- str_replace_all(text, "[0-9]{1,2}+\\s+January\\s+2019", "")  #dato måned år
text <- str_replace_all(text, "[0-9]{1,2}+\\s+February\\s+2019", "")  # dato måned år
text <- str_replace_all(text, "[0-9]{1,2}+\\s+March\\s+2019", "")  # dato måned år
text <- str_replace_all(text, "[0-9]{1,2}+\\s+April\\s+2019", "")  #dato måned år
text <- str_replace_all(text, "[0-9]{1,2}+\\s+June\\s+2019", "") #dato måned år
text <- str_replace_all(text, "[0-9]{1,2}+\\s+July\\s+2019", "")  #dato måned år
text <- str_replace_all(text, "Литовское Агентство Новостей", "") #Литовское Агентство Новостей
text <- str_replace_all(text, "ELTAR Russian © ", "")  # ELTAR Russian © 
text <- str_replace_all(text, "2019 РИГА,\\s+[0-9]{1,2}+\\s+мая.", "")  #2019 РИГА, 20 мая.
text <- str_replace_all(text, "Or Lithuanian News Agency", "")
text <- str_replace_all(text, "- ELTA (Russian Language) Or 112.ua", "") 
text <- str_replace_all(text, "Or Unian (Ukraine, Russian Language)", "") 
text <- str_replace_all(text, "(Ukraine, Russian Language)", "")
text <- str_replace_all(text, " (Latvia, Russian Language)", "") 
text <- str_replace_all(text, "Or Vesti segodnia", "")
text <- str_replace_all(text, "All Companies Subject Political/General News Industry ", "") 
text <- str_replace_all(text,"Author All Authors Company ", "")
text <- str_replace_all(text, "All Industries Region All Regions Language", "") 
text <- str_replace_all(text, " Russian News Filters Source: ", "")
text <- str_replace_all(text, "Lithuanian News Agency - ELTA (Russian Language)", "") 
text <- str_replace_all(text, "Date:  - 31 December 2019 Results Found  ", "")
text <- str_replace_all(text, "Page 104 of 105 © 2019 Factiva, Inc. All rights reserved.", "") 
text <- str_replace_all(text, "АКТУАЛЬНО.", "") 
text <- str_replace_all(text, "2019 Вильнюс, 13 мая. (ЭЛЬТА).", "") 
text <- str_replace_all(text, "Search Summary", "000") 
text <- str_replace_all(text,"(Estonia, Russian Language) Or TVNET.lv (Russian Language)",  "000")
text <- str_replace_all(text, "Text Date In the last 5 years Source Delfi", "000") 
text <- str_replace_all(text, "Or Lithuanian News Agency - ELTA", "000")      
text <- str_replace_all(text, "(Russian Language)", "000")
text <- str_replace_all(text, " Or 112.ua (Ukraine, Russian Language) Or Unian (Ukraine, Russian Language)", "000")
text <- str_replace_all(text, " Or Vesti segodnia (Latvia, Russian Language)", "000")
text <- str_replace_all(text, "All Industries Region All Regions Language Russian News Filters Source:", "000")
text <- str_replace_all(text, " Lithuanian News Agency - ELTA (Russian Language)", "000")
text <- str_replace_all(text, "Estonia,", "000")
text <- str_replace_all(text, "Or TVNET.lv", "000")
text <- str_replace_all(text, " Or 112.ua ", "000")
text <- str_replace_all(text, "Or Unian ", "000")
text <- str_replace_all(text, " Latvia, ", "000") # kan ta den vekk fordi den er på latinske bokstaver
text <- str_replace_all(text, "Lithuanian News Agency - ELTA ", "000")
text <- str_replace_all(text, "(ELTA) 2019 Вильнюс, 13 мая. (ЭЛЬТА)", "000")
text <- str_replace_all(text, "2019 Вильнюс, 13 мая. (ЭЛЬТА). ", "000") # trygg
text <- str_replace_all(text, ". (ЭЛЬТА). ", "000")
text <- str_replace_all(text, "Lithuanian News Agency ", "000")
text <- str_replace_all(text, "Date:  - ", "000")
text <- str_replace_all(text, "31 December 2019 Results Found", "000")
text <- str_replace_all(text, "2019 Вильнюс, 13 мая.", "000")
text <- str_replace_all(text, "2019 Брюссель, 13 мая.", "000")
text <- str_replace_all(text, "Latvia, 0", " ")
text <- str_replace_all(text, "0002019+[0-9]{4}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+[0-9]{3}+[A-Za-z]{2}", "JEG KLARTE DET")
#R0002019 0513 ef 5 d 000 xd  
#R0002019 0513 ef 5 d 000 ul
text <- str_replace_all(text, "R0002019+[0-9]{4}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+[0-9]{4}+[A-Za-z]{1}", "JEG KLARTE DET")
text <- str_replace_all(text, "R0002019+[0-9]{4}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+[0-9]{5}", "JEG KLARTE DET")
text <- str_replace_all(text, "[0-9]{2}+\\s+[а-яА-ЯёЁ]{3}+\\s+[0-9]{3}+\\s+words+\\s+[0-9]{1,2}+\\s+[A-Za-z]{3}+\\s+[0-9]{4}", "") # 29 мая 232 words 20 May 2019
text <- str_replace_all(text, "[0-9]{3}+\\s+words", "000") #232 words 20 May 2019
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[а-яА-ЯёЁ].+\\s+/ТАСС/. ", "000")# 20 мая. /ТАСС/. 
text <- str_replace_all(text, "(ЭЛЬТА)", "")
text <- str_replace_all(text," [0-9]+[0-9]+:+[0-9]+[0-9],", "") # 11:45,
text<- str_replace_all(text, "News Filters Date:  2019 - 31 December 2019 Results Found 912 Timestamp", "")
text <- str_replace_all(text, "( Language)", "")
text <- str_replace_all(text,"[0-9]+[0-9]+:+[0-9]+[0-9]", "") # 09:52 etc 
text <- str_replace_all(text," [0-9]+[0-9]+:+[0-9]+[0-9]", "") #" 07:32 
text <- str_replace_all(text,",", ", ")      # ,  ,*[]
text <- str_replace_all(text,",  ", ", ")      # ,  ,*[] 
text <- str_replace_all(text," , ", "")      # ,  ,*[]   # alt med et mellomrom foran komma tas vekk 
text <- str_replace_all(text, "JEG KLARTE DET", " ")
text <- str_replace_all(text, "BBB", " ")
text <- str_replace_all(text, "000", " ")
text <- str_replace_all(text, "00", " ")
text <- str_replace_all(text, "   (   )   ( )   ( ) ()  ()  (  )   ( )  ", " ") # går ikke 
text <- str_replace_all(text, " All Industries Region All Regions", " ")
text <- str_replace_all(text, " News Filters Source: ", " ")
text <- str_replace_all(text, " - ELTA ", " ")
text <- str_replace_all(text, " 2, 324 Timestamp  9:56 ", " ")
text <- str_replace_all(text, "Ukraine, ", " ")
text <- str_replace_all(text, "Latvia, ", " ")
text <- str_replace_all(text, "\\(+\\s+\\)" , " ")
text <- str_replace_all(text, "\\(+\\)" , " ")

# Page 1 of 100 © 2019 Factiva, Inc. All rights reserved, klslett osv. 
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}+\\s+©+\\s+2019", "")
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}", "") #Page 110 of 111             Page 111 of 111
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", "")
text <- str_replace_all(text, "[0-9]{1}+\\,+\\s+[0-9]{3}+\\s+Timestamp", "")   # 2, 324 Timestamp
text <- str_replace_all(text, "[0-9]{1}+\\,+\\s+[0-9]{3}+\\s+\\s+Timestamp", "")   # 2, 324   Timestamp 
text <- str_replace_all(text, "[0-9]{1}+\\:+[0-9]{2}", "")  
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", "") # R 20190103ef13 5l 
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", "") # R 20190101ef11 02
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{2}", " ") # R 20190206ef26 gr
text <- str_replace_all (text, "R ", " ")
text <- str_replace_all(text, "Factiva, Inc. All rights reserved.", "")
#text <- str_replace_all(text, "\\(+ELTA+\\)+\\s+ELTAR+\\s+\\s+ВИЛЬНЮС", "") # (ELTA) ELTAR  ВИЛЬНЮС
#text <- str_replace_all(text, "\\(+ELTA+\\)+\\s+ELTAR+\\s+\\s+Вильнюс,", "") #  (ELTA) ELTAR  Вильнюс,
#text <- str_replace_all(text, "\\(+ELTA+\\)+\\s+ELTAR+\\s+\\s+ТАЛЛИН,", "") # (ELTA) ELTAR  ТАЛЛИН
text <- str_replace_all(text, "\\(+ELTA+\\)+\\s+ELTAR", "") # (ELTA) ELTAR
text <- str_replace_all(text, "\\(+ELTA+\\)", "") # (ELTA)
text <- str_replace_all(text, "ELTA  ТАСС,", "") #
# text <- str_replace_all(text, "ELTA+\\s+\\s+[а-яА-ЯёЁ]{1,10}+\\,", "") # ELTA Вильнюс, ELTA  Брюссель, ELTA  МОСКВА, ELTA  ТАЛЛИН, ELTA  ПАРИЖ, ELTA  
# text <- str_replace_all(text, "ELTA+\\s+[а-яА-ЯёЁ]{1,10}\\/+[а-яА-ЯёЁ]{1,10}+\\,", "") #  ELTA  Вильнюс/Гаага,
text <- str_replace_all(text, "ELTA", " ") #
text <- str_replace_all(text, "\"", " ") # 
text <- str_replace_all(text, "\"", " ") #
text <- str_replace_all(text, "(\")", " ")
# tatt vekk text <- str_replace_all(text, "\"+[а-яА-ЯёЁ]{1,10}", " ")
text <- str_replace_all(text, "(\")", " ")
# tatt vekk text <- str_replace_all(text, "\"+[а-яА-ЯёЁ]{1,10}", " ")



# SPLITTING AV SIDER
# splitte sider basert på mønster: 
text_list <- str_split(text[1:6], pattern= "Document")

# se her på teksten etterpå
substr(text_list[[5]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn


library(tidyverse)
#lage dataframe i stedet for matrix, den ble det av en rar grunn

tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble

##### JANUAR ####
24+13+(100*4)+6 # [1] 443

# antall tekster: 
tekster # A tibble: 443 x 1


data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 0,
                       land = "Litauen",
                       rusetn = "lav", 
                       rusmors = "lav", 
                       rusaffek = 3, 
                       FFPfragile = "lav",
                       Russortod = "lav",
                       Plassering = 1,
                       tekst = "hel",
                       tid = "Januar", 
                       avis = "Elta"), 
                  stringAsFactors = FALSE)

# se på hvor " " / tomme rader er . 
Matrise <- matrix(unlist(text_list))
# sjekk
dataFFsjekk <- data[c(14, 115, 216, 317, 418, 443), ]  # ser bra ut
# kjør
dataFF <- data[-c(14, 115, 216, 317, 418, 443), ] 


# måtte hatt mange flere land statistisk for å lage kontinuerlige variabler for å bli et poeng ut av 
library(quanteda)
corpusELTA <- corpus(dataFF)
corpusELTA$documents$texts
docvars(corpusELTA)
summary(corpusELTA)

# ekstremt viktig å lage nytt navn her
save(corpusELTA, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_ELTA_Januar.rda")
load("~/Downloads/test/2019/Korpusnye/Corpus_ELTA_Januar.rda")






                                            ########## FEBRUAR #############     kjøre på nytt




# laste inn ELTA 


# Liste opp filer fra mappe

setwd("~/Downloads/test/2019")


liste <- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Litauen/Elta(18) /Februar"), 
                    full.names = TRUE)


library(pdftools)


# Bruker liste for å hente ut tekstene med pdf_text
Elta <- lapply(liste[1:5], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 


##########   lag dataframe   ###########

### Eltaframe #### radbinde Elta i et frame
Eltaframe <- do.call(rbind, Elta)  # do call brukes for funksjon på liste, r bind radbinder listen

substr(Eltaframe$text[1], 1, 200) # teskt en, 200 ord - ikke nødvendig


# ta vekk withespace
# samtidig lager tilfeldigvis om til character og ikke dataframe
library(stringr)

### LAGE TEKSTEN OG FJERNE TEKST ###
text <- str_trim(str_replace_all(Eltaframe$text,   "\\s+",  " ")) 

text_list <- str_split(text[1:5], pattern= "Document ")

substr(text_list[[2]], 1, 2000)
substr(text_list[1], 1,4000)



##########################################################################################################################################

# fare for å miste andre datoer med å ta vekk datoer på russisk. kan ta med når det står ved siden av sted publisert.
# men aloritmen tar hensyn, ved at f eks 9.mai vil nevnes mye oftere, usystematisk, hvis den er viktig, sammenlignet med 
# andre ord.

# NB har tatt bort /TACC/ da tok så mye plass av 
##########################################################################################################################################

# text <- str_replace_all(text, "ELTA+\\s+Вильнюс,", "") # ELTA Вильнюс,

text <- str_replace_all(text, "(Russian)", "")   # da, virker
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}+\\s+Factiva, Inc. All rights reserved.", "BBB") 
text <- str_replace_all(text, " © 2019", "") # © 2019
text <- str_replace_all(text, "Литовское Агентство Новостей", "")  # Литовское Агентство Новостей
# Prøver å catche denne:       2019     Брюссель        ,   13            мая           .   
text <- str_replace_all(text, "2019+\\s+[а-яА-ЯёЁ]{1,10}+,+\\s+[0-9]{2}+\\s+[а-яА-ЯёЁ]{1,10}+.", "OOO") # bytt ut med små russiske bokstaver
#84 words  "[0-9]{1,3}+\\s+words"
text <- str_replace_all(text, "[0-9]{1,3}+\\s+words", "BBB")
#2019 Каунасский р-он., 18 мая.
text <- str_replace_all(text, "2019+\\s+[а-яА-ЯёЁ]{1,10}+\\s+р-он+\\s+.+\\s+,+\\s+[0-9]{2}+\\s[а-яА-ЯёЁ]{1,10}", "BBB") 
text <- str_replace_all(text, "2019+\\s+[а-яА-ЯёЁ]{1,10}+\\s+,+\\s+[0-9]{2}+\\s[а-яА-ЯёЁ]{1,10}", "BBB") 
text <- str_replace_all(text, "(ЭЛЬТА)", "000") #den tar det vekk på noen 
text <- str_replace_all(text, "(ЭЛЬТА).", "000") #den tar det vekk med 
text <- str_replace_all(text, "[0-9]{3}+\\s+words+\\s", "") #14 ou 149 words
text <- str_replace_all(text, "[0-9]{2}+\\s+words,", "") #14 words,
text <- str_replace_all(text, " /ТАСС/. ", " ") # /TACC/. 
text <- str_replace_all(text, "[0-9]{1,2}+\\s+May\\s+2019", "")  #dato May 2019
text <- str_replace_all(text, "[0-9]{1,2}+\\s+January\\s+2019", "")  #dato måned år
text <- str_replace_all(text, "[0-9]{1,2}+\\s+February\\s+2019", "")  # dato måned år
text <- str_replace_all(text, "[0-9]{1,2}+\\s+March\\s+2019", "")  # dato måned år
text <- str_replace_all(text, "[0-9]{1,2}+\\s+April\\s+2019", "")  #dato måned år
text <- str_replace_all(text, "[0-9]{1,2}+\\s+June\\s+2019", "") #dato måned år
text <- str_replace_all(text, "[0-9]{1,2}+\\s+July\\s+2019", "")  #dato måned år
text <- str_replace_all(text, "Литовское Агентство Новостей", "") #Литовское Агентство Новостей
text <- str_replace_all(text, "ELTAR Russian © ", "")  # ELTAR Russian © 
text <- str_replace_all(text, "2019 РИГА,\\s+[0-9]{1,2}+\\s+мая.", "")  #2019 РИГА, 20 мая.
text <- str_replace_all(text, "Or Lithuanian News Agency", "")
text <- str_replace_all(text, "- ELTA (Russian Language) Or 112.ua", "") 
text <- str_replace_all(text, "Or Unian (Ukraine, Russian Language)", "") 
text <- str_replace_all(text, "(Ukraine, Russian Language)", "")
text <- str_replace_all(text, " (Latvia, Russian Language)", "") 
text <- str_replace_all(text, "Or Vesti segodnia", "")
text <- str_replace_all(text, "All Companies Subject Political/General News Industry ", "") 
text <- str_replace_all(text,"Author All Authors Company ", "")
text <- str_replace_all(text, "All Industries Region All Regions Language", "") 
text <- str_replace_all(text, " Russian News Filters Source: ", "")
text <- str_replace_all(text, "Lithuanian News Agency - ELTA (Russian Language)", "") 
text <- str_replace_all(text, "Date:  - 31 December 2019 Results Found  ", "")
text <- str_replace_all(text, "Page 104 of 105 © 2019 Factiva, Inc. All rights reserved.", "") 
text <- str_replace_all(text, "АКТУАЛЬНО.", "") 
text <- str_replace_all(text, "2019 Вильнюс, 13 мая. (ЭЛЬТА).", "") 
text <- str_replace_all(text, "Search Summary", "000") 
text <- str_replace_all(text,"(Estonia, Russian Language) Or TVNET.lv (Russian Language)",  "000")
text <- str_replace_all(text, "Text Date In the last 5 years Source Delfi", "000") 
text <- str_replace_all(text, "Or Lithuanian News Agency - ELTA", "000")      
text <- str_replace_all(text, "(Russian Language)", "000")
text <- str_replace_all(text, " Or 112.ua (Ukraine, Russian Language) Or Unian (Ukraine, Russian Language)", "000")
text <- str_replace_all(text, " Or Vesti segodnia (Latvia, Russian Language)", "000")
text <- str_replace_all(text, "All Industries Region All Regions Language Russian News Filters Source:", "000")
text <- str_replace_all(text, " Lithuanian News Agency - ELTA (Russian Language)", "000")
text <- str_replace_all(text, "Estonia,", "000")
text <- str_replace_all(text, "Or TVNET.lv", "000")
text <- str_replace_all(text, " Or 112.ua ", "000")
text <- str_replace_all(text, "Or Unian ", "000")
text <- str_replace_all(text, " Latvia, ", "000") # kan ta den vekk fordi den er på latinske bokstaver
text <- str_replace_all(text, "Lithuanian News Agency - ELTA ", "000")
text <- str_replace_all(text, "(ELTA) 2019 Вильнюс, 13 мая. (ЭЛЬТА)", "000")
text <- str_replace_all(text, "2019 Вильнюс, 13 мая. (ЭЛЬТА). ", "000") # trygg
text <- str_replace_all(text, ". (ЭЛЬТА). ", "000")
text <- str_replace_all(text, "Lithuanian News Agency ", "000")
text <- str_replace_all(text, "Date:  - ", "000")
text <- str_replace_all(text, "31 December 2019 Results Found", "000")
text <- str_replace_all(text, "2019 Вильнюс, 13 мая.", "000")
text <- str_replace_all(text, "2019 Брюссель, 13 мая.", "000")
text <- str_replace_all(text, "Latvia, 0", " ")
text <- str_replace_all(text, "0002019+[0-9]{4}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+[0-9]{3}+[A-Za-z]{2}", "JEG KLARTE DET")
#R0002019 0513 ef 5 d 000 xd  
#R0002019 0513 ef 5 d 000 ul
text <- str_replace_all(text, "R0002019+[0-9]{4}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+[0-9]{4}+[A-Za-z]{1}", "JEG KLARTE DET")
text <- str_replace_all(text, "R0002019+[0-9]{4}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+[0-9]{5}", "JEG KLARTE DET")
text <- str_replace_all(text, "[0-9]{2}+\\s+[а-яА-ЯёЁ]{3}+\\s+[0-9]{3}+\\s+words+\\s+[0-9]{1,2}+\\s+[A-Za-z]{3}+\\s+[0-9]{4}", "") # 29 мая 232 words 20 May 2019
text <- str_replace_all(text, "[0-9]{3}+\\s+words", "000") #232 words 20 May 2019
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[а-яА-ЯёЁ].+\\s+/ТАСС/. ", "000")# 20 мая. /ТАСС/. 
text <- str_replace_all(text, "(ЭЛЬТА)", "")
text <- str_replace_all(text," [0-9]+[0-9]+:+[0-9]+[0-9],", "") # 11:45,
text<- str_replace_all(text, "News Filters Date:  2019 - 31 December 2019 Results Found 912 Timestamp", "")
text <- str_replace_all(text, "( Language)", "")
text <- str_replace_all(text,"[0-9]+[0-9]+:+[0-9]+[0-9]", "") # 09:52 etc 
text <- str_replace_all(text," [0-9]+[0-9]+:+[0-9]+[0-9]", "") #" 07:32 
text <- str_replace_all(text,",", ", ")      # ,  ,*[]
text <- str_replace_all(text,",  ", ", ")      # ,  ,*[] 
text <- str_replace_all(text," , ", "")      # ,  ,*[]   # alt med et mellomrom foran komma tas vekk 
text <- str_replace_all(text, "JEG KLARTE DET", " ")
text <- str_replace_all(text, "BBB", " ")
text <- str_replace_all(text, "000", " ")
text <- str_replace_all(text, "00", " ")
text <- str_replace_all(text, "   (   )   ( )   ( ) ()  ()  (  )   ( )  ", " ") # går ikke 
text <- str_replace_all(text, " All Industries Region All Regions", " ")
text <- str_replace_all(text, " News Filters Source: ", " ")
text <- str_replace_all(text, " - ELTA ", " ")
text <- str_replace_all(text, " 2, 324 Timestamp  9:56 ", " ")
text <- str_replace_all(text, "Ukraine, ", " ")
text <- str_replace_all(text, "Latvia, ", " ")
text <- str_replace_all(text, "\\(+\\s+\\)" , " ")
text <- str_replace_all(text, "\\(+\\)" , " ")

# Page 1 of 100 © 2019 Factiva, Inc. All rights reserved, klslett osv. 
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}+\\s+©+\\s+2019", "")
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}", "") #Page 110 of 111             Page 111 of 111
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", "")
text <- str_replace_all(text, "[0-9]{1}+\\,+\\s+[0-9]{3}+\\s+Timestamp", "")   # 2, 324 Timestamp
text <- str_replace_all(text, "[0-9]{1}+\\,+\\s+[0-9]{3}+\\s+\\s+Timestamp", "")   # 2, 324   Timestamp 
text <- str_replace_all(text, "[0-9]{1}+\\:+[0-9]{2}", "")  
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", "") # R 20190103ef13 5l 
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", "") # R 20190101ef11 02
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{2}", " ") # R 20190206ef26 gr
text <- str_replace_all (text, "R ", " ")
text <- str_replace_all(text, "Factiva, Inc. All rights reserved.", "")
#text <- str_replace_all(text, "\\(+ELTA+\\)+\\s+ELTAR+\\s+\\s+ВИЛЬНЮС", "") # (ELTA) ELTAR  ВИЛЬНЮС
#text <- str_replace_all(text, "\\(+ELTA+\\)+\\s+ELTAR+\\s+\\s+Вильнюс,", "") #  (ELTA) ELTAR  Вильнюс,

#text <- str_replace_all(text, "\\(+ELTA+\\)+\\s+ELTAR+\\s+\\s+ТАЛЛИН,", "") # (ELTA) ELTAR  ТАЛЛИН
text <- str_replace_all(text, "\\(+ELTA+\\)+\\s+ELTAR", "") # (ELTA) ELTAR
text <- str_replace_all(text, "\\(+ELTA+\\)", "") # (ELTA)
text <- str_replace_all(text, "ELTA  ТАСС,", "") #
# text <- str_replace_all(text, "ELTA+\\s+\\s+[а-яА-ЯёЁ]{1,10}+\\,", "") # ELTA Вильнюс, ELTA  Брюссель, ELTA  МОСКВА, ELTA  ТАЛЛИН, ELTA  ПАРИЖ, ELTA  
# text <- str_replace_all(text, "ELTA+\\s+[а-яА-ЯёЁ]{1,10}\\/+[а-яА-ЯёЁ]{1,10}+\\,", "") #  ELTA  Вильнюс/Гаага,
text <- str_replace_all(text, "ELTA", " ") #
text <- str_replace_all(text, "\"", " ") # 
text <- str_replace_all(text, "\"", " ") #
text <- str_replace_all(text, "(\")", " ")
# tatt vekk text <- str_replace_all(text, "\"+[а-яА-ЯёЁ]{1,10}", " ")

 
text_list <- str_split(text[1:5], pattern= "Document ")

substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)  


library(tidyverse)

tekster <- as_tibble(matrix(unlist(text_list)))  #dataframe til matrix, til tibble



### FEBRUAR ###

87+87+(100*3)+5 #[1] 479

tekster # A tibble: 479 x 1



data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 0,
                       land = "Litauen",
                       rusetn = "lav", 
                       rusmors = "lav", 
                       rusaffek = 3, 
                       FFPfragile = "lav",
                       Russortod = "lav",
                       Plassering = 1,
                       tekst = "hel",
                       tid = "Februar", 
                       avis = "Elta"), 
                  stringAsFactors = FALSE)


Matrise <- matrix(unlist(text_list))

# sjekk
dataFFsjekk <- data[c(88, 189, 290, 391, 479), ] 
# kjør
dataFF <- data[-c(88, 189, 290, 391, 479), ] 


# måtte hatt mange flere land statistisk for å lage kontinuerlige variabler for å bli et poeng ut av 
library(quanteda)
corpusELTA <- corpus(dataFF)
corpusELTA$documents$texts
docvars(corpusELTA)
summary(corpusELTA)

# ekstremt viktig å lage nytt navn her
save(corpusELTA, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_ELTA_Februar.rda")
load("~/Downloads/test/2019/Korpusnye/Corpus_ELTA_Februar.rda")







                              ##################### MARS ################################




setwd("~/Downloads/test/2019")

liste <- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Litauen/Elta(18) /Mars"), 
                    full.names = TRUE)

library(pdftools)

Elta <- lapply(liste[1:7], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 


Eltaframe <- do.call(rbind, Elta)  # do call brukes for funksjon på liste, r bind radbinder listen
substr(Eltaframe$text[1], 1, 200)

library(stringr)

### LAGE TEKSTEN OG FJERNE TEKST ###
text <- str_trim(str_replace_all(Eltaframe$text,   "\\s+",  " "))  # nå blir den character og ikke frame

text_list <- str_split(text[1:7], pattern= "Document ") # Ser ut til at to artikler blir "borte" når jeg deler med Document ElTA eller E, 
# selv om selve PDF-ene ikke gir en indikasjon på det burde bli slik.. 

substr(text_list[[2]], 1, 2000)
substr(text_list[1], 1,4000)


text <- str_replace_all(text, "(Russian)", "")   # da, virker
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}+\\s+Factiva, Inc. All rights reserved.", "BBB") 
text <- str_replace_all(text, " © 2019", "") # © 2019
text <- str_replace_all(text, "Литовское Агентство Новостей", "")  # Литовское Агентство Новостей
# Prøver å catche denne:       2019     Брюссель        ,   13            мая           .   
text <- str_replace_all(text, "2019+\\s+[а-яА-ЯёЁ]{1,10}+,+\\s+[0-9]{2}+\\s+[а-яА-ЯёЁ]{1,10}+.", "OOO") # bytt ut med små russiske bokstaver
#84 words  "[0-9]{1,3}+\\s+words"
text <- str_replace_all(text, "[0-9]{1,3}+\\s+words", "BBB")
#2019 Каунасский р-он., 18 мая.
text <- str_replace_all(text, "2019+\\s+[а-яА-ЯёЁ]{1,10}+\\s+р-он+\\s+.+\\s+,+\\s+[0-9]{2}+\\s[а-яА-ЯёЁ]{1,10}", "BBB") 
text <- str_replace_all(text, "2019+\\s+[а-яА-ЯёЁ]{1,10}+\\s+,+\\s+[0-9]{2}+\\s[а-яА-ЯёЁ]{1,10}", "BBB") 
text <- str_replace_all(text, "(ЭЛЬТА)", "000") #den tar det vekk på noen 
text <- str_replace_all(text, "(ЭЛЬТА).", "000") #den tar det vekk med 
text <- str_replace_all(text, "[0-9]{3}+\\s+words+\\s", "") #14 ou 149 words
text <- str_replace_all(text, "[0-9]{2}+\\s+words,", "") #14 words,
text <- str_replace_all(text, " /ТАСС/. ", " ") # /TACC/. 
text <- str_replace_all(text, "[0-9]{1,2}+\\s+May\\s+2019", "")  #dato May 2019
text <- str_replace_all(text, "[0-9]{1,2}+\\s+January\\s+2019", "")  #dato måned år
text <- str_replace_all(text, "[0-9]{1,2}+\\s+February\\s+2019", "")  # dato måned år
text <- str_replace_all(text, "[0-9]{1,2}+\\s+March\\s+2019", "")  # dato måned år
text <- str_replace_all(text, "[0-9]{1,2}+\\s+April\\s+2019", "")  #dato måned år
text <- str_replace_all(text, "[0-9]{1,2}+\\s+June\\s+2019", "") #dato måned år
text <- str_replace_all(text, "[0-9]{1,2}+\\s+July\\s+2019", "")  #dato måned år
text <- str_replace_all(text, "Литовское Агентство Новостей", "") #Литовское Агентство Новостей
text <- str_replace_all(text, "ELTAR Russian © ", "")  # ELTAR Russian © 
text <- str_replace_all(text, "2019 РИГА,\\s+[0-9]{1,2}+\\s+мая.", "")  #2019 РИГА, 20 мая.
text <- str_replace_all(text, "Or Lithuanian News Agency", "")
text <- str_replace_all(text, "- ELTA (Russian Language) Or 112.ua", "") 
text <- str_replace_all(text, "Or Unian (Ukraine, Russian Language)", "") 
text <- str_replace_all(text, "(Ukraine, Russian Language)", "")
text <- str_replace_all(text, " (Latvia, Russian Language)", "") 
text <- str_replace_all(text, "Or Vesti segodnia", "")
text <- str_replace_all(text, "All Companies Subject Political/General News Industry ", "") 
text <- str_replace_all(text,"Author All Authors Company ", "")
text <- str_replace_all(text, "All Industries Region All Regions Language", "") 
text <- str_replace_all(text, " Russian News Filters Source: ", "")
text <- str_replace_all(text, "Lithuanian News Agency - ELTA (Russian Language)", "") 
text <- str_replace_all(text, "Date:  - 31 December 2019 Results Found  ", "")
text <- str_replace_all(text, "Page 104 of 105 © 2019 Factiva, Inc. All rights reserved.", "") 
text <- str_replace_all(text, "АКТУАЛЬНО.", "") 
text <- str_replace_all(text, "2019 Вильнюс, 13 мая. (ЭЛЬТА).", "") 
text <- str_replace_all(text, "Search Summary", "000") 
text <- str_replace_all(text,"(Estonia, Russian Language) Or TVNET.lv (Russian Language)",  "000")
text <- str_replace_all(text, "Text Date In the last 5 years Source Delfi", "000") 
text <- str_replace_all(text, "Or Lithuanian News Agency - ELTA", "000")      
text <- str_replace_all(text, "(Russian Language)", "000")
text <- str_replace_all(text, " Or 112.ua (Ukraine, Russian Language) Or Unian (Ukraine, Russian Language)", "000")
text <- str_replace_all(text, " Or Vesti segodnia (Latvia, Russian Language)", "000")
text <- str_replace_all(text, "All Industries Region All Regions Language Russian News Filters Source:", "000")
text <- str_replace_all(text, " Lithuanian News Agency - ELTA (Russian Language)", "000")
text <- str_replace_all(text, "Estonia,", "000")
text <- str_replace_all(text, "Or TVNET.lv", "000")
text <- str_replace_all(text, " Or 112.ua ", "000")
text <- str_replace_all(text, "Or Unian ", "000")
text <- str_replace_all(text, " Latvia, ", "000") # kan ta den vekk fordi den er på latinske bokstaver
text <- str_replace_all(text, "Lithuanian News Agency - ELTA ", "000")
text <- str_replace_all(text, "(ELTA) 2019 Вильнюс, 13 мая. (ЭЛЬТА)", "000")
text <- str_replace_all(text, "2019 Вильнюс, 13 мая. (ЭЛЬТА). ", "000") # trygg
text <- str_replace_all(text, ". (ЭЛЬТА). ", "000")
text <- str_replace_all(text, "Lithuanian News Agency ", "000")
text <- str_replace_all(text, "Date:  - ", "000")
text <- str_replace_all(text, "31 December 2019 Results Found", "000")
text <- str_replace_all(text, "2019 Вильнюс, 13 мая.", "000")
text <- str_replace_all(text, "2019 Брюссель, 13 мая.", "000")
text <- str_replace_all(text, "Latvia, 0", " ")
text <- str_replace_all(text, "0002019+[0-9]{4}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+[0-9]{3}+[A-Za-z]{2}", "JEG KLARTE DET")
#R0002019 0513 ef 5 d 000 xd  
#R0002019 0513 ef 5 d 000 ul
text <- str_replace_all(text, "R0002019+[0-9]{4}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+[0-9]{4}+[A-Za-z]{1}", "JEG KLARTE DET")
text <- str_replace_all(text, "R0002019+[0-9]{4}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+[0-9]{5}", "JEG KLARTE DET")
text <- str_replace_all(text, "[0-9]{2}+\\s+[а-яА-ЯёЁ]{3}+\\s+[0-9]{3}+\\s+words+\\s+[0-9]{1,2}+\\s+[A-Za-z]{3}+\\s+[0-9]{4}", "") # 29 мая 232 words 20 May 2019
text <- str_replace_all(text, "[0-9]{3}+\\s+words", "000") #232 words 20 May 2019
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[а-яА-ЯёЁ].+\\s+/ТАСС/. ", "000")# 20 мая. /ТАСС/. 
text <- str_replace_all(text, "(ЭЛЬТА)", "")
text <- str_replace_all(text," [0-9]+[0-9]+:+[0-9]+[0-9],", "") # 11:45,
text<- str_replace_all(text, "News Filters Date:  2019 - 31 December 2019 Results Found 912 Timestamp", "")
text <- str_replace_all(text, "( Language)", "")
text <- str_replace_all(text,"[0-9]+[0-9]+:+[0-9]+[0-9]", "") # 09:52 etc 
text <- str_replace_all(text," [0-9]+[0-9]+:+[0-9]+[0-9]", "") #" 07:32 
text <- str_replace_all(text,",", ", ")      # ,  ,*[]
text <- str_replace_all(text,",  ", ", ")      # ,  ,*[] 
text <- str_replace_all(text," , ", "")      # ,  ,*[]   # alt med et mellomrom foran komma tas vekk 
text <- str_replace_all(text, "JEG KLARTE DET", " ")
text <- str_replace_all(text, "BBB", " ")
text <- str_replace_all(text, "000", " ")
text <- str_replace_all(text, "00", " ")
text <- str_replace_all(text, "   (   )   ( )   ( ) ()  ()  (  )   ( )  ", " ") # går ikke 
text <- str_replace_all(text, " All Industries Region All Regions", " ")
text <- str_replace_all(text, " News Filters Source: ", " ")
text <- str_replace_all(text, " - ELTA ", " ")
text <- str_replace_all(text, " 2, 324 Timestamp  9:56 ", " ")
text <- str_replace_all(text, "Ukraine, ", " ")
text <- str_replace_all(text, "Latvia, ", " ")
text <- str_replace_all(text, "\\(+\\s+\\)" , " ")
text <- str_replace_all(text, "\\(+\\)" , " ")

# Page 1 of 100 © 2019 Factiva, Inc. All rights reserved, klslett osv. 
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}+\\s+©+\\s+2019", "")
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}", "") #Page 110 of 111             Page 111 of 111
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", "")
text <- str_replace_all(text, "[0-9]{1}+\\,+\\s+[0-9]{3}+\\s+Timestamp", "")   # 2, 324 Timestamp
text <- str_replace_all(text, "[0-9]{1}+\\,+\\s+[0-9]{3}+\\s+\\s+Timestamp", "")   # 2, 324   Timestamp 
text <- str_replace_all(text, "[0-9]{1}+\\:+[0-9]{2}", "")  
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", "") # R 20190103ef13 5l 
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", "") # R 20190101ef11 02
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{2}", " ") # R 20190206ef26 gr
text <- str_replace_all (text, "R ", " ")
text <- str_replace_all(text, "Factiva, Inc. All rights reserved.", "")
#text <- str_replace_all(text, "\\(+ELTA+\\)+\\s+ELTAR+\\s+\\s+ВИЛЬНЮС", "") # (ELTA) ELTAR  ВИЛЬНЮС
#text <- str_replace_all(text, "\\(+ELTA+\\)+\\s+ELTAR+\\s+\\s+Вильнюс,", "") #  (ELTA) ELTAR  Вильнюс,
# text <- str_replace_all(text, "ELTA+\\s+Вильнюс,", "") # ELTA Вильнюс,
#text <- str_replace_all(text, "\\(+ELTA+\\)+\\s+ELTAR+\\s+\\s+ТАЛЛИН,", "") # (ELTA) ELTAR  ТАЛЛИН
text <- str_replace_all(text, "\\(+ELTA+\\)+\\s+ELTAR", "") # (ELTA) ELTAR
text <- str_replace_all(text, "\\(+ELTA+\\)", "") # (ELTA)
text <- str_replace_all(text, "ELTA  ТАСС,", "") #
# text <- str_replace_all(text, "ELTA+\\s+\\s+[а-яА-ЯёЁ]{1,10}+\\,", "") # ELTA Вильнюс, ELTA  Брюссель, ELTA  МОСКВА, ELTA  ТАЛЛИН, ELTA  ПАРИЖ, ELTA  
# text <- str_replace_all(text, "ELTA+\\s+[а-яА-ЯёЁ]{1,10}\\/+[а-яА-ЯёЁ]{1,10}+\\,", "") #  ELTA  Вильнюс/Гаага,
text <- str_replace_all(text, "ELTA", " ") #
text <- str_replace_all(text, "\"", " ") # 
text <- str_replace_all(text, "\"", " ") #
text <- str_replace_all(text, "(\")", " ")
# tatt vekk text <- str_replace_all(text, "\"+[а-яА-ЯёЁ]{1,10}", " ")
# text <- str_replace_all(text, "ПОЛИТИКА ", "") # ПОЛИТИКА
# text <- str_replace_all(text, "ПРЕЗИДЕНТУРА", "") # ПРЕЗИДЕНТУРА


text_list <- str_split(text[1:7], pattern= "Document ")

substr(text_list[[5]], 1, 4000)
substr(text_list[2], 1,4000)  


library(tidyverse)
tekster <- as_tibble(matrix(unlist(text_list)))  #dataframe til matrix, til tibble



### MARS ###
86+13+(100*5)+7 #[1] 606

# noe er annerledes i 5 art 88, 6 art 
# vikti gå inne ut av: om alle tekster er tatt med. intr å se hvorfro d ble slik her. 

tekster
# A tibble: 604 x 1
# etter mye jobb:  A tibble: 606 x 1





data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 0,
                       land = "Litauen",
                       rusetn = "lav", 
                       rusmors = "lav", 
                       rusaffek = 3, 
                       FFPfragile = "lav",
                       Russortod = "lav",
                       Plassering = 1,
                       tekst = "hel",
                       tid = "Mars", 
                       avis = "Elta"), 
                  stringAsFactors = FALSE)

Matrise <- matrix(unlist(text_list))

# sjekk
dataFFsjekk <- data[c(87, 188, 289, 390, 491, 592, 606), ]  # tom

# kjør
dataFF <- data[-c(87, 188, 289, 390, 491, 592, 606), ] 



library(quanteda)
corpusELTA <- corpus(dataFF)
corpusELTA$documents$texts
docvars(corpusELTA)
summary(corpusELTA)

save(corpusELTA, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_ELTA_Mars.rda")
load("~/Downloads/test/2019/Korpusnye/Corpus_ELTA_Mars.rda")





############################# APRIL ########################### kjøre på nytt



setwd("~/Downloads/test/2019")

liste <- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Litauen/Elta(18) /April"), 
                    full.names = TRUE)

library(pdftools)

Elta <- lapply(liste[1:6], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 


Eltaframe <- do.call(rbind, Elta)  # do call brukes for funksjon på liste, r bind radbinder listen
substr(Eltaframe$text[1], 1, 200)

library(stringr)

### LAGE TEKSTEN OG FJERNE TEKST ###
text <- str_trim(str_replace_all(Eltaframe$text,   "\\s+",  " "))  # nå blir den character og ikke frame

text_list <- str_split(text[1:6], pattern= "Document ") 

substr(text_list[[2]], 1, 2000)
substr(text_list[1], 1,4000)

text <- str_replace_all(text, "(Russian)", "")   # da, virker
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}+\\s+Factiva, Inc. All rights reserved.", "BBB") 
text <- str_replace_all(text, " © 2019", "") # © 2019
text <- str_replace_all(text, "Литовское Агентство Новостей", "")  # Литовское Агентство Новостей
# Prøver å catche denne:       2019     Брюссель        ,   13            мая           .   
text <- str_replace_all(text, "2019+\\s+[а-яА-ЯёЁ]{1,10}+,+\\s+[0-9]{2}+\\s+[а-яА-ЯёЁ]{1,10}+.", "OOO") # bytt ut med små russiske bokstaver
#84 words  "[0-9]{1,3}+\\s+words"
text <- str_replace_all(text, "[0-9]{1,3}+\\s+words", "BBB")
#2019 Каунасский р-он., 18 мая.
text <- str_replace_all(text, "2019+\\s+[а-яА-ЯёЁ]{1,10}+\\s+р-он+\\s+.+\\s+,+\\s+[0-9]{2}+\\s[а-яА-ЯёЁ]{1,10}", "BBB") 
text <- str_replace_all(text, "2019+\\s+[а-яА-ЯёЁ]{1,10}+\\s+,+\\s+[0-9]{2}+\\s[а-яА-ЯёЁ]{1,10}", "BBB") 
text <- str_replace_all(text, "(ЭЛЬТА)", "000") #den tar det vekk på noen 
text <- str_replace_all(text, "(ЭЛЬТА).", "000") #den tar det vekk med 
text <- str_replace_all(text, "[0-9]{3}+\\s+words+\\s", "") #14 ou 149 words
text <- str_replace_all(text, "[0-9]{2}+\\s+words,", "") #14 words,
text <- str_replace_all(text, " /ТАСС/. ", " ") # /TACC/. 
text <- str_replace_all(text, "[0-9]{1,2}+\\s+May\\s+2019", "")  #dato May 2019
text <- str_replace_all(text, "[0-9]{1,2}+\\s+January\\s+2019", "")  #dato måned år
text <- str_replace_all(text, "[0-9]{1,2}+\\s+February\\s+2019", "")  # dato måned år
text <- str_replace_all(text, "[0-9]{1,2}+\\s+March\\s+2019", "")  # dato måned år
text <- str_replace_all(text, "[0-9]{1,2}+\\s+April\\s+2019", "")  #dato måned år
text <- str_replace_all(text, "[0-9]{1,2}+\\s+June\\s+2019", "") #dato måned år
text <- str_replace_all(text, "[0-9]{1,2}+\\s+July\\s+2019", "")  #dato måned år
text <- str_replace_all(text, "Литовское Агентство Новостей", "") #Литовское Агентство Новостей
text <- str_replace_all(text, "ELTAR Russian © ", "")  # ELTAR Russian © 
text <- str_replace_all(text, "2019 РИГА,\\s+[0-9]{1,2}+\\s+мая.", "")  #2019 РИГА, 20 мая.
text <- str_replace_all(text, "Or Lithuanian News Agency", "")
text <- str_replace_all(text, "- ELTA (Russian Language) Or 112.ua", "") 
text <- str_replace_all(text, "Or Unian (Ukraine, Russian Language)", "") 
text <- str_replace_all(text, "(Ukraine, Russian Language)", "")
text <- str_replace_all(text, " (Latvia, Russian Language)", "") 
text <- str_replace_all(text, "Or Vesti segodnia", "")
text <- str_replace_all(text, "All Companies Subject Political/General News Industry ", "") 
text <- str_replace_all(text,"Author All Authors Company ", "")
text <- str_replace_all(text, "All Industries Region All Regions Language", "") 
text <- str_replace_all(text, " Russian News Filters Source: ", "")
text <- str_replace_all(text, "Lithuanian News Agency - ELTA (Russian Language)", "") 
text <- str_replace_all(text, "Date:  - 31 December 2019 Results Found  ", "")
text <- str_replace_all(text, "Page 104 of 105 © 2019 Factiva, Inc. All rights reserved.", "") 
text <- str_replace_all(text, "АКТУАЛЬНО.", "") 
text <- str_replace_all(text, "2019 Вильнюс, 13 мая. (ЭЛЬТА).", "") 
text <- str_replace_all(text, "Search Summary", "000") 
text <- str_replace_all(text,"(Estonia, Russian Language) Or TVNET.lv (Russian Language)",  "000")
text <- str_replace_all(text, "Text Date In the last 5 years Source Delfi", "000") 
text <- str_replace_all(text, "Or Lithuanian News Agency - ELTA", "000")      
text <- str_replace_all(text, "(Russian Language)", "000")
text <- str_replace_all(text, " Or 112.ua (Ukraine, Russian Language) Or Unian (Ukraine, Russian Language)", "000")
text <- str_replace_all(text, " Or Vesti segodnia (Latvia, Russian Language)", "000")
text <- str_replace_all(text, "All Industries Region All Regions Language Russian News Filters Source:", "000")
text <- str_replace_all(text, " Lithuanian News Agency - ELTA (Russian Language)", "000")
text <- str_replace_all(text, "Estonia,", "000")
text <- str_replace_all(text, "Or TVNET.lv", "000")
text <- str_replace_all(text, " Or 112.ua ", "000")
text <- str_replace_all(text, "Or Unian ", "000")
text <- str_replace_all(text, " Latvia, ", "000") # kan ta den vekk fordi den er på latinske bokstaver
text <- str_replace_all(text, "Lithuanian News Agency - ELTA ", "000")
text <- str_replace_all(text, "(ELTA) 2019 Вильнюс, 13 мая. (ЭЛЬТА)", "000")
text <- str_replace_all(text, "2019 Вильнюс, 13 мая. (ЭЛЬТА). ", "000") # trygg
text <- str_replace_all(text, ". (ЭЛЬТА). ", "000")
text <- str_replace_all(text, "Lithuanian News Agency ", "000")
text <- str_replace_all(text, "Date:  - ", "000")
text <- str_replace_all(text, "31 December 2019 Results Found", "000")
text <- str_replace_all(text, "2019 Вильнюс, 13 мая.", "000")
text <- str_replace_all(text, "2019 Брюссель, 13 мая.", "000")
text <- str_replace_all(text, "Latvia, 0", " ")
text <- str_replace_all(text, "0002019+[0-9]{4}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+[0-9]{3}+[A-Za-z]{2}", "JEG KLARTE DET")
#R0002019 0513 ef 5 d 000 xd  
#R0002019 0513 ef 5 d 000 ul
text <- str_replace_all(text, "R0002019+[0-9]{4}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+[0-9]{4}+[A-Za-z]{1}", "JEG KLARTE DET")
text <- str_replace_all(text, "R0002019+[0-9]{4}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+[0-9]{5}", "JEG KLARTE DET")
text <- str_replace_all(text, "[0-9]{2}+\\s+[а-яА-ЯёЁ]{3}+\\s+[0-9]{3}+\\s+words+\\s+[0-9]{1,2}+\\s+[A-Za-z]{3}+\\s+[0-9]{4}", "") # 29 мая 232 words 20 May 2019
text <- str_replace_all(text, "[0-9]{3}+\\s+words", "000") #232 words 20 May 2019
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[а-яА-ЯёЁ].+\\s+/ТАСС/. ", "000")# 20 мая. /ТАСС/. 
text <- str_replace_all(text, "(ЭЛЬТА)", "")
text <- str_replace_all(text," [0-9]+[0-9]+:+[0-9]+[0-9],", "") # 11:45,
text<- str_replace_all(text, "News Filters Date:  2019 - 31 December 2019 Results Found 912 Timestamp", "")
text <- str_replace_all(text, "( Language)", "")
text <- str_replace_all(text,"[0-9]+[0-9]+:+[0-9]+[0-9]", "") # 09:52 etc 
text <- str_replace_all(text," [0-9]+[0-9]+:+[0-9]+[0-9]", "") #" 07:32 
text <- str_replace_all(text,",", ", ")      # ,  ,*[]
text <- str_replace_all(text,",  ", ", ")      # ,  ,*[] 
text <- str_replace_all(text," , ", "")      # ,  ,*[]   # alt med et mellomrom foran komma tas vekk 
text <- str_replace_all(text, "JEG KLARTE DET", " ")
text <- str_replace_all(text, "BBB", " ")
text <- str_replace_all(text, "000", " ")
text <- str_replace_all(text, "00", " ")
text <- str_replace_all(text, "   (   )   ( )   ( ) ()  ()  (  )   ( )  ", " ") # går ikke 
text <- str_replace_all(text, " All Industries Region All Regions", " ")
text <- str_replace_all(text, " News Filters Source: ", " ")
text <- str_replace_all(text, " - ELTA ", " ")
text <- str_replace_all(text, " 2, 324 Timestamp  9:56 ", " ")
text <- str_replace_all(text, "Ukraine, ", " ")
text <- str_replace_all(text, "Latvia, ", " ")
text <- str_replace_all(text, "\\(+\\s+\\)" , " ")
text <- str_replace_all(text, "\\(+\\)" , " ")

# Page 1 of 100 © 2019 Factiva, Inc. All rights reserved, klslett osv. 
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}+\\s+©+\\s+2019", "")
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}", "") #Page 110 of 111             Page 111 of 111
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", "")
text <- str_replace_all(text, "[0-9]{1}+\\,+\\s+[0-9]{3}+\\s+Timestamp", "")   # 2, 324 Timestamp
text <- str_replace_all(text, "[0-9]{1}+\\,+\\s+[0-9]{3}+\\s+\\s+Timestamp", "")   # 2, 324   Timestamp 
text <- str_replace_all(text, "[0-9]{1}+\\:+[0-9]{2}", "")  
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", "") # R 20190103ef13 5l 
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", "") # R 20190101ef11 02
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{2}", " ") # R 20190206ef26 gr
text <- str_replace_all (text, "R ", " ")
text <- str_replace_all(text, "Factiva, Inc. All rights reserved.", "")
#text <- str_replace_all(text, "\\(+ELTA+\\)+\\s+ELTAR+\\s+\\s+ВИЛЬНЮС", "") # (ELTA) ELTAR  ВИЛЬНЮС
#text <- str_replace_all(text, "\\(+ELTA+\\)+\\s+ELTAR+\\s+\\s+Вильнюс,", "") #  (ELTA) ELTAR  Вильнюс,
# text <- str_replace_all(text, "ELTA+\\s+Вильнюс,", "") # ELTA Вильнюс,
#text <- str_replace_all(text, "\\(+ELTA+\\)+\\s+ELTAR+\\s+\\s+ТАЛЛИН,", "") # (ELTA) ELTAR  ТАЛЛИН
text <- str_replace_all(text, "\\(+ELTA+\\)+\\s+ELTAR", "") # (ELTA) ELTAR
text <- str_replace_all(text, "\\(+ELTA+\\)", "") # (ELTA)
text <- str_replace_all(text, "ELTA  ТАСС,", "") #
# text <- str_replace_all(text, "ELTA+\\s+\\s+[а-яА-ЯёЁ]{1,10}+\\,", "") # ELTA Вильнюс, ELTA  Брюссель, ELTA  МОСКВА, ELTA  ТАЛЛИН, ELTA  ПАРИЖ, ELTA  
# text <- str_replace_all(text, "ELTA+\\s+[а-яА-ЯёЁ]{1,10}\\/+[а-яА-ЯёЁ]{1,10}+\\,", "") #  ELTA  Вильнюс/Гаага,
text <- str_replace_all(text, "ELTA", " ") #
text <- str_replace_all(text, "\"", " ") # 
text <- str_replace_all(text, "\"", " ") #
text <- str_replace_all(text, "(\")", " ")
# tatt vekk text <- str_replace_all(text, "\"+[а-яА-ЯёЁ]{1,10}", " ")


text_list <- str_split(text[1:6], pattern= "Document ")


substr(text_list[2], 1,4000) 
substr(text_list[[1]], 1, 4000)
substr(text_list[[2]], 1, 2000)
substr(text_list[[3]], 1, 4000)
substr(text_list[[4]], 1, 2000)
substr(text_list[[5]], 1, 4000)
substr(text_list[[6]], 1, 2000)

library(tidyverse)

tekster <- as_tibble(matrix(unlist(text_list)))  #dataframe til matrix, til tibble



### APRIL ###

53+14+(4*100)+6 # [1] 473
tekster # A tibble: 473 x 1




data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 0,
                       land = "Litauen",
                       rusetn = "lav", 
                       rusmors = "lav", 
                       rusaffek = 3, 
                       FFPfragile = "lav",
                       Russortod = "lav",
                       Plassering = 1,
                       tekst = "hel",
                       tid = "April", 
                       avis = "Elta"), 
                  stringAsFactors = FALSE)

# sjekke rader som skal bort 
Matrise <- matrix(unlist(text_list))

# sjekk
dataFFsjekk <- data[c(54, 155, 256, 357, 458, 473), ] 

# kjør
dataFF <- data[-c(54, 155, 256, 357, 458, 473), ] 


library(quanteda)
corpusELTA <- corpus(dataFF)
corpusELTA$documents$texts
docvars(corpusELTA)
summary(corpusELTA)

save(corpusELTA, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_ELTA_April.rda")
load("~/Downloads/test/2019/Korpusnye/Corpus_ELTA_April.rda")







# MAI


setwd("~/Downloads/test/2019")

liste <- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Litauen/Elta(18) /Mai"), 
                    full.names = TRUE)

library(pdftools)

Elta <- lapply(liste[1:4], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 


Eltaframe <- do.call(rbind, Elta)  # do call brukes for funksjon på liste, r bind radbinder listen
substr(Eltaframe$text[1], 1, 200)

library(stringr)

### LAGE TEKSTEN OG FJERNE TEKST ###
text <- str_trim(str_replace_all(Eltaframe$text,   "\\s+",  " "))  # nå blir den character og ikke frame

text_list <- str_split(text[1:4], pattern= "Document ") 

substr(text_list[[2]], 1, 2000)
substr(text_list[1], 1,4000)

text <- str_replace_all(text, "(Russian)", "")   # da, virker
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}+\\s+Factiva, Inc. All rights reserved.", "BBB") 
text <- str_replace_all(text, " © 2019", "") # © 2019
text <- str_replace_all(text, "Литовское Агентство Новостей", "")  # Литовское Агентство Новостей
# Prøver å catche denne:       2019     Брюссель        ,   13            мая           .   
text <- str_replace_all(text, "2019+\\s+[а-яА-ЯёЁ]{1,10}+,+\\s+[0-9]{2}+\\s+[а-яА-ЯёЁ]{1,10}+.", "OOO") # bytt ut med små russiske bokstaver
#84 words  "[0-9]{1,3}+\\s+words"
text <- str_replace_all(text, "[0-9]{1,3}+\\s+words", "BBB")
#2019 Каунасский р-он., 18 мая.
text <- str_replace_all(text, "2019+\\s+[а-яА-ЯёЁ]{1,10}+\\s+р-он+\\s+.+\\s+,+\\s+[0-9]{2}+\\s[а-яА-ЯёЁ]{1,10}", "BBB") 
text <- str_replace_all(text, "2019+\\s+[а-яА-ЯёЁ]{1,10}+\\s+,+\\s+[0-9]{2}+\\s[а-яА-ЯёЁ]{1,10}", "BBB") 
text <- str_replace_all(text, "(ЭЛЬТА)", "000") #den tar det vekk på noen 
text <- str_replace_all(text, "(ЭЛЬТА).", "000") #den tar det vekk med 
text <- str_replace_all(text, "[0-9]{3}+\\s+words+\\s", "") #14 ou 149 words
text <- str_replace_all(text, "[0-9]{2}+\\s+words,", "") #14 words,
text <- str_replace_all(text, " /ТАСС/. ", " ") # /TACC/. 
text <- str_replace_all(text, "[0-9]{1,2}+\\s+May\\s+2019", "")  #dato May 2019
text <- str_replace_all(text, "[0-9]{1,2}+\\s+January\\s+2019", "")  #dato måned år
text <- str_replace_all(text, "[0-9]{1,2}+\\s+February\\s+2019", "")  # dato måned år
text <- str_replace_all(text, "[0-9]{1,2}+\\s+March\\s+2019", "")  # dato måned år
text <- str_replace_all(text, "[0-9]{1,2}+\\s+April\\s+2019", "")  #dato måned år
text <- str_replace_all(text, "[0-9]{1,2}+\\s+June\\s+2019", "") #dato måned år
text <- str_replace_all(text, "[0-9]{1,2}+\\s+July\\s+2019", "")  #dato måned år
text <- str_replace_all(text, "Литовское Агентство Новостей", "") #Литовское Агентство Новостей
text <- str_replace_all(text, "ELTAR Russian © ", "")  # ELTAR Russian © 
text <- str_replace_all(text, "2019 РИГА,\\s+[0-9]{1,2}+\\s+мая.", "")  #2019 РИГА, 20 мая.
text <- str_replace_all(text, "Or Lithuanian News Agency", "")
text <- str_replace_all(text, "- ELTA (Russian Language) Or 112.ua", "") 
text <- str_replace_all(text, "Or Unian (Ukraine, Russian Language)", "") 
text <- str_replace_all(text, "(Ukraine, Russian Language)", "")
text <- str_replace_all(text, " (Latvia, Russian Language)", "") 
text <- str_replace_all(text, "Or Vesti segodnia", "")
text <- str_replace_all(text, "All Companies Subject Political/General News Industry ", "") 
text <- str_replace_all(text,"Author All Authors Company ", "")
text <- str_replace_all(text, "All Industries Region All Regions Language", "") 
text <- str_replace_all(text, " Russian News Filters Source: ", "")
text <- str_replace_all(text, "Lithuanian News Agency - ELTA (Russian Language)", "") 
text <- str_replace_all(text, "Date:  - 31 December 2019 Results Found  ", "")
text <- str_replace_all(text, "Page 104 of 105 © 2019 Factiva, Inc. All rights reserved.", "") 
text <- str_replace_all(text, "АКТУАЛЬНО.", "") 
text <- str_replace_all(text, "2019 Вильнюс, 13 мая. (ЭЛЬТА).", "") 
text <- str_replace_all(text, "Search Summary", "000") 
text <- str_replace_all(text,"(Estonia, Russian Language) Or TVNET.lv (Russian Language)",  "000")
text <- str_replace_all(text, "Text Date In the last 5 years Source Delfi", "000") 
text <- str_replace_all(text, "Or Lithuanian News Agency - ELTA", "000")      
text <- str_replace_all(text, "(Russian Language)", "000")
text <- str_replace_all(text, " Or 112.ua (Ukraine, Russian Language) Or Unian (Ukraine, Russian Language)", "000")
text <- str_replace_all(text, " Or Vesti segodnia (Latvia, Russian Language)", "000")
text <- str_replace_all(text, "All Industries Region All Regions Language Russian News Filters Source:", "000")
text <- str_replace_all(text, " Lithuanian News Agency - ELTA (Russian Language)", "000")
text <- str_replace_all(text, "Estonia,", "000")
text <- str_replace_all(text, "Or TVNET.lv", "000")
text <- str_replace_all(text, " Or 112.ua ", "000")
text <- str_replace_all(text, "Or Unian ", "000")
text <- str_replace_all(text, " Latvia, ", "000") # kan ta den vekk fordi den er på latinske bokstaver
text <- str_replace_all(text, "Lithuanian News Agency - ELTA ", "000")
text <- str_replace_all(text, "(ELTA) 2019 Вильнюс, 13 мая. (ЭЛЬТА)", "000")
text <- str_replace_all(text, "2019 Вильнюс, 13 мая. (ЭЛЬТА). ", "000") # trygg
text <- str_replace_all(text, ". (ЭЛЬТА). ", "000")
text <- str_replace_all(text, "Lithuanian News Agency ", "000")
text <- str_replace_all(text, "Date:  - ", "000")
text <- str_replace_all(text, "31 December 2019 Results Found", "000")
text <- str_replace_all(text, "2019 Вильнюс, 13 мая.", "000")
text <- str_replace_all(text, "2019 Брюссель, 13 мая.", "000")
text <- str_replace_all(text, "Latvia, 0", " ")
text <- str_replace_all(text, "0002019+[0-9]{4}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+[0-9]{3}+[A-Za-z]{2}", "JEG KLARTE DET")
#R0002019 0513 ef 5 d 000 xd  
#R0002019 0513 ef 5 d 000 ul
text <- str_replace_all(text, "R0002019+[0-9]{4}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+[0-9]{4}+[A-Za-z]{1}", "JEG KLARTE DET")
text <- str_replace_all(text, "R0002019+[0-9]{4}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+[0-9]{5}", "JEG KLARTE DET")
text <- str_replace_all(text, "[0-9]{2}+\\s+[а-яА-ЯёЁ]{3}+\\s+[0-9]{3}+\\s+words+\\s+[0-9]{1,2}+\\s+[A-Za-z]{3}+\\s+[0-9]{4}", "") # 29 мая 232 words 20 May 2019
text <- str_replace_all(text, "[0-9]{3}+\\s+words", "000") #232 words 20 May 2019
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[а-яА-ЯёЁ].+\\s+/ТАСС/. ", "000")# 20 мая. /ТАСС/. 
text <- str_replace_all(text, "(ЭЛЬТА)", "")
text <- str_replace_all(text," [0-9]+[0-9]+:+[0-9]+[0-9],", "") # 11:45,
text<- str_replace_all(text, "News Filters Date:  2019 - 31 December 2019 Results Found 912 Timestamp", "")
text <- str_replace_all(text, "( Language)", "")
text <- str_replace_all(text,"[0-9]+[0-9]+:+[0-9]+[0-9]", "") # 09:52 etc 
text <- str_replace_all(text," [0-9]+[0-9]+:+[0-9]+[0-9]", "") #" 07:32 
text <- str_replace_all(text,",", ", ")      # ,  ,*[]
text <- str_replace_all(text,",  ", ", ")      # ,  ,*[] 
text <- str_replace_all(text," , ", "")      # ,  ,*[]   # alt med et mellomrom foran komma tas vekk 
text <- str_replace_all(text, "JEG KLARTE DET", " ")
text <- str_replace_all(text, "BBB", " ")
text <- str_replace_all(text, "000", " ")
text <- str_replace_all(text, "00", " ")
text <- str_replace_all(text, "   (   )   ( )   ( ) ()  ()  (  )   ( )  ", " ") # går ikke 
text <- str_replace_all(text, " All Industries Region All Regions", " ")
text <- str_replace_all(text, " News Filters Source: ", " ")
text <- str_replace_all(text, " - ELTA ", " ")
text <- str_replace_all(text, " 2, 324 Timestamp  9:56 ", " ")
text <- str_replace_all(text, "Ukraine, ", " ")
text <- str_replace_all(text, "Latvia, ", " ")
text <- str_replace_all(text, "\\(+\\s+\\)" , " ")
text <- str_replace_all(text, "\\(+\\)" , " ")

# Page 1 of 100 © 2019 Factiva, Inc. All rights reserved, klslett osv. 
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}+\\s+©+\\s+2019", "")
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}", "") #Page 110 of 111             Page 111 of 111
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", "")
text <- str_replace_all(text, "[0-9]{1}+\\,+\\s+[0-9]{3}+\\s+Timestamp", "")   # 2, 324 Timestamp
text <- str_replace_all(text, "[0-9]{1}+\\,+\\s+[0-9]{3}+\\s+\\s+Timestamp", "")   # 2, 324   Timestamp 
text <- str_replace_all(text, "[0-9]{1}+\\:+[0-9]{2}", "")  
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", "") # R 20190103ef13 5l 
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", "") # R 20190101ef11 02
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{2}", " ") # R 20190206ef26 gr
text <- str_replace_all (text, "R ", " ")
text <- str_replace_all(text, "Factiva, Inc. All rights reserved.", "")
#text <- str_replace_all(text, "\\(+ELTA+\\)+\\s+ELTAR+\\s+\\s+ВИЛЬНЮС", "") # (ELTA) ELTAR  ВИЛЬНЮС
#text <- str_replace_all(text, "\\(+ELTA+\\)+\\s+ELTAR+\\s+\\s+Вильнюс,", "") #  (ELTA) ELTAR  Вильнюс,
# text <- str_replace_all(text, "ELTA+\\s+Вильнюс,", "") # ELTA Вильнюс,
#text <- str_replace_all(text, "\\(+ELTA+\\)+\\s+ELTAR+\\s+\\s+ТАЛЛИН,", "") # (ELTA) ELTAR  ТАЛЛИН
text <- str_replace_all(text, "\\(+ELTA+\\)+\\s+ELTAR", "") # (ELTA) ELTAR
text <- str_replace_all(text, "\\(+ELTA+\\)", "") # (ELTA)
text <- str_replace_all(text, "ELTA  ТАСС,", "") #
# text <- str_replace_all(text, "ELTA+\\s+\\s+[а-яА-ЯёЁ]{1,10}+\\,", "") # ELTA Вильнюс, ELTA  Брюссель, ELTA  МОСКВА, ELTA  ТАЛЛИН, ELTA  ПАРИЖ, ELTA  
# text <- str_replace_all(text, "ELTA+\\s+[а-яА-ЯёЁ]{1,10}\\/+[а-яА-ЯёЁ]{1,10}+\\,", "") #  ELTA  Вильнюс/Гаага,
text <- str_replace_all(text, "ELTA", " ") #
text <- str_replace_all(text, "\"", " ") # 
text <- str_replace_all(text, "\"", " ") #
text <- str_replace_all(text, "(\")", " ")
# tatt vekk text <- str_replace_all(text, "\"+[а-яА-ЯёЁ]{1,10}", " ")



text_list <- str_split(text[1:4], pattern= "Document ")

substr(text_list[[4]], 1, 4000)
substr(text_list[2], 1,4000)  


library(tidyverse)

tekster <- as_tibble(matrix(unlist(text_list)))  #dataframe til matrix, til tibble



### MAI ###
47+(3*100)+4 # [1] 351
tekster # A tibble: 351 x 1


data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 0,
                       land = "Litauen",
                       rusetn = "lav", 
                       rusmors = "lav", 
                       rusaffek = 3, 
                       FFPfragile = "lav",
                       Russortod = "lav",
                       Plassering = 1,
                       tekst = "hel",
                       tid = "Mai", 
                       avis = "Elta"), 
                  stringAsFactors = FALSE)


Matrise <- matrix(unlist(text_list))

# sjekk
dataFFsjekk <- data[c(101, 202, 303, 351), ] 
# kjør
dataFF <- data[-c(101, 202, 303, 351), ] 



library(quanteda)
corpusELTA <- corpus(dataFF)
corpusELTA$documents$texts
docvars(corpusELTA)
summary(corpusELTA)

save(corpusELTA, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/Corpus_ELTA_Mai.rda")
load("~/Downloads/test/2019/Korpusnye/Corpus_ELTA_Mai.rda")




############################# Ingen i JUNI ###########################






#                                                                   ~ 

          ######################################################################################################################
                                                                # UKRAINA #
          ######################################################################################################################

                                               


#                                                                   ~

### 112 ###

#nettbasert kun med ingress
# Kreml-opphav 

                                        

setwd("/Users/odasmarchand/Downloads/test/2019/Ukraina/112 ")

# evt   setwd("~/Downloads/test/) 

liste<- list.files(paste0("~/Downloads/test/2019/Ukraina/112 /Mai 112 PDF"), 
                   full.names = TRUE)



# Bruker liste for å hente ut tekstene med pdf_text
Avis <- lapply(liste[1:22], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 




##########   lag dataframe   ###########
Avisframe <- do.call(rbind, Avis)  # do call brukes for funksjon på liste, r bind radbinder listen
substr(Avisframe$text[1], 1, 200) # teskt en, 200 ord - ikke nødvendig


############################## LAGE TEKSTEN OG FJERNE TEKST ####################################
library(stringr)
# samtidig lager tilfeldigvis om til character og ikke dataframe

#først plukke ut tekstvariabelen på (data)framen og kalle den text, samtidig fjerne whitespace
text <- str_trim(str_replace_all(Avisframe$text,   "\\s+",  " ")) 

# splitte tekst
text_list <- str_split(text[1:22], pattern= "All rights reserved.") # eller /n ?? ved linjeshift

# se på tekst
substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn


#########Fjerne ting############

text <- str_replace_all(text, "Postimees,", "") 
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}+\\,", "") #kl.slett,
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", "") #kl.slett uten komma
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}+,", "")  # dato
text <- str_replace_all(text, "[0-9]{2,3}+\\s+words,", "") #antall ord
text <- str_replace_all(text, "\\(+Russian+\\)", "") 
# Page 97 of 100 © 2019 Factiva, Inc. " 
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}+\\s+©+\\s+2019+\\s+Factiva,+\\s+Inc", "")
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}", " ")
text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source mke.ee", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "Or Delfi ", " ")
text <- str_replace_all(text, "Or Postimees", " ")
text <- str_replace_all(text, "Author All Authors Company", " ")
text <- str_replace_all(text, "All Companies Subject Political ", " ")
text <- str_replace_all(text, "General News Industry All Industries Region All Regions Language", " ")
text <- str_replace_all(text, "Russian News Filters Source: Delfi", " ")
text <- str_replace_all(text, "Results Found 838 Timestamp", " ")
text <- str_replace_all(text, "All Companies Subject Political", "")
text <- str_replace_all(text, "Results Found 1,119 Timestamp", " ")
text <- str_replace_all(text, "Timestamp", " ")
text <- str_replace_all(text, "Russian News Filters Source: Postimees   Results Found 3,079      Page 100 of 100 © 2019 Factiva, Inc.", " ")

# Page 1 of 100 © 2019 Factiva, Inc. All rights reserved, klslett osv. 
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}+\\s+©+\\s+2019", " ")
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}", " ") #Page 110 of 111             Page 111 of 111
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ")
text <- str_replace_all(text, "[0-9]{1}+\\,+\\s+[0-9]{3}+\\s+Timestamp", " ")   
text <- str_replace_all(text, "[0-9]{1}+\\:+[0-9]{2}", "")  
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", "") # R 20190103ef13 5l 
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", "") # R 20190101ef11 02
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{2}", " ") # R 20190206ef26 gr
text <- str_replace_all (text, "R ", " ")
text <- str_replace_all(text, "Factiva, Inc. All rights reserved.", " ")
text <- str_replace_all(text, "Search Summary Text Date In the last 6 months Source 112.ua (Ukraine, Russian Language) ", "")
text <- str_replace_all(text, "All Languages News Filters Date:", " ")
text <- str_replace_all(text, "Results Found+\\s+[0-9]{1}+\\,+[0-9]{3}", " ")
  
text <- str_replace_all(text, "\\(+ELTA+\\)+\\s+ELTAR", "") # (ELTA) ELTAR
text <- str_replace_all(text, "\\(+ELTA+\\)", "") # (ELTA)
text <- str_replace_all(text, "ELTA  ТАСС,", "") #
text <- str_replace_all(text, "ELTA", "") #

text <- str_replace_all(text, "\"", " ") #  / 
text <- str_replace_all(text, "/", " ") # 
text <- str_replace_all(text, "\"", " ") # 
text <- str_replace_all(text, "112.ua,", " ") #

text <- str_replace_all(text, "112.ua", " ") 
text <- str_replace_all(text, "112 Украина", " ") 
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}+\\,", " ") #kl.slett,
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", "") #kl.slett uten komma
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}+,", " ")  # dato bokstaver
text <- str_replace_all(text, "[0-9]{1,2}+\\.+[0-9]{1,2}+\\.+[0-9]{4}", " ")  # dato 29.04.2019  
text <- str_replace_all(text, "[0-9]{2,3}+\\s+words,", " ") #antall ord
text <- str_replace_all(text, "\\(+Russian+\\)", "") 
# Page 97 of 100 © 2019 Factiva, Inc. " 
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}+\\s+©+\\s+2019+\\s+Factiva,+\\s+Inc", " ")
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}", " ")
text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "Or Delfi ", " ")
text <- str_replace_all(text, "Or Postimees", " ")
text <- str_replace_all(text, "Author All Authors Company", " ")
text <- str_replace_all(text, "All Companies Subject Political ", " ")
text <- str_replace_all(text, "General News Industry All Industries Region All Regions Language", " ")
text <- str_replace_all(text, "Russian News Filters Source: Delfi", " ")
text <- str_replace_all(text, "Results Found 838 Timestamp", " ")
text <- str_replace_all(text, "All Companies Subject Political", "")
text <- str_replace_all(text, "Results Found 1,119 Timestamp", " ")
text <- str_replace_all(text, "Timestamp", " ")
text <- str_replace_all(text, "Search Summary Text Date In the last 6 months Source 112.ua (Ukraine, Russian Language) Author All Authors Company All Companies Subject Political/General News Industry All Industries Region All Regions Language All Languages News Filters Date: 1 April 2019 - 30 April 2019 Results Found 182 Timestamp 4 August 2019 10:57 Page 100 of 100 © 2019 Factiva, Inc.", " ") 
text <- str_replace_all(text, "Search Summary Text Date In the last 6 months Source 112.ua (Ukraine, Russian Language)   /  All Languages News Filters Date:   -   Results Found 182", " ")
text <- str_replace_all(text, "Search Summary Text Date In the last 6 months Source", " ")
text <- str_replace_all(text, " All Languages News Filters Date:", " ")
text <- str_replace_all(text, "(Ukraine, Russian Language)", " ")
text <- str_replace_all(text, "Results Found 182", " ")
text <- str_replace_all(text, "(\")", " ")
# tatt vekk text <- str_replace_all(text, "\"+[а-яА-ЯёЁ]{1,10}", " ")


# SPLITTING AV SIDER
# splitte sider basert på mønster: 
text_list <- str_split(text[1:22], pattern= "All rights reserved.") # eller /n ?? ved linjeshift

# se her på teksten etterpå
substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn

# LAGE TIBBLE
library(tidyverse)
tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble

# forventet antall
22*100 # [1] 2200
tekster # A tibble: 2,222 x 1

##### lage variabler #####   

data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 1,
                       land = "Ukraina",
                       rusetn = "medium", 
                       rusmors = "høy", 
                       rusaffek = 1, 
                       FFPfragile = "høy",
                       Russortod = "høy",
                       Plassering = 3,
                       tekst = "ingress",
                       tid = "Mai", 
                       avis = "112ua"), 
                  stringAsFactors = FALSE)



substr(text_list[[1]], 1, 2000)
substr(text_list[[2]], 1, 2000)
substr(text_list[[3]], 1, 2000)
substr(text_list[[4]], 1, 2000)
substr(text_list[[5]], 1, 2000)
substr(text_list[[6]], 1, 2000)
substr(text_list[[7]], 1, 2000)
substr(text_list[[8]], 1, 2000)
substr(text_list[[9]], 1, 2000)
substr(text_list[[10]], 1, 2000)
substr(text_list[[11]], 1, 2000)
substr(text_list[[12]], 1, 2000)
substr(text_list[[13]], 1, 2000)
substr(text_list[[14]], 1, 2000)
substr(text_list[[15]], 1, 2000)
substr(text_list[[16]], 1, 2000)
substr(text_list[[17]], 1, 2000)
substr(text_list[[18]], 1, 2000)
substr(text_list[[19]], 1, 2000)
substr(text_list[[20]], 1, 2000)
substr(text_list[[21]], 1, 2000)
substr(text_list[[22]], 1, 2000)

a<- 101
b <- a+101
c <- b+101
d <- c+101
e <- d+101
f <- e+101
g <- f+101
h <- g+101 #
i <- h+101
j <- i+101
k <- j+101
l <- k+101
m <- l+101
n <- m+101
o <- n+101
p <- o+101
q <- p+101 
r <- q+101
s <- r+101
t <- s+101
u <- t+101
v <- u+101

tt<- print(c(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v)) 
tt # 

Matrise <- matrix(unlist(text_list))


# sjekk
dataFFsjekk <- data[c(101, 202, 303, 404, 505, 606, 707, 808, 909, 1010, 1111, 1212, 1313, 1414, 1515, 1616, 1717, 1818, 1919, 2020, 2121, 2222), ] 
# kjør
dataFF <- data[-c(101, 202, 303, 404, 505, 606, 707, 808, 909, 1010, 1111, 1212, 1313, 1414, 1515, 1616, 1717, 1818, 1919, 2020, 2121, 2222), ] 

library(quanteda)


corpusUa112 <- corpus(dataFF)
corpusUa112$documents$texts
docvars(corpusUa112)
summary(corpusUa112)

# ekstremt viktig å lage nytt navn her
save(corpusUa112, file = "~/Downloads/test/2019/Korpusnye/Corpus_Ua112_Mai.rda")
load("~/Downloads/test/2019/Korpusnye/Corpus_Ua112_Mai.rda")





### JUNI ### 

setwd("/Users/odasmarchand/Downloads/test/2019/Ukraina/112 ")


liste<- list.files(paste0("~/Downloads/test/2019/Ukraina/112 /Juni 112 PDF"), 
                   full.names = TRUE)



# Bruker liste for å hente ut tekstene med pdf_text
Avis <- lapply(liste[1:22], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 



##########   lag dataframe   ###########

Avisframe <- do.call(rbind, Avis)  # do call brukes for funksjon på liste, r bind radbinder listen
substr(Avisframe$text[1], 1, 200) # teskt en, 200 ord - ikke nødvendig


############################## LAGE TEKSTEN OG FJERNE TEKST ####################################
library(stringr)
# samtidig lager tilfeldigvis om til character og ikke dataframe

#først plukke ut tekstvariabelen på (data)framen og kalle den text, samtidig fjerne whitespace
text <- str_trim(str_replace_all(Avisframe$text,   "\\s+",  " ")) 

# splitte tekst
text_list <- str_split(text[1:22], pattern= "All rights reserved.") # eller /n ?? ved linjeshift

# se på tekst
substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn


#########Fjerne ting############

text <- str_replace_all(text, "Postimees,", "") 
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}+\\,", "") #kl.slett,
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", "") #kl.slett uten komma
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}+,", "")  # dato
text <- str_replace_all(text, "[0-9]{2,3}+\\s+words,", "") #antall ord
text <- str_replace_all(text, "\\(+Russian+\\)", "") 
# Page 97 of 100 © 2019 Factiva, Inc. " 
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}+\\s+©+\\s+2019+\\s+Factiva,+\\s+Inc", "")
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}", " ")
text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source mke.ee", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "Or Delfi ", " ")
text <- str_replace_all(text, "Or Postimees", " ")
text <- str_replace_all(text, "Author All Authors Company", " ")
text <- str_replace_all(text, "All Companies Subject Political ", " ")
text <- str_replace_all(text, "General News Industry All Industries Region All Regions Language", " ")
text <- str_replace_all(text, "Russian News Filters Source: Delfi", " ")
text <- str_replace_all(text, "Results Found 838 Timestamp", " ")
text <- str_replace_all(text, "All Companies Subject Political", "")
text <- str_replace_all(text, "Results Found 1,119 Timestamp", " ")
text <- str_replace_all(text, "Timestamp", " ")
text <- str_replace_all(text, "Russian News Filters Source: Postimees   Results Found 3,079      Page 100 of 100 © 2019 Factiva, Inc.", " ")

# Page 1 of 100 © 2019 Factiva, Inc. All rights reserved, klslett osv. 
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}+\\s+©+\\s+2019", " ")
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}", " ") #Page 110 of 111             Page 111 of 111
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{1}+[A-Za-z]{1}+\\s+[A-Za-z]{1}+[0-9]{1}", " ")
text <- str_replace_all(text, "[0-9]{1}+\\,+\\s+[0-9]{3}+\\s+Timestamp", " ")   
text <- str_replace_all(text, "[0-9]{1}+\\:+[0-9]{2}", "")  
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{1}+[A-Za-z]{1}", "") # R 20190103ef13 5l 
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[0-9]{2}", "") # R 20190101ef11 02
text <- str_replace_all(text, "[A-Za-z]{1}+\\s+[0-9]{8}+[A-Za-z]{2}+[0-9]{2}+\\s+[A-Za-z]{2}", " ") # R 20190206ef26 gr
text <- str_replace_all (text, "R ", " ")
text <- str_replace_all(text, "Factiva, Inc. All rights reserved.", " ")
text <- str_replace_all(text, "Search Summary Text Date In the last 6 months Source 112.ua (Ukraine, Russian Language) ", "")
text <- str_replace_all(text, "All Languages News Filters Date:", " ")
text <- str_replace_all(text, "Results Found+\\s+[0-9]{1}+\\,+[0-9]{3}", " ")

text <- str_replace_all(text, "\\(+ELTA+\\)+\\s+ELTAR", "") # (ELTA) ELTAR
text <- str_replace_all(text, "\\(+ELTA+\\)", "") # (ELTA)
text <- str_replace_all(text, "ELTA  ТАСС,", "") #
text <- str_replace_all(text, "ELTA", "") #

text <- str_replace_all(text, "\"", " ") #  / 
text <- str_replace_all(text, "/", " ") # 
text <- str_replace_all(text, "\"", " ") # 
text <- str_replace_all(text, "112.ua,", " ") #

text <- str_replace_all(text, "112.ua", " ") 
text <- str_replace_all(text, "112 Украина", " ") 
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}+\\,", " ") #kl.slett,
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", "") #kl.slett uten komma
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}+,", " ")  # dato bokstaver
text <- str_replace_all(text, "[0-9]{1,2}+\\.+[0-9]{1,2}+\\.+[0-9]{4}", " ")  # dato 29.04.2019  
text <- str_replace_all(text, "[0-9]{2,3}+\\s+words,", " ") #antall ord
text <- str_replace_all(text, "\\(+Russian+\\)", "") 
# Page 97 of 100 © 2019 Factiva, Inc. " 
text <- str_replace_all(text, "Page+\\s+[0-9]{1,3}+\\s+of+\\s+[0-9]{1,3}+\\s+©+\\s+2019+\\s+Factiva,+\\s+Inc", " ")
text <- str_replace_all(text, "[0-9]{1,2}+\\s+[A-Za-z]{1,10}+\\s+[0-9]{4}", " ")
text <- str_replace_all(text, "Search Summary Text Date In the last 5 years Source", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "\\(+Estonia, Russian Language+\\)", " ")
text <- str_replace_all(text, "Or Delfi ", " ")
text <- str_replace_all(text, "Or Postimees", " ")
text <- str_replace_all(text, "Author All Authors Company", " ")
text <- str_replace_all(text, "All Companies Subject Political ", " ")
text <- str_replace_all(text, "General News Industry All Industries Region All Regions Language", " ")
text <- str_replace_all(text, "Russian News Filters Source: Delfi", " ")
text <- str_replace_all(text, "Results Found 838 Timestamp", " ")
text <- str_replace_all(text, "All Companies Subject Political", "")
text <- str_replace_all(text, "Results Found 1,119 Timestamp", " ")
text <- str_replace_all(text, "Timestamp", " ")
text <- str_replace_all(text, "Search Summary Text Date In the last 6 months Source 112.ua (Ukraine, Russian Language) Author All Authors Company All Companies Subject Political/General News Industry All Industries Region All Regions Language All Languages News Filters Date: 1 April 2019 - 30 April 2019 Results Found 182 Timestamp 4 August 2019 10:57 Page 100 of 100 © 2019 Factiva, Inc.", " ") 
text <- str_replace_all(text, "Search Summary Text Date In the last 6 months Source 112.ua (Ukraine, Russian Language)   /  All Languages News Filters Date:   -   Results Found 182", " ")
text <- str_replace_all(text, "Search Summary Text Date In the last 6 months Source", " ")
text <- str_replace_all(text, " All Languages News Filters Date:", " ")
text <- str_replace_all(text, "(Ukraine, Russian Language)", " ")
text <- str_replace_all(text, "Results Found 182", " ")  
text <- str_replace_all(text, "\\(+\\s+\\)", " ")  
text <- str_replace_all(text, " - ", " ")  
text <- str_replace_all(text, "(\")", " ")
# tatt vekk text <- str_replace_all(text, "\"+[а-яА-ЯёЁ]{1,10}", " ")

#text <- str_replace_all(text, "ELTA+\\s+Вильнюс,", "") # ELTA Вильнюс,  SHTI DENNE ER TATT VEKK OVERALT


# SPLITTING AV SIDER
# splitte sider basert på mønster: 
text_list <- str_split(text[1:22], pattern= "All rights reserved.") # eller /n ?? ved linjeshift

# se her på teksten etterpå
substr(text_list[[9]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn

# LAGE TIBBLE
library(tidyverse)
tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble

# forventet: 
(21*100)+14+22 #[1] 2136

tekster # A tibble: 2,136 x 1


##### lage variabler #####   
data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 1,
                       land = "Ukraina",
                       rusetn = "medium", 
                       rusmors = "høy", 
                       rusaffek = 1, 
                       FFPfragile = "høy",
                       Russortod = "høy",
                       Plassering = 3,
                       tekst = "ingress",
                       tid = "Juni", 
                       avis = "112ua"), 
                  stringAsFactors = FALSE)




substr(text_list[[1]], 1, 2000)
substr(text_list[[2]], 1, 2000)
substr(text_list[[3]], 1, 2000)
substr(text_list[[4]], 1, 2000)
substr(text_list[[5]], 1, 2000)
substr(text_list[[6]], 1, 2000)
substr(text_list[[7]], 1, 2000)
substr(text_list[[8]], 1, 2000)
substr(text_list[[9]], 1, 2000)
substr(text_list[[10]], 1, 2000)
substr(text_list[[11]], 1, 2000)
substr(text_list[[12]], 1, 2000)
substr(text_list[[13]], 1, 2000)
substr(text_list[[14]], 1, 2000)
substr(text_list[[15]], 1, 2000)
substr(text_list[[16]], 1, 2000)
substr(text_list[[17]], 1, 2000)
substr(text_list[[18]], 1, 2000)
substr(text_list[[19]], 1, 2000)
substr(text_list[[20]], 1, 2000)
substr(text_list[[21]], 1, 2000)
substr(text_list[[22]], 1, 2000)

a<- 101
b <- a+101
c <- b+101
d <- c+101
e <- d+101
f <- e+101
g <- f+101
h <- g+101
i <- h+101
j <- i+101
k <- j+101
l <- k+101
m <- l+101
n <- m+101
o <- n+101
p <- o+101
q <- p+101 
r <- q+101
s <- r+101
t <- s+101
u <- t+101
v <- u+15


tt<- print(c(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v)) 
tt # [1]  101  202  303  404  505  606  707  808  909 1010 1111 1212 1313 1414 1515 1616 1717 1818 1919 2020 2121 2136

# sjekk
dataFFsjekk <- data[c(101, 202, 303, 404, 505, 606, 707, 808, 909, 808, 1111, 1212, 1313, 1414, 1515, 1616, 1717, 1818, 1919, 2020, 2121, 2136), ] 
# kjør
dataFF <- data[-c(101, 202, 303, 404, 505, 606, 707, 808, 909, 1010, 1111, 1212, 1313, 1414, 1515, 1616, 1717, 1818, 1919, 2020, 2121, 2136), ] 

library(quanteda)

corpusUa112 <- corpus(dataFF)
corpusUa112$documents$texts
docvars(corpusUa112)
summary(corpusUa112)

# ekstremt viktig å lage nytt navn her
save(corpusUa112, file = "~/Downloads/test/2019/Korpusnye/Corpus_Ua112_Juni.rda")
load("~/Downloads/test/2019/Korpusnye/Corpus_Ua112_Juni.rda")







                                           ###########
                                       ##               ##
                                     ##                   ##
                                    ##                     ##
                                   ##                      ##
                                   ##                      ##
                                    ##                     ##
                                    ##                    ##
                                      ##                 ##
                                        ##             ##
                                            ##########
                                            




                                ##########################OBOZREVATEL###########################


#Ved interesse for historikken, kan disse kodene testes ut. 
#install.packages(c("antiword", "unrtf"))
# library(antiword)
# library(unrtf)

########## alternativ fra R-gruppen A. I Alecu  ###########
# library(readr)
# setwd("~/Downloads/test/2019/Ukraina/Obozrevatel")
# temp = list.files(pattern="*.rtf")
# myfiles = lapply(temp, read_csv)
# myfiles = lapply(temp, read_delim, delim="\r")
# myfiles[[1]]

# Fra Terminalen på min Mac Mojave, etter å ha lastet ned versjon 2 av jodconverter, 
# samtidig som OpenOffice kjører i bakgrunnen
#Last login: Tue Jul 30 10:34:37 on ttys000
#Odas-MBP:~ odasmarchand$ cd /Users/odasmarchand/Downloads/test/2019/Ukraina/Obozrevatel
#Odas-MBP:Obozrevatel odasmarchand$ java -jar /Users/odasmarchand/Downloads/jodconverter-2.2.2/lib/jodconverter-2.2.2.jar *.doc -o pdf 
#no main manifest attribute, in /Users/odasmarchand/Downloads/jodconverter-2.2.2/lib/jodconverter-2.2.2.jar
#Odas-MBP:Obozrevatel odasmarchand$ java -jar /Users/odasmarchand/Downloads/jodconverter-2.2.2/lib/jodconverter-2.2.2.jar *.rtf -o pdf 
#no main manifest attribute, in /Users/odasmarchand/Downloads/jodconverter-2.2.2/lib/jodconverter-2.2.2.jar
#Odas-MBP:Obozrevatel odasmarchand$ 

###################


library(pdftools)


### Opplasting av Obozrevatel ###

# Sette directory 


setwd("~/Downloads/test/2019/Ukraina/ObozPDF")

# laste inn OBOZ
# Liste opp filer fra mappe

liste <- list.files(paste0("~/Downloads/test/2019/Ukraina/ObozPDF/Jan"), 
                    full.names = TRUE) 



# Bruker liste for å hente ut tekstene som er rtf
ObozPDF <- lapply(liste[1:71], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 



                                 ##########   lag dataframe   ###########


### Obozframe #### radbinde Oboz i et frame
ObozPDFframe <- do.call(rbind, ObozPDF)  
substr(ObozPDFframe$text[1], 1, 2000) 


### LAGE TEKSTEN OG FJERNE TEKST ###
library(stringr)

text <- str_trim(str_replace_all(ObozPDFframe$text,   "\\s+",  " ")) 



       #### # HTML # ######
# her ser jeg bare tull, og skjønner at den helt unødvendige HTML-skriften UnRTF har lagt inn må _fjernes.
######rydde opp i fuckings HTML ##### ??
#text <- gsub(text, "<.*?>", "") # HTML-drit
#text <- str_replace_all(text, "<.*?>", "") # htm drit


#splitte tekstene slik at vi ser hva som må fjernes i teksten
text_list <- str_split(text[1:71], pattern= "Источник:")

substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)

O <- unlist(text_list)  # Få alle tekstene inn i en liste, 710 tekster
O   # 710 tekster

tekst <- " 1Как писал OBOZREVATEL, в Воронежской области Российской Федерации 21 ноября рухнул мост через
реку Савала, в результате чего пострадали шесть человек. Тело в пяти чемоданах: в деле Хашогги
появилось важное видеодоказательство 2 Как писал OBOZREVATEL, в Воронежской области Российской Федерации 21 ноября рухнул мост через
реку Савала, в результате чего пострадали шесть человек. Тело в пяти чемоданах: в деле Хашогги
появилось важное видеодоказательство
3Как писал OBOZREVATEL, в Воронежской области Российской Федерации 21 ноября рухнул мост через
реку Савала, в результате чего пострадали шесть человек. Тело в пяти чемоданах: в деле Хашогги
появилось важное видеодоказательство
4" 

kasttekst <- str_extract_all(tekst, ".*[\r\\n].*[\r\\n]*..*$") # test 3 sste lshift

# tester bare doc 1 ".*[\r\\n].*[\r\\n]*..*$"  +\\s+[а-яА-ЯёЁ]{1,10}+\
doc1 <- unlist(text_list[[1]]) 
kast1doc <- str_extract_all(doc1, "[[а-яА-ЯёЁ]{1,10}].*$") 

# ikke kjør!
#kast <- str_extract_all(O, ".*[\r\\n].*[\r\\n]*..*$") # test 3 sste lshift
#substr(kast[1:71], 1, 2000)

#bb <- str_replace_all(O, ".*[\r\\n].*[\r\\n]*..*$", " ") # ikke test, fjerner 3 lshift


###########################################################################################################################
#splitter på "Источник:" 
#Det fine med dette, er at det er en systematisk feil "Èñòî÷íèê: Obozrevatel.com (Киев)"
# i alle overskrifter på første doc.! Dermed kan jeg bruke alle de andre, rette "Источник:" for å skille hvert doc, 
# da dette kommer på begynnelsen av neste doc. 
###########################################################################################################################

# se her på teksten
substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn


#Remove ce la   # sjekk denne tighte koden!

# prøver å fange " Obozrevatel.com (Киев) Дата выпуска: 13.02.2019 19:26"   Ta vekk publikasjonssted, fordi Kiev går gjennom hele tiden, ikke som i ELTA med forskjellie steder
text <- str_replace_all(text, "Дата+\\s+выпуска:+\\s+[0-9]{2}+\\.+[0-9]{2}+\\.+[0-9]{4}+\\s+[0-9]{2}+\\:+[0-9]{2}", " ")
text <- str_replace_all(text, "Obozrevatel.com+\\s+\\(+[а-яА-ЯёЁ]{1,10}+\\)+\\s+", " ")
# 

# Fjerne "Èñòî÷íèê:" som er i hvert av de 359 dokumentene i første artikkel
text <- str_replace_all(text, "Èñòî÷íèê:", " ")
text <- str_replace_all(text, "Заглавие:", " ") # 
OBOZREVATEL

text <- str_replace_all(text, "\"", " ") #  / 
text <- str_replace_all(text, "/", " ") # 
text <- str_replace_all(text, "\"", " ") # 
text <- str_replace_all(text, "\\(", " ") # 

# utfordring # 
#"c(\"  ----> # c+\\(+\\\ ville vært måten å fjerne dette på, men dette "forvirrer" Regex, og da tror R at koden ikke er ferdig. 

# splitte sider basert på mønster, etter å ha fjernet ting i teksten
text_list <- str_split(text[1:71], pattern= "Источник:")

# se her på teksten etterpå
substr(text_list[[40]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn


# LAGE DATAFRAME

library(tidyverse)

tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble

tekster
# A tibble: 710 x 1

71*10
#[1] 710


data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 0,
                       land = "Ukraina",
                       rusetn = "medium", 
                       rusmors = "høy", 
                       rusaffek = 1, 
                       FFPfragile = "høy",
                       Russortod = "høy",
                       Plassering = 2,
                       tekst = "hel", 
                       tid = "Januar",
                       avis = "Obozrev"),
                  stringAsFactors = FALSE)



library(quanteda)
corpusObozPDF <- corpus(data)
corpusObozPDF$documents$texts
docvars(corpusObozPDF)
summary(corpusObozPDF)


save(corpusObozPDF, file = "~/Downloads/test/2019/Korpusnye/Corpus_ObozPDF_Januar.rda") 
load("~/Downloads/test/2019/Korpusnye/Corpus_ObozPDF_Januar.rda")






                                      ########################## FEBRUAR ###############################

setwd("~/Downloads/test/2019/Ukraina/ObozPDF")

liste <- list.files(paste0("~/Downloads/test/2019/Ukraina/ObozPDF/Feb"), 
                    full.names = TRUE) 



# Bruker liste for å hente ut tekstene som er rtf
ObozPDF <- lapply(liste[1:68], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 



### Obozframe #### radbinde Oboz i et frame
ObozPDFframe <- do.call(rbind, ObozPDF)  
substr(ObozPDFframe$text[1], 1, 2000) 


### LAGE TEKSTEN OG FJERNE TEKST ###
library(stringr)
text <- str_trim(str_replace_all(ObozPDFframe$text,   "\\s+",  " ")) 


#splitte tekstene slik at vi ser hva som må fjernes i teksten
text_list <- str_split(text[1:68], pattern= "Источник:")

# se her på teksten
substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn


text <- str_replace_all(text, "Дата+\\s+выпуска:+\\s+[0-9]{2}+\\.+[0-9]{2}+\\.+[0-9]{4}+\\s+[0-9]{2}+\\:+[0-9]{2}", " ")
text <- str_replace_all(text, "Obozrevatel.com+\\s+\\(+[а-яА-ЯёЁ]{1,10}+\\)+\\s+", " ")
text <- str_replace_all(text, "Èñòî÷íèê:", " ")
text <- str_replace_all(text, "Заглавие:", " ") # 
text <- str_replace_all(text, "\"", " ") #  / 
text <- str_replace_all(text, "/", " ") # 
text <- str_replace_all(text, "\"", " ") # 
text <- str_replace_all(text, "\\(", " ") # 

# splitte sider basert på mønster, etter å ha fjernet ting i teksten
text_list <- str_split(text[1:68], pattern= "Источник:")

# se her på teksten etterpå
substr(text_list[[40]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn


# dataframe
library(tidyverse)
tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble

tekster
# A tibble: 680 x 1

68*10 
#[1] 680 

data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 0,
                       land = "Ukraina",
                       rusetn = "medium", 
                       rusmors = "høy", 
                       rusaffek = 1, 
                       FFPfragile = "høy",
                       Russortod = "høy",
                       Plassering = 2,
                       tekst = "hel", 
                       tid = "Februar", 
                       avis = "Obozrev"),
                  stringAsFactors = FALSE)



library(quanteda)
corpusObozPDF <- corpus(data)
corpusObozPDF$documents$texts
docvars(corpusObozPDF)
summary(corpusObozPDF)


save(corpusObozPDF, file = "~/Downloads/test/2019/Korpusnye/Corpus_ObozPDF_Februar.rda") 
load("~/Downloads/test/2019/Korpusnye/Corpus_ObozPDF_Februar.rda")











########################## MARS ###############################

setwd("~/Downloads/test/2019/Ukraina/ObozPDF")

liste <- list.files(paste0("~/Downloads/test/2019/Ukraina/ObozPDF/Mars"), 
                    full.names = TRUE) 


# btw ikke rtf lengre! endret manuelt, talle, til PDF (var kryptert og gav meg bare html i R,
# og ellers ikke muligheter for å endre automatisk via JAVA) 


####
ObozPDF <- lapply(liste[1:58], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 


ObozPDFframe <- do.call(rbind, ObozPDF)  
substr(ObozPDFframe$text[1], 1, 2000) 

library(stringr)
text <- str_trim(str_replace_all(ObozPDFframe$text,   "\\s+",  " ")) 


####
text_list <- str_split(text[1:58], pattern= "Источник:")

substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn


text <- str_replace_all(text, "Дата+\\s+выпуска:+\\s+[0-9]{2}+\\.+[0-9]{2}+\\.+[0-9]{4}+\\s+[0-9]{2}+\\:+[0-9]{2}", " ")
text <- str_replace_all(text, "Obozrevatel.com+\\s+\\(+[а-яА-ЯёЁ]{1,10}+\\)+\\s+", " ")
text <- str_replace_all(text, "Èñòî÷íèê:", " ")
text <- str_replace_all(text, "Заглавие:", " ") # 
text <- str_replace_all(text, "\"", " ") #  / 
text <- str_replace_all(text, "/", " ") # 
text <- str_replace_all(text, "\"", " ") # 
text <- str_replace_all(text, "\\(", " ") # 

# splitte sider basert på mønster, etter å ha fjernet ting i teksten
text_list <- str_split(text[1:58], pattern= "Источник:")

# se her på teksten etterpå
substr(text_list[[30]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn


# dataframe
library(tidyverse)
tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble

tekster
# A tibble: 580 x 1

58*10 
#[1] 580

data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 0,
                       land = "Ukraina",
                       rusetn = "medium", 
                       rusmors = "høy", 
                       rusaffek = 1, 
                       FFPfragile = "høy",
                       Russortod = "høy",
                       Plassering = 2,
                       tekst = "hel", 
                       tid = "Mars", 
                       avis = "Obozrev"),
                  stringAsFactors = FALSE)


library(quanteda)
corpusObozPDF <- corpus(data)
corpusObozPDF$documents$texts
docvars(corpusObozPDF)
summary(corpusObozPDF)


save(corpusObozPDF, file = "~/Downloads/test/2019/Korpusnye/Corpus_ObozPDF_Mars.rda") 
load("~/Downloads/test/2019/Korpusnye/Corpus_ObozPDF_Mars.rda")








############## APRIL ###############################

setwd("~/Downloads/test/2019/Ukraina/ObozPDF")


#
#
liste <- list.files(paste0("~/Downloads/test/2019/Ukraina/ObozPDF/April"), 
                    full.names = TRUE) 


# btw ikke rtf lengre! endret manuelt, talle, til PDF (var kryptert og gav meg bare html i R,
# og ellers ikke muligheter for å endre automatisk via JAVA) 


####
####

ObozPDF <- lapply(liste[1:49], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 


ObozPDFframe <- do.call(rbind, ObozPDF)  
substr(ObozPDFframe$text[1], 1, 2000) 

library(stringr)
text <- str_trim(str_replace_all(ObozPDFframe$text,   "\\s+\\s+",  " ")) 


####
####


# I disse tekstene er jeg nødt til å splitte uten å få et ekstra doc, fordi det her er 10 docs i en PDF, og å ende opp med i dette tilfellet
#49 ekstra tekster, blir for mye. Da inneholder de bare tull, og hvis jeg tar det bort, er det tomt i dem.  
#Hvis jeg splitter på "Источник:", legger den til 9 ekstra dokumenter. Det er ikke så mange, men jeg aner ikke hvor splitingen går galt. 
# Kan det kanskje potensielt ødelegge fordi noen dokumenter blir splittet feil, vil det kunne utgjøre en forskjell i resultatene. 
# har sjekket alle dokumentene, og de har det feile tegnet på starten alle sammen. Men det e rnoe med 9-tallet... 

text_list <- str_split(text[1:49], pattern= "Источник: Obozrevatel.com+\\s+\\(+Киев+\\)")

substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn

#Obozrevatel.com (Киев)
text <- str_replace_all(text, "Дата+\\s+выпуска:+\\s+[0-9]{2}+\\.+[0-9]{2}+\\.+[0-9]{4}+\\s+[0-9]{2}+\\:+[0-9]{2}", " ")
#text <- str_replace_all(text, "Obozrevatel.com+\\s+\\(+Киев+\\)", " ")
text <- str_replace_all(text, "Èñòî÷íèê:", " ")
text <- str_replace_all(text, "Заглавие:", " ") # 
text <- str_replace_all(text, "\"", " ") #  / 
text <- str_replace_all(text, "/", " ") # 
text <- str_replace_all(text, "\"", " ") # 
#text <- str_replace_all(text, "\\(", " ") #  ## bør knkje fjerne denne bakover - kan endre viktige ord? men algoritmen tar hensyn til d, tar vekk )? 
text <- str_replace_all(text, "\n", " ") # 
#text <- str_replace_all(text, "Киев+\\)", " ") # 


####
####
text_list <- str_split(text[1:49], pattern= "Источник: Obozrevatel.com+\\s+\\(+Киев+\\)")


substr(text_list[[19]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn


library(tidyverse)
tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble



# forventet antall tekster 
58*10
# [1] 580 

tekster
# A tibble: 499 x 1
# A tibble: 490 x 1 etter mye prøving og feiling. "Источник: Obozrevatel.com " må være nøkkelen for å splitte herefter. 



data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 0,
                       land = "Ukraina",
                       rusetn = "medium", 
                       rusmors = "høy", 
                       rusaffek = 1, 
                       FFPfragile = "høy",
                       Russortod = "høy",
                       Plassering = 2,
                       tekst = "hel", 
                       tid = "April", 
                       avis = "Obozrev"),
                  stringAsFactors = FALSE)



library(quanteda)
corpusObozPDF <- corpus(data)
corpusObozPDF$documents$texts
docvars(corpusObozPDF)
summary(corpusObozPDF)


save(corpusObozPDF, file = "~/Downloads/test/2019/Korpusnye/Corpus_ObozPDF_April.rda") 
load("~/Downloads/test/2019/Korpusnye/Corpus_ObozPDF_April.rda")









############## MAI ###############################

setwd("~/Downloads/test/2019/Ukraina/ObozPDF")


#
#

liste <- list.files(paste0("~/Downloads/test/2019/Ukraina/ObozPDF/Mai"), 
                    full.names = TRUE) 


####
####

ObozPDF <- lapply(liste[1:58], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 


ObozPDFframe <- do.call(rbind, ObozPDF)  
substr(ObozPDFframe$text[1], 1, 2000) 

library(stringr)
text <- str_trim(str_replace_all(ObozPDFframe$text,   "\\s+\\s+",  " ")) 



####
####
text_list <- str_split(text[1:58], pattern= "Источник: Obozrevatel.com ")

substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn


text <- str_replace_all(text, "Дата+\\s+выпуска+\\:+\\s+[0-9]{2}+\\.+[0-9]{2}+\\.+[0-9]{4}", " ")
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " ")
#text <- str_replace_all(text, "Obozrevatel.com+\\s+\\(+\\)+\\s+", " ")
text <- str_replace_all(text, "Èñòî÷íèê:", " ")
text <- str_replace_all(text, "Заглавие:", " ") # 
text <- str_replace_all(text, "\"", " ") #  / 
text <- str_replace_all(text, "/", " ") # 
text <- str_replace_all(text, "\"", " ") # 
text <- str_replace_all(text, "\n", " ") # 
text <- str_replace_all(text, "\\(Киев+\\)", " ") # 





#NY


#text_list <- str_split(text[1:58], pattern= "Источник: Obozrevatel.com+\\s+\\(+Киев+\\)")

#substr(text_list[[1]], 1, 2000)
#substr(text_list[1], 1,4000)  # se på doc no, 400 tegn

####Obozrevatel.com (Киев)
#text <- str_replace_all(text, "Дата+\\s+выпуска:+\\s+[0-9]{2}+\\.+[0-9]{2}+\\.+[0-9]{4}+\\s+[0-9]{2}+\\:+[0-9]{2}", " ")
####text <- str_replace_all(text, "Obozrevatel.com+\\s+\\(+Киев+\\)", " ")
#text <- str_replace_all(text, "Èñòî÷íèê:", " ")
#text <- str_replace_all(text, "Заглавие:", " ") # 
#text <- str_replace_all(text, "\"", " ") #  / 
#text <- str_replace_all(text, "/", " ") # 
#text <- str_replace_all(text, "\"", " ") # 
####text <- str_replace_all(text, "\\(", " ") #  ## bør knkje fjerne denne bakover - kan endre viktige ord? men algoritmen tar hensyn til d, tar vekk )? 
#text <- str_replace_all(text, "\n", " ") # 
####text <- str_replace_all(text, "Киев+\\)", " ") # 




####
####




text_list <- str_split(text[1:58], pattern= "Источник: Obozrevatel.com ")


substr(text_list[[20]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn


library(tidyverse)
tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble



# forventet antall tekster 
58*10
# [1] 580

tekster
 # A tibble: 580 x 1


####
####

data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 0,
                       land = "Ukraina",
                       rusetn = "medium", 
                       rusmors = "høy", 
                       rusaffek = 1, 
                       FFPfragile = "høy",
                       Russortod = "høy",
                       Plassering = 2,
                       tekst = "hel", 
                       tid = "Mai", 
                       avis = "Obozrev"),
                  stringAsFactors = FALSE)



library(quanteda)
corpusObozPDF <- corpus(data)
corpusObozPDF$documents$texts
docvars(corpusObozPDF)
summary(corpusObozPDF)


####
####

save(corpusObozPDF, file = "~/Downloads/test/2019/Korpusnye/Corpus_ObozPDF_Mai.rda") 
load("~/Downloads/test/2019/Korpusnye/Corpus_ObozPDF_Mai.rda")






                                ################# JUNI ##################





setwd("~/Downloads/test/2019/Ukraina/ObozPDF")


#
#

liste <- list.files(paste0("~/Downloads/test/2019/Ukraina/ObozPDF/Juni"), 
                    full.names = TRUE) 


####
####

ObozPDF <- lapply(liste[1:54], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 


ObozPDFframe <- do.call(rbind, ObozPDF)  
substr(ObozPDFframe$text[1], 1, 2000) 

library(stringr)
text <- str_trim(str_replace_all(ObozPDFframe$text,   "\\s+\\s+",  " ")) 



####
####
text_list <- str_split(text[1:54], pattern= "Источник: Obozrevatel.com ")

substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn


text <- str_replace_all(text, "Дата+\\s+выпуска+\\:+\\s+[0-9]{2}+\\.+[0-9]{2}+\\.+[0-9]{4}", " ")
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " ")
#text <- str_replace_all(text, "Obozrevatel.com+\\s+\\(+\\)+\\s+", " ")
text <- str_replace_all(text, "Èñòî÷íèê:", " ")
text <- str_replace_all(text, "Заглавие:", " ") # 
text <- str_replace_all(text, "\"", " ") #  / 
text <- str_replace_all(text, "/", " ") # 
text <- str_replace_all(text, "\"", " ") # 
text <- str_replace_all(text, "\n", " ") # 
text <- str_replace_all(text, "\\(Киев+\\)", " ") # 


# måtte behilde obozrevatel.com, det kommer i hvert 10. dokument. fare for at det kan bli et emne. dessverre. men ellers ville 
# ikke splittingen gått. 





####
####




text_list <- str_split(text[1:54], pattern= "Источник: Obozrevatel.com ")


substr(text_list[[2]], 1, 2000)
substr(text_list[1], 1,4000)  # se på doc no, 400 tegn


library(tidyverse)
tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble



# forventet antall tekster 
54*10
# [1] 540

tekster
# A tibble: 540 x 1


####
####

data <- as_tibble(list(text = as.character(tekster$V1), # Husk å alltid kalle tekstvariabelen for "text"  Her har ikk text noe med de andre text å gjøre 
                       kreml = 0,
                       land = "Ukraina",
                       rusetn = "medium", 
                       rusmors = "høy", 
                       rusaffek = 1, 
                       FFPfragile = "høy",
                       Russortod = "høy",
                       Plassering = 2,
                       tekst = "hel", 
                       tid = "Juni", 
                       avis = "Obozrev"),
                  stringAsFactors = FALSE)



library(quanteda)
corpusObozPDF <- corpus(data)
corpusObozPDF$documents$texts
docvars(corpusObozPDF)
summary(corpusObozPDF)


####
####

save(corpusObozPDF, file = "~/Downloads/test/2019/Korpusnye/Corpus_ObozPDF_Juni.rda") 
load("~/Downloads/test/2019/Korpusnye/Corpus_ObozPDF_Juni.rda")








                    ########################## MOLDOVA  #############################






                                                
        
                                               # ##                          #
                                            #  #####                    ## #
                                          #         #          # SPUTNIK ##
                                          #                       #####
                                            #
                                              #                     #
                                                #
                                                  #
                                                   #
                                       #           #
                                         #  ## ### #
                                           # # # #             
                                                          # Kreml-kontrollert




#Moldova
#Sputnik M




## JANUAR


setwd("/Users/odasmarchand/Downloads/test/2019/Moldova/Sputnik Moldova (4) /PDF")

liste <- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Moldova/Sputnik Moldova (4) /PDF/PDF Sputnik M Januar " ),  ################
                    full.names = TRUE) 


library(pdftools)
Sputnik <- lapply(liste[1:61], function(x){#####################################################
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""), 
                   file = x)
  return(tmp)
}) 

frame <- do.call(rbind, Sputnik)  
substr(frame$text[1], 1, 2000) 
library(stringr)
text <- str_trim(str_replace_all(frame$text,   "\\s+\\s+",  " ")) 

text_list <- str_split(text[1:61], pattern= "Источник: Sputnik") ###############################

substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)
O <- unlist(text_list)  
O

kast <- str_extract_all(O, ".*[\r\\n].*[\r\\n]*..*$") # test 3 sste lshift
substr(kast[1:60], 1, 2000)

bb <- str_replace_all(O, ".*[\r\\n].*[\r\\n]*..*$", " ") # ikke test, fjerner 3 lshift

text <- str_replace_all(bb, "\"", " ") #  /  "\n"
text <- str_replace_all(text, "\n", " ") #  /  
text <- str_replace_all(text, "/", " ") # 
text <- str_replace_all(text, "\"", " ") # 
text <- str_replace_all(text, "\n", " ") # 
text <- str_replace_all(text, "\\(+ru.sputnik.md+\\)", " ")
text <- str_replace_all(text, "Дата+\\s+выпуска+\\:+\\s+[0-9]{2}+\\.+[0-9]{2}+\\.+[0-9]{4}", " ")
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " ")
text <- str_replace_all(text, "Èñòî÷íèê:", " ")
text <- str_replace_all(text, "Заглавие:", " ") # 
text <- str_replace_all(text, "- Молдова", " ") # 
text <- str_replace_all(text, "КИШИНЕВ,", " ") # 
text <- str_replace_all(text, "- Sputnik.", " ") #
text <- str_replace_all(text, "- Sputnik.", " ") 
text <- str_replace_all(text, "(ru.sputnik.md)", " ")

text
substr(text[1:600], 1, 2000)

library(tidyverse)
tekster <- as_tibble(matrix(text)) # Gjør om liste til tibble
tekster
# A tibble:   608 x 1

data <- as_tibble(list(text = as.character(tekster$V1),    #
                       kreml = 1,
                       land = "Moldova",
                       rusetn = "lav", 
                       rusmors = "lav", 
                       rusaffek = 5, 
                       FFPfragile = "høy",
                       Russortod = "høy",
                       Plassering = 1,
                       tekst = "hel", 
                       tid = "Januar", 
                       avis = "Sputnik"),
                  stringAsFactors = FALSE)


library(quanteda)
corpus <- corpus(data)
corpus$documents$texts
docvars(corpus)
summary(corpus)


save(corpus, file = "~/Downloads/test/2019/Korpusnye/Corpus_Sputnik_Januar.rda") #
load("~/Downloads/test/2019/Korpusnye/Corpus_Sputnik_Januar.rda") #








#FEBRUAR 

setwd("/Users/odasmarchand/Downloads/test/2019/Moldova/Sputnik Moldova (4) /PDF")

liste <- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Moldova/Sputnik Moldova (4) /PDF/PDF Sputnik M Februar " ),  ################
                    full.names = TRUE) 


library(pdftools)
Sputnik <- lapply(liste[1:67], function(x){#####################################################
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""), 
                   file = x)
  return(tmp)
}) 

frame <- do.call(rbind, Sputnik)  
substr(frame$text[1], 1, 2000) 
library(stringr)
text <- str_trim(str_replace_all(frame$text,   "\\s+\\s+",  " ")) 

text_list <- str_split(text[1:67], pattern= "Источник: Sputnik") ###############################

substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)
O <- unlist(text_list)  
O

kast <- str_extract_all(O, ".*[\r\\n].*[\r\\n]*..*$") # test 3 sste lshift
substr(kast[1:60], 1, 2000)

bb <- str_replace_all(O, ".*[\r\\n].*[\r\\n]*..*$", " ") # ikke test, fjerner 3 lshift

text <- str_replace_all(bb, "\"", " ") #  /  "\n"
text <- str_replace_all(text, "\n", " ") #  /  
text <- str_replace_all(text, "/", " ") # 
text <- str_replace_all(text, "\"", " ") # 
text <- str_replace_all(text, "\n", " ") # 
text <- str_replace_all(text, "\\(+ru.sputnik.md+\\)", " ")
text <- str_replace_all(text, "Дата+\\s+выпуска+\\:+\\s+[0-9]{2}+\\.+[0-9]{2}+\\.+[0-9]{4}", " ")
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " ")
text <- str_replace_all(text, "Èñòî÷íèê:", " ")
text <- str_replace_all(text, "Заглавие:", " ") # 
text <- str_replace_all(text, "- Молдова", " ") # 
text <- str_replace_all(text, "КИШИНЕВ,", " ") # 
text <- str_replace_all(text, "- Sputnik.", " ") #
text <- str_replace_all(text, "- Sputnik.", " ") 
text <- str_replace_all(text, "(ru.sputnik.md)", " ")

text
substr(text[1:60], 1, 2000)

library(tidyverse)
tekster <- as_tibble(matrix(text)) # Gjør om liste til tibble
tekster
# A tibble:   669 x 1

data <- as_tibble(list(text = as.character(tekster$V1),    #
                       kreml = 1,
                       land = "Moldova",
                       rusetn = "lav", 
                       rusmors = "lav", 
                       rusaffek = 5, 
                       FFPfragile = "høy",
                       Russortod = "høy",
                       Plassering = 1,
                       tekst = "hel", 
                       tid = "Februar", 
                       avis = "Sputnik"),
                  stringAsFactors = FALSE)


library(quanteda)
corpus <- corpus(data)
corpus$documents$texts
docvars(corpus)
summary(corpus)


save(corpus, file = "~/Downloads/test/2019/Korpusnye/Corpus_Sputnik_Februar.rda") #
load("~/Downloads/test/2019/Korpusnye/Corpus_Sputnik_Februar.rda") #









### MARS

setwd("/Users/odasmarchand/Downloads/test/2019/Moldova/Sputnik Moldova (4) /PDF")

liste <- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Moldova/Sputnik Moldova (4) /PDF/PDS Sputnik M Mars" ),  ################
                    full.names = TRUE) 


library(pdftools)
Sputnik <- lapply(liste[1:69], function(x){#####################################################
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""), 
                   file = x)
  return(tmp)
}) 

frame <- do.call(rbind, Sputnik)  
substr(frame$text[1], 1, 2000) 
library(stringr)
text <- str_trim(str_replace_all(frame$text,   "\\s+\\s+",  " ")) 

text_list <- str_split(text[1:69], pattern= "Источник: Sputnik") ###############################

substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)
O <- unlist(text_list)  
O

kast <- str_extract_all(O, ".*[\r\\n].*[\r\\n]*..*$") # test 3 sste lshift
substr(kast[1:600], 1, 2000)

bb <- str_replace_all(O, ".*[\r\\n].*[\r\\n]*..*$", " ") # ikke test, fjerner 3 lshift

text <- str_replace_all(bb, "\"", " ") #  /  "\n"
text <- str_replace_all(text, "\n", " ") #  /  
text <- str_replace_all(text, "/", " ") # 
text <- str_replace_all(text, "\"", " ") # 
text <- str_replace_all(text, "\n", " ") # 
text <- str_replace_all(text, "\\(+ru.sputnik.md+\\)", " ")
text <- str_replace_all(text, "Дата+\\s+выпуска+\\:+\\s+[0-9]{2}+\\.+[0-9]{2}+\\.+[0-9]{4}", " ")
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " ")
text <- str_replace_all(text, "Èñòî÷íèê:", " ")
text <- str_replace_all(text, "Заглавие:", " ") # 
text <- str_replace_all(text, "- Молдова", " ") # 
text <- str_replace_all(text, "КИШИНЕВ,", " ") # 
text <- str_replace_all(text, "- Sputnik.", " ") #
text <- str_replace_all(text, "- Sputnik.", " ") 
text <- str_replace_all(text, "(ru.sputnik.md)", " ")

text

library(tidyverse)
tekster <- as_tibble(matrix(text)) # Gjør om liste til tibble
tekster
# A tibble:  690 x 1

data <- as_tibble(list(text = as.character(tekster$V1),    #
                       kreml = 1,
                       land = "Moldova",
                       rusetn = "lav", 
                       rusmors = "lav", 
                       rusaffek = 5, 
                       FFPfragile = "høy",
                       Russortod = "høy",
                       Plassering = 1,
                       tekst = "hel", 
                       tid = "Mars", 
                       avis = "Sputnik"),
                  stringAsFactors = FALSE)


library(quanteda)
corpus <- corpus(data)
corpus$documents$texts
docvars(corpus)
summary(corpus)


save(corpus, file = "~/Downloads/test/2019/Korpusnye/Corpus_Sputnik_Mars.rda") #
load("~/Downloads/test/2019/Korpusnye/Corpus_Sputnik_Mars.rda") #





##APRIL


setwd("/Users/odasmarchand/Downloads/test/2019/Moldova/Sputnik Moldova (4) /PDF")

liste <- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Moldova/Sputnik Moldova (4) /PDF/PDF Sputnik M April" ),  ##
                    full.names = TRUE) 


library(pdftools)
Sputnik <- lapply(liste[1:68], function(x){####################
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""), 
                   file = x)
  return(tmp)
}) 

frame <- do.call(rbind, Sputnik)  
substr(frame$text[1], 1, 2000) 
library(stringr)
text <- str_trim(str_replace_all(frame$text,   "\\s+\\s+",  " ")) 

text_list <- str_split(text[1:68], pattern= "Источник: Sputnik") ################

substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)
O <- unlist(text_list)  
O

kast <- str_extract_all(O, ".*[\r\\n].*[\r\\n]*..*$") # test 3 sste lshift
substr(kast[1:600], 1, 2000)

bb <- str_replace_all(O, ".*[\r\\n].*[\r\\n]*..*$", " ") # ikke test, fjerner 3 lshift

text <- str_replace_all(bb, "\"", " ") #  /  "\n"
text <- str_replace_all(text, "\n", " ") #  /  
text <- str_replace_all(text, "/", " ") # 
text <- str_replace_all(text, "\"", " ") # 
text <- str_replace_all(text, "\n", " ") # 
text <- str_replace_all(text, "\\(+ru.sputnik.md+\\)", " ")
text <- str_replace_all(text, "Дата+\\s+выпуска+\\:+\\s+[0-9]{2}+\\.+[0-9]{2}+\\.+[0-9]{4}", " ")
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " ")
text <- str_replace_all(text, "Èñòî÷íèê:", " ")
text <- str_replace_all(text, "Заглавие:", " ") # 
text <- str_replace_all(text, "- Молдова", " ") # 
text <- str_replace_all(text, "КИШИНЕВ,", " ") # 
text <- str_replace_all(text, "- Sputnik.", " ") #
text <- str_replace_all(text, "- Sputnik.", " ") 
text <- str_replace_all(text, "(ru.sputnik.md)", " ")

text

library(tidyverse)
tekster <- as_tibble(matrix(text)) # Gjør om liste til tibble
tekster
# A tibble:  679 x 1

data <- as_tibble(list(text = as.character(tekster$V1),    #
                       kreml = 1,
                       land = "Moldova",
                       rusetn = "lav", 
                       rusmors = "lav", 
                       rusaffek = 5, 
                       FFPfragile = "høy",
                       Russortod = "høy",
                       Plassering = 1,
                       tekst = "hel", 
                       tid = "April", 
                       avis = "Sputnik"),
                  stringAsFactors = FALSE)


library(quanteda)
corpus <- corpus(data)
corpus$documents$texts
docvars(corpus)
summary(corpus)


save(corpus, file = "~/Downloads/test/2019/Korpusnye/Corpus_Sputnik_April.rda") #
load("~/Downloads/test/2019/Korpusnye/Corpus_Sputnik_April.rda") #




### MAI 

setwd("/Users/odasmarchand/Downloads/test/2019/Moldova/Sputnik Moldova (4) /PDF")

liste <- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Moldova/Sputnik Moldova (4) /PDF/PDF Sputnik M Mai" ),  ##
                    full.names = TRUE) 


library(pdftools)
Sputnik <- lapply(liste[1:62], function(x){##        ##
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""), 
                   file = x)
  return(tmp)
}) 

frame <- do.call(rbind, Sputnik)  
substr(frame$text[1], 1, 2000) 
library(stringr)
text <- str_trim(str_replace_all(frame$text,   "\\s+\\s+",  " ")) 

text_list <- str_split(text[1:62], pattern= "Источник: Sputnik") ###  ##

substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)
O <- unlist(text_list)  
O

kast <- str_extract_all(O, ".*[\r\\n].*[\r\\n]*..*$") # test 3 sste lshift
substr(kast[1:600], 1, 2000)

bb <- str_replace_all(O, ".*[\r\\n].*[\r\\n]*..*$", " ") # ikke test, fjerner 3 lshift

text <- str_replace_all(bb, "\"", " ") #  /  "\n"
text <- str_replace_all(text, "\n", " ") #  /  
text <- str_replace_all(text, "/", " ") # 
text <- str_replace_all(text, "\"", " ") # 
text <- str_replace_all(text, "\n", " ") # 
text <- str_replace_all(text, "\\(+ru.sputnik.md+\\)", " ")
text <- str_replace_all(text, "Дата+\\s+выпуска+\\:+\\s+[0-9]{2}+\\.+[0-9]{2}+\\.+[0-9]{4}", " ")
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " ")
text <- str_replace_all(text, "Èñòî÷íèê:", " ")
text <- str_replace_all(text, "Заглавие:", " ") # 
text <- str_replace_all(text, "- Молдова", " ") # 
text <- str_replace_all(text, "КИШИНЕВ,", " ") # 
text <- str_replace_all(text, "- Sputnik.", " ") #
text <- str_replace_all(text, "- Sputnik.", " ") 
text <- str_replace_all(text, "(ru.sputnik.md)", " ")

text

library(tidyverse)
tekster <- as_tibble(matrix(text)) # Gjør om liste til tibble
tekster
# A tibble:  620 x 1

data <- as_tibble(list(text = as.character(tekster$V1),    #
                       kreml = 1,
                       land = "Moldova",
                       rusetn = "lav", 
                       rusmors = "lav", 
                       rusaffek = 5, 
                       FFPfragile = "høy",
                       Russortod = "høy",
                       Plassering = 1,
                       tekst = "hel", 
                       tid = "Mai", 
                       avis = "Sputnik"),
                  stringAsFactors = FALSE)


library(quanteda)
corpus <- corpus(data)
corpus$documents$texts
docvars(corpus)
summary(corpus)


save(corpus, file = "~/Downloads/test/2019/Korpusnye/Corpus_Sputnik_Mai.rda") #
load("~/Downloads/test/2019/Korpusnye/Corpus_Sputnik_Mai.rda") #







##JUNI

#1

setwd("/Users/odasmarchand/Downloads/test/2019/Moldova/Sputnik Moldova (4) /PDF/PDF Sputnik M Juni")

liste <- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Moldova/Sputnik Moldova (4) /PDF/PDF Sputnik M Juni/1" ),  ##
                    full.names = TRUE) 


library(pdftools)
Sputnik <- lapply(liste[1:68], function(x){##        ##
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""), 
                   file = x)
  return(tmp)
}) 

frame <- do.call(rbind, Sputnik)  
substr(frame$text[1], 1, 2000) 
library(stringr)
text <- str_trim(str_replace_all(frame$text,   "\\s+\\s+",  " ")) 
text_list <- str_split(text[1:68], pattern= "Источник: Sputnik") ###  ##
substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000)
O <- unlist(text_list)  
O

kast <- str_extract_all(O, ".*[\r\\n].*[\r\\n]*..*$") # test 3 sste lshift
substr(kast[1:680], 1, 2000)

bb <- str_replace_all(O, ".*[\r\\n].*[\r\\n]*..*$", " ") # ikke test, fjerner 3 lshift

text <- str_replace_all(bb, "\"", " ") #  /  "\n"
text <- str_replace_all(text, "\n", " ") #  /  
text <- str_replace_all(text, "/", " ") # 
text <- str_replace_all(text, "\"", " ") # 
text <- str_replace_all(text, "\n", " ") # 
text <- str_replace_all(text, "\\(+ru.sputnik.md+\\)", " ")
text <- str_replace_all(text, "Дата+\\s+выпуска+\\:+\\s+[0-9]{2}+\\.+[0-9]{2}+\\.+[0-9]{4}", " ")
text <- str_replace_all(text, "[0-9]{2}+\\:+[0-9]{2}", " ")
text <- str_replace_all(text, "Èñòî÷íèê:", " ")
text <- str_replace_all(text, "Заглавие:", " ") # 
text <- str_replace_all(text, "- Молдова", " ") # 
text <- str_replace_all(text, "КИШИНЕВ,", " ") # 
text <- str_replace_all(text, "- Sputnik.", " ") #
text <- str_replace_all(text, "- Sputnik.", " ") 
text <- str_replace_all(text, "(ru.sputnik.md)", " ")

text


library(tidyverse)
tekster <- as_tibble(matrix(text)) # Gjør om liste til tibble
tekster
# A tibble: 679 x 1

data <- as_tibble(list(text = as.character(tekster$V1),    #
                       kreml = 1,
                       land = "Moldova",
                       rusetn = "lav", 
                       rusmors = "lav", 
                       rusaffek = 5, 
                       FFPfragile = "høy",
                       Russortod = "høy",
                       Plassering = 1,
                       tekst = "hel", 
                       tid = "Juni", 
                       avis = "Sputnik"),
                  stringAsFactors = FALSE)


library(quanteda)
corpus <- corpus(data)
corpus$documents$texts
docvars(corpus)
summary(corpus)


save(corpus, file = "~/Downloads/test/2019/Korpusnye/Corpus_Sputnik_Juni.rda") #
load("~/Downloads/test/2019/Korpusnye/Corpus_Sputnik_Juni.rda") #




#### Kjøre script på nytt  KP, SPutnik eneste som får stå  - fordi skrevet Avis med stor A. 
# skal være liten, så det får samme variabel. 
# Sputnik kan ikke kjøres på nytt - tar så lang tid. 





                                                               # # # # # # # # # # 
                                                               #                 #
                                                               #  Komsk. Pravda  #
                                                               #                 #
                                                               # # # # # # # # # # 


                                                                     #          
                                               #   # #         #  #                   ### #
                                                # #    #       #                  ##         #
                                                      ##      ##                #             #
                                                      ##     ##               #   #           #
                                                      ## ## #                     #          #
                                                      # ## # ##                   #    #  #
                                                      ##        #                 #                
                                                      #         #                 #
                                                 #    ##       #     # #          #
                                                  #  ##         ## #              #   #

                                                   ### ############# ## ################### ###
                                                
                                                                      # Kreml
                                                                      # Ingress



##Januar



setwd("/Users/odasmarchand/Downloads/test/2019/Moldova/Komsomolskaya Pravda  (6)/PDF ")

#
liste <- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Moldova/Komsomolskaya Pravda  (6)/PDF /PDF Koms Pr M Januar"), 
                    full.names = TRUE) 


####
KomsPr <- lapply(liste[1:42], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 

#må jo vel lage frame først 
frame <- do.call(rbind, KomsPr)  


library(stringr)


text <- str_trim(str_replace_all(frame$text,   "\\s+\\s+",  " ")) 

text_list <- str_split(text[1:42], pattern= "Источник: Комсомольская правда") 

substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000) 


Overskrifter <- str_extract_all(text[1:42], "Заглавие:.*[\r\\n]...{1,85}")  # 1:45 av de oprinnelige tekstene.    # Overskrifter <- str_extract_all(text[1:45], "Заглавие:.*[\r\\n].+\\n") # to lshift? 

# sjekk om andre ting (navn) enn "Смертельное ДТП"" kommer med
# i tillegg foretas en sjekk av teksten ved å se på den. Tekst kan gjentas i sin egen tekst, men skal _ikke gjentas i neste tekst. 
#######################################################################
str_extract_all(Overskrifter[1:42], "[А-ЯЁ]{1}+[а-яё]{2,10}+\\s+[А-ЯЁ]{2,10}") # trekke ut navn og få vite hvor mane som er - overblikk

t<- str_replace_all(unlist(Overskrifter), "\n", " ") # 
t<- str_replace_all(unlist(t), "Заглавие:", " ") # 
t<- str_replace_all(unlist(t), "(\")", "")
t<- str_replace_all(unlist(t), "\"", "");

substr(t[1:420], 1, 2000)

library(tidyverse)

tekster <- as_tibble(matrix(t))



# forventet antall tekster 
42*10
# [1] 420
tekster
# A tibble: 416 x 1

############################################################################################################
# avvik med fire tekster. I det sisste dokumentet er det kun 7 tekster. Mest sannsynlig er det tilfelle med en til tekst. 


####
####

data <- as_tibble(list(text = as.character(tekster$V1), 
                       kreml = 1,
                       land = "Moldova",
                       rusetn = "lav", 
                       rusmors = "lav", 
                       rusaffek = 5, 
                       FFPfragile = "høy",
                       Russortod = "høy",
                       Plassering = 2,
                       tekst = "overskrift",  
                       tid = "Januar",
                       Avis= "KomsPravda"),
                  stringAsFactors = FALSE)


library(quanteda)
corpus <- corpus(data)
corpus$documents$texts
docvars(corpus)
summary(corpus)


####
####

save(corpus, file = "~/Downloads/test/2019/Korpusnye/Corpus_KomsPr_Januar.rda") 
load("~/Downloads/test/2019/Korpusnye/Corpus_KomsPr_Januar.rda")



# februar


setwd("/Users/odasmarchand/Downloads/test/2019/Moldova/Komsomolskaya Pravda  (6)/PDF ")


#
liste <- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Moldova/Komsomolskaya Pravda  (6)/PDF /PDF Koms Pr M Februar"), 
                    full.names = TRUE) 


####
KomsPr <- lapply(liste[1:45], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 


frame <- do.call(rbind, KomsPr)  


library(stringr)

text <- str_trim(str_replace_all(frame$text,   "\\s+\\s+",  " ")) 

#### må fortsatt liste tekstene til etterpå, for å ha orden. 
text_list <- str_split(text[1:45], pattern= "Источник: Комсомольская правда") 

##text_list <- str_split(text[1:45], pattern= "[а-яА-ЯёЁ]{1,10}[А-ЯЁ]+{1,10}")

substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000) 

# Ta ut overksriftene. 
str_extract_all(text[1], "Заглавие:.*[\r\\n].+\\n")       # Overskrifter <- str_extract_all(text[1:45], "Заглавие:.*[\r\\n]+^.*$")

# trekker ut fra alle tekstene, det som kommer etter "Заглавие:" og 2 linjeshift. 
Overskrifter <- str_extract_all(text[1:45], "Заглавие:.*[\r\\n]...{1,85}")  # 1:45 av de oprinnelige tekstene. 

# uten punktum, begynner den noen steder å heller ta inn et nyt tlinjeshift, fordi den ikke 
# alltid merker linjeshitet

# Etter my eprøving og feiling, ser det ut til at 1-85 blir optimalt. Da er det tatt høyde for at 
# linjer i tekstlisten kan bli borte dersom jeg forventer for lange tekster (dermed 1-85-valgfriheten er tatt med)
# og at svært korte overskrifter, kan innvolveres sammen med neste overskrift dersom jeg velger å ta med mer tekst. 
# det virkser som ..... tar med teksten bort linjeshiftet, mens når jeg spesifiserer antall bokstaver, ingorerer den 
#linjeshitet. Dermed er dette en fin kombinasjon, fordi uten sistmevnte kan jeg miste informasjon etter linjeshift 
# som er på linje 2, og eventuelt tekst som ikke er lang nok for punktumene fordi de ikke kan gjøres valgfrie (som {1,85}). 
# Da ville en del falt bort, eller jeg måtte satt et lavere krav til lengde på teksten og vi mister info. 

# bedre med litt feil info enn ingen relevant info, altså der viktige deler er tatt bort. Feilen er der noen ting gjentar
# og kan forstyre topicmodellen. Men også, bedre å ha litt for tynnere med data enn for mye feil data, altså der det går
# over i neste emne. 

# her tar den to linjeshift. Dersom overskriften er kun på et linjeshift, 
# går den i gang med den neste linjeshift og (som er en gjentagelse av forrige setning). 
# Er en setning over to l-shift, nevner den til ut linjeshiftet. 
# Det kan innebære at siste ordet blir borte fra gjentagelsen, fordi den gjentagende 
# overskriften er litt større og får ikke plass til alle ordene i lengre overskrifter. 

# et alternativ til dene fremgangsmetoden har vært å fjerne første overskrift, og 
# string-ecstracte fra verskrift nummer to, for å så få med noe ingress på de som ikke dekker to linjer. 
# problemet med dette, er at teksten som skulle vært i neste overskrift (til neste artikkel) allerede begynner
# på denne linjen, i en del tilfeller. Unngå autokorrelasjon er viktig. 



# k <- list().*
# for(i in seq_along(Overskrifter)){
#  tmp <- Overskrifter[i]
#  k <- str_extract_all(tmp[1:10], "[А-ЯЁ]{1}+[а-яё]{2,10}+\\s+[А-ЯЁ]{2,10}")
# }


########################## Testing.###############################

# Overskrifter er det jeg har trukket ut. 
# Koden tar ut navn som dette:  Павел МУНТЯН, som ofte separerer artiklene, men ikke alltid. 
# Jeg modisifserer koden som tar ut tekst, helt lengden på artiklene er såpass kort at disse navnene ikke 
# lengre kommer med (det er lagt inn litt slingringsmonn. Navnene er bruk som proxymål der artiklene mangler tydelige 
# separatorer som for eksempel hardt linjeshift eller punktum. Dette, fordi tekstene er omtrent like korte, og neste 
# tekst dukker opp konsekvent på sutten av siste avsnitt.  Fraværet av navnene gir altså grunn til å anta at teksten som
# tilhører neste emne nå er rensket vekk. Det er sjekket for alle 45 dokumentene i februar, og sjekkes for resten. 
# Det er også sjekket manuelt for, i en av listene (45) i februar, altså i teksten Overskrifter. 

# Teste at det ikke er mange navn her nå: 
str_extract_all(Overskrifter[1:45], "[А-ЯЁ]{1}+[а-яё]{2,10}+\\s+[А-ЯЁ]{2,10}") # trekke ut navn og få vite hvor mane som er - overblikk
# str_extract_all(Overskrifter[9][40], "[А-ЯЁ]{1}+[а-яё]{2,10}+\\s+[А-ЯЁ]{2,10}") # spesifikt tekst 1 i liste 45 # fungerer ikke
#str_extract_all(unlist(Overskrifter), "[А-ЯЁ]{1}+[а-яё]{2,10}+\\s+[А-ЯЁ]{2,10}") # u-liste dem og så trekke ut. u-listing nyttig. 

 
# forlsag til måter å splitte på 

# Vi kan ikke slutte å str_extracte ved hjelp av f eks punktum eller utropstegn, fordi de flete overskriftene ikke har dette. 
# Det som er mulig, er å be R ta med frem til linjeshift, + noe mer, for eksempel 3 ord til. 
# R forstår ikke alltid at linjeshift 2 er tatt, og derfor regner den linjeshit nr 3 for å være nr 2, og i enkelte tilfeller får vi dermed
# med oss for mye tekst, altså der den går inn i teksten fra neste artikkel som er blanet inn i ingressen.  

# Vi har to mulige steder det går å splitte teksten. Det er en, der det er et litt større mellomrom og ny bokstav, og det er et til mønster, 
# der journlistens navn skrives slik: Navn NAVNESEN. Dessverre er dette villkårlig, og i enkelte tilfeller finnes det andre indikasjoner 
# på skille, for eksempel latisnke bokstaver. Et annet problem med dette er også at den slår ut på ting som ikke er navn, som for eksempel 
# Посольство США"  som betyr Den Amerikanske ambassaden, og "Серьезное ДТП" som betyr intet mindre enn seriøs ulykke. 
# Disse ordene vil altså ikke være en god indikator på hvor jeg skal kutte/ splitte teksten. 

# 1
# больше голосов Украинские
# ответственность Игорь

#2
# стойку Павел МУНТЯН

#Alterativ 1: Ved klipp og lim inn i  R blir det regnet som èt mellomrom. Dermed blir dette også en vanskelig indikasjon. Å belage seg på 
# stor bokstav etter mellomrom, er ikke mulig, da det finnes egennavn midt i tekstene. 


# Overskriften gjentas to ganger, og deretter kommer det noe mer info, i ingressen. Der dukker neste overskrift opp før artikkelslutt, 
# Og neste overskrift gjentas igjen 2 ganger, etc.

# dermed blir siste utvei å str_extracte kun overskriftene, med noen ekstra ord. Her er det bedre å ta med for lite enn for mye, fordi 
# for lite info i dette tilfellet er bedre enn feil info der man tar med for mye ( inn i teksten der neste overskrift nevnes). Tar man med 
# overskrift + litt til, blir det gjerne en overskrift med litt ekstra av neste gjentatte overskrift. Dermed nevnes noen ord flere ganger
# og muligheten for bias er desverre tilstede, men sannsynligvis vil problemet bli dersom et viktig ord, gjerne objektet, kommer sist, 
# tas det med kun en gang, mens andre ting kommer med to ganger, og i enkelte tilfeller, ved korte overskrifter, kan det hende 
# den går inn i ingressen (lite trolig at den går langt inn der). Det mindre gunstige alternativet til dette er å ta med mer info, men dermed
# feil info. Da tar den i enkelte tilfeller også med informasjonen som tilhører neste overskrift. Da blir to artiklers informasjon antatt å 
# være èt emne. En artikkel vil dermed systematisk påvirke neste artikkel. Det vil forstyre stm_modellen, med skyhøy autorkolleasjon. 


# Det er noen ganger vanskelig å gi beskjed om hvor linjeshift er. Det later ikke alltid til å være registrert?
#str_extract_all(Overskrifter[1:45], "\n.....*$")
#str_extract_all(Overskrifter[1:45], "[\r\\n].....*$")
#str_extract_all(Overskrifter[1:45], ".*$")
# Et eksempel er 
# nr en i dette dokumentet, her forstår den ikke hvor linjeshift er. 
Overskrifter[44]
# dette skulle ha vært der, to linjeshift. 
# Заглавие: Кто завтра, 28 февраля в Кишиневе останется без воды\nКто завтра, 28 февраля в Кишиневе останется без воды
# dette skal ikke være der, det er linje 3, og inni her begynner neste tekst som ikke skal være der. 
# В четверг в городе будут вестись ремонтные работы Павел МУНТЯН В Чимишлии без вести пропал
Overskrifter[29]




####################
# resten av oppg 


# disse går ikke, så unlister allerede her
# text <- str_replace_all(Overskrifter, "\n", "     ") # 
# text <- str_replace_all(Overskrifter, "Заглавие:", "     ") # 


t<- str_replace_all(unlist(Overskrifter), "\n", " ") # 
t<- str_replace_all(unlist(t), "Заглавие:", " ") # 
t<- str_replace_all(unlist(t), "(\")", "")
t<- str_replace_all(unlist(t), "\"", "");

substr(t[400], 1, 2000)


# kan ikke alltid bruke vanlige koder, fordi dette er kyrillisk. 
# Do not use [^\w\s], this will remove letters with accents (like àèéìòù), 
# not to mention to Cyrillic or Chinese, letters coming from such languages will be completed removed.


######### I disse tekstene kommer overskift, deretter overskriften på ny i mindre bokstaver, og etter artikkelforfatterens navn, kommer 
# neste overkrift på neste artikkel, før den egentlig skal. 
# Må prøve å splitte på navnene deres - en eller flere store bokstaver sammen. 
# Et annet problem er at overksiften kommer to ganger, før den sier litt mer (like kort som overskriften). 
# Dermed, dersom jeg klarer å splitte, får vi dermed i 1 av 10 tilfeller overskriften 2 ganger ( i første artikkel)
# og i 9 av 10 tilfeller overskriften 3 ganger (fordi en av artiklene også kommer i teksten som er over). 
# Artiklene må kastes ut om jeg ikke får skilt disse, fordi man kan ikke ha autokorrelasjon - at en artikkel påvirker en annen. 
# Da får man ikke skilt emnene riktig. 






library(tidyverse)
#tekster <- as_tibble(matrix(unlist(text_list))) # Gjør om liste til tibble

tekster <- as_tibble(matrix(t)) # Gjør om liste til tibble


# forventet antall tekster 
45*10
# [1] 450
tekster
# A tibble: 449 x 1



############################################################################################################
# Mangler kun en. 


####
####

data <- as_tibble(list(text = as.character(tekster$V1), 
                       kreml = 1,
                       land = "Moldova",
                       rusetn = "lav", 
                       rusmors = "lav", 
                       rusaffek = 5, 
                       FFPfragile = "høy",
                       Russortod = "høy",
                       Plassering = 2,
                       tekst = "overskrift",  
                       tid = "Februar",
                       Avis= "KomsPravda"),
                  stringAsFactors = FALSE)


library(quanteda)
corpus <- corpus(data)
corpus$documents$texts
docvars(corpus)
summary(corpus)


####
####

save(corpus, file = "~/Downloads/test/2019/Korpusnye/Corpus_KomsPr_Februar.rda") 
load("~/Downloads/test/2019/Korpusnye/Corpus_KomsPr_Februar.rda")







######### MARS #######


setwd("/Users/odasmarchand/Downloads/test/2019/Moldova/Komsomolskaya Pravda  (6)/PDF ")

#
liste <- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Moldova/Komsomolskaya Pravda  (6)/PDF /PDF Koms Pr M Mars"), 
                    full.names = TRUE) 


####
KomsPr <- lapply(liste[1:47], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 


frame <- do.call(rbind, KomsPr)  


library(stringr)

text <- str_trim(str_replace_all(frame$text,   "\\s+\\s+",  " ")) 


text_list <- str_split(text[1:47], pattern= "Источник: Комсомольская правда") 

substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000) 


Overskrifter <- str_extract_all(text[1:47], "Заглавие:.*[\r\\n]...{1,85}")  # 1:45 av de oprinnelige tekstene.    # Overskrifter <- str_extract_all(text[1:45], "Заглавие:.*[\r\\n].+\\n") # to lshift? 
str_extract_all(Overskrifter[1:47], "[А-ЯЁ]{1}+[а-яё]{2,10}+\\s+[А-ЯЁ]{2,10}") # trekke ut navn og få vite hvor mane som er - overblikk
# Output: Глава МВД. Betyr lederen for innenriksdep. Ellers, bare om ulykker og om ministre. 

t<- str_replace_all(unlist(Overskrifter), "\n", " ") # 
t<- str_replace_all(unlist(t), "Заглавие:", " ") # 
t<- str_replace_all(unlist(t), "(\")", "")
t<- str_replace_all(unlist(t), "\"", "");

substr(t[1:470], 1, 2000)

library(tidyverse)

tekster <- as_tibble(matrix(t))


# forventet antall tekster 
47*10 # [1] 470
tekster # A tibble: 469 x 1 - et avvik, på nr. 470 NA / missing. Ok. 


data <- as_tibble(list(text = as.character(tekster$V1), 
                       kreml = 1,
                       land = "Moldova",
                       rusetn = "lav", 
                       rusmors = "lav", 
                       rusaffek = 5, 
                       FFPfragile = "høy",
                       Russortod = "høy",
                       Plassering = 2,
                       tekst = "overskrift",  
                       tid = "Mars",
                       Avis= "KomsPravda"),
                  stringAsFactors = FALSE)




library(quanteda)
corpus <- corpus(data)
corpus$documents$texts
docvars(corpus)
summary(corpus)


####
####

save(corpus, file = "~/Downloads/test/2019/Korpusnye/Corpus_KomsPr_Mars.rda") 
load("~/Downloads/test/2019/Korpusnye/Corpus_KomsPr_Mars.rda")








##################### APRIL 

setwd("/Users/odasmarchand/Downloads/test/2019/Moldova/Komsomolskaya Pravda  (6)/PDF ")

#
liste <- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Moldova/Komsomolskaya Pravda  (6)/PDF /PDF Koms Pr M April"), 
                    full.names = TRUE) 


####
KomsPr <- lapply(liste[1:45], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 

frame <- do.call(rbind, KomsPr)  
library(stringr)
text <- str_trim(str_replace_all(frame$text,   "\\s+\\s+",  " ")) 


text_list <- str_split(text[1:45], pattern= "Источник: Комсомольская правда") 
substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000) 
text_list

Overskrifter <- str_extract_all(text[1:45], "Заглавие:.*[\r\\n]...{1,85}")  # 1:45 av de oprinnelige tekstene.    # Overskrifter <- str_extract_all(text[1:45], "Заглавие:.*[\r\\n].+\\n") # to lshift? 
str_extract_all(Overskrifter[1:47], "[А-ЯЁ]{1}+[а-яё]{2,10}+\\s+[А-ЯЁ]{2,10}") # trekke ut navn og få vite hvor mane som er - overblikk
# Output: At Проекты ПСРМ ikke er et eggennavn, sier seg vel selv. For alle som forstår kyrrilisk. " Projekteuh PCPM". 

t<- str_replace_all(unlist(Overskrifter), "\n", " ") # 
t<- str_replace_all(unlist(t), "Заглавие:", " ") # 
t<- str_replace_all(unlist(t), "(\")", "")
t<- str_replace_all(unlist(t), "\"", "");

substr(t[1:450], 1, 2000)

library(tidyverse)
tekster <- as_tibble(matrix(t))


# forventet antall tekster 
45*10 # [1] 450
tekster # A tibble: 450 x 1 


data <- as_tibble(list(text = as.character(tekster$V1), 
                       kreml = 1,
                       land = "Moldova",
                       rusetn = "lav", 
                       rusmors = "lav", 
                       rusaffek = 5, 
                       FFPfragile = "høy",
                       Russortod = "høy",
                       Plassering = 2,
                       tekst = "overskrift",  
                       tid = "April",
                       Avis= "KomsPravda"),
                  stringAsFactors = FALSE)



library(quanteda)
corpus <- corpus(data)
corpus$documents$texts
docvars(corpus)
summary(corpus)


####
####

save(corpus, file = "~/Downloads/test/2019/Korpusnye/Corpus_KomsPr_April.rda") 
load("~/Downloads/test/2019/Korpusnye/Corpus_KomsPr_April.rda")








############################### MAI 

setwd("/Users/odasmarchand/Downloads/test/2019/Moldova/Komsomolskaya Pravda  (6)/PDF ")

#
liste <- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Moldova/Komsomolskaya Pravda  (6)/PDF /PDF Koms Pr M Mai"), 
                    full.names = TRUE) 


####
KomsPr <- lapply(liste[1:43], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 

frame <- do.call(rbind, KomsPr)  
library(stringr)
text <- str_trim(str_replace_all(frame$text,   "\\s+\\s+",  " ")) 


text_list <- str_split(text[1:43], pattern= "Источник: Комсомольская правда") 
substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000) 
text_list

Overskrifter <- str_extract_all(text[1:43], "Заглавие:.*[\r\\n]...{1,85}")  # 1:45 av de oprinnelige tekstene.    # Overskrifter <- str_extract_all(text[1:45], "Заглавие:.*[\r\\n].+\\n") # to lshift? 
str_extract_all(Overskrifter[1:47], "[А-ЯЁ]{1}+[а-яё]{2,10}+\\s+[А-ЯЁ]{2,10}") # trekke ut navn og få vite hvor mane som er - overblikk
# Петербурге ФСБ  Bare FSB (KGB) osv. 

t<- str_replace_all(unlist(Overskrifter), "\n", " ") # 
t<- str_replace_all(unlist(t), "Заглавие:", " ") # 
t<- str_replace_all(unlist(t), "(\")", "")
t<- str_replace_all(unlist(t), "\"", "");

substr(t[1:430], 1, 2000)

library(tidyverse)
tekster <- as_tibble(matrix(t))


# forventet antall tekster 
43*10 # [1] 430
tekster # A tibble: 429 x 1   OK

data <- as_tibble(list(text = as.character(tekster$V1), 
                       kreml = 1,
                       land = "Moldova",
                       rusetn = "lav", 
                       rusmors = "lav", 
                       rusaffek = 5, 
                       FFPfragile = "høy",
                       Russortod = "høy",
                       Plassering = 2,
                       tekst = "overskrift",  
                       tid = "Mai",
                       avis= "KomsPravda"),
                  stringAsFactors = FALSE)



library(quanteda)
corpus <- corpus(data)
corpus$documents$texts
docvars(corpus)
summary(corpus)


####
####

save(corpus, file = "~/Downloads/test/2019/Korpusnye/Corpus_KomsPr_Mai.rda") 
load("~/Downloads/test/2019/Korpusnye/Corpus_KomsPr_Mai.rda")






### JUNI 


setwd("/Users/odasmarchand/Downloads/test/2019/Moldova/Komsomolskaya Pravda  (6)/PDF ")

#
liste <- list.files(paste0("/Users/odasmarchand/Downloads/test/2019/Moldova/Komsomolskaya Pravda  (6)/PDF /PDF Koms Pr M Juni "), 
                    full.names = TRUE) 


####
KomsPr <- lapply(liste[1:51], function(x){
  message(x)
  tmp<- data.frame(text = paste(pdf_text(x), collapse = ""),   #lagde liste med tekster
                   file = x)
  return(tmp)
}) 

frame <- do.call(rbind, KomsPr)  
library(stringr)
text <- str_trim(str_replace_all(frame$text,   "\\s+\\s+",  " ")) 


text_list <- str_split(text[1:51], pattern= "Источник: Комсомольская правда") 
substr(text_list[[1]], 1, 2000)
substr(text_list[1], 1,4000) 
text_list

Overskrifter <- str_extract_all(text[1:51], "Заглавие:.*[\r\\n]...{1,85}")  # 1:45 av de oprinnelige tekstene.    # Overskrifter <- str_extract_all(text[1:45], "Заглавие:.*[\r\\n].+\\n") # to lshift? 
str_extract_all(Overskrifter[1:47], "[А-ЯЁ]{1}+[а-яё]{2,10}+\\s+[А-ЯЁ]{2,10}") # trekke ut navn og få vite hvor mane som er - overblikk
# det vanlige, output, mye om russlands føderatsija komiteer

t<- str_replace_all(unlist(Overskrifter), "\n", " ") # 
t<- str_replace_all(unlist(t), "Заглавие:", " ") # 
t<- str_replace_all(unlist(t), "(\")", "")
t<- str_replace_all(unlist(t), "\"", "");

substr(t[1:510], 1, 2000)

library(tidyverse)
tekster <- as_tibble(matrix(t))


# forventet antall tekster 
51*10 # [1] 510
tekster # A tibble: 510 x 1   perf.

data <- as_tibble(list(text = as.character(tekster$V1), 
                       kreml = 1,
                       land = "Moldova",
                       rusetn = "lav", 
                       rusmors = "lav", 
                       rusaffek = 5, 
                       FFPfragile = "høy",
                       Russortod = "høy",
                       Plassering = 2,
                       tekst = "overskrift",  
                       tid = "Juni",
                       avis= "KomsPravda"),
                  stringAsFactors = FALSE)



library(quanteda)
corpus <- corpus(data)
corpus$documents$texts
docvars(corpus)
summary(corpus)


####
####

save(corpus, file = "~/Downloads/test/2019/Korpusnye/Corpus_KomsPr_Juni.rda") 
load("~/Downloads/test/2019/Korpusnye/Corpus_KomsPr_Juni.rda")





