

####### Analyse Mai Le Topic Model #### 

#### Pakker ####
library(knitr)            # Produce R markdown
library(stringr)          # Manage text
library(dplyr)            # Structure data
library(ggplot2)          # Make nice plots
library(stm)              # (Structural) Topic Models
library(png)              # Png image to plot
library(grid)             # Print png in plot window
library(quanteda)         # For working with corpora
library(quanteda.corpora) # Data corpora package
library(rjson)
library(readtext)
library(tidytext)
library(quanteda)
library(tidyverse)
library(stm)
library(rsvd)
library(Rtsne)

getwd()
setwd("~/Downloads/test/2019/Korpusnye")


load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/CORPMai.rda")

head(CORPMai, 100)
head(CORPMai)
#ffffff <- as.data.frame(docvars(CORPMai)) 
p <- CORPMai %>% tidy()
pp <- CORPMai %>% tidy()

# ta ut tekst 848  - endelig ble den funnet!!
pp <- p[-c(848), ]
CORPMai <- corpus(pp)

#heiehi <- p%>% 
#  mutate(text = ifelse(str_detect(text, " "), text, NA))
#hhhhsjallabais <- na.omit(heiehi)
# CORPMai <- corpus(heiehi)
 

# endrer fra KORPUS 
# til en data frame matrix   
# fjerner ikke tall, fjerner ikke stopwords - de er uansett russiske og tviler på at den eng pakken er laget for russisk  
corp_DFM <- dfm(CORPMai,       
                remove_punct = TRUE,
                remove_symbols = TRUE, 
                remove_numbers = FALSE, #  dukket opp beskjed om at metadataen her $clean_remove_digits
                tolower = TRUE, 
                remove = c(stopwords("russian"),
                stopwords::data_stopwords_stopwordsiso$uk, "ð", "ñ", "это", "как", "і", "з", 
                "що", "та",  "це",  "як",  "чи",  "але", "как", "russian", "(Russian)", "вести",
                "Obozrevatel.com",  "ах", "all", "date", "filters", "industries", "language", "languages", "region",
                "0,2", "all", "date", "filters", "industries", "languages", "languages", "region", 
                "e-mail", "новoсть", "1-7", "71.", "0,5", "0,49", "014", "13a", "13a", "10313", "35.2", 
                "2499", "5687", "820", "0.01", "0.22", "1,4", "100500", "10318", "10318-1", "14-15-16", 
                "1157", "1265", "0.2-0.5", "0.2734", "0.2742", "0.2747", "0.6721", "0.6773", "0.75", "0,75",
                "1.062", "1.227", "5-2,5", "13a", "26a", "sputnikpro", "sputnik",  "sputnik",  "postimees",  "postimeer",
                "которые", "газета", "13,9", "15,3", "18,3", "150-170", "157", "14.15", "213,9", "15,3", "18,3", "145-я", "15.37", "17,9-18,2", 
                "1,5-2,1", "13,5-15", "750-830", "283-116", "16,5", "17,2", "2-5", "10,4", "26,24", 
                "32,13", "33,47", "0-3", "0,3-1,0", "06.10", "06.23", "1-3", "1-6",  "35,2", 
                "0,6", "1,92", "0,86",  "1,23", "1166", "123456","10-15-20", "1187", "17-14-8")) #  kjøre på nytt

########
## har også korte docs. 
# trimmet ikke ike i Mai 
#corp_DFM_trim <- dfm_trim(corp_DFM, # Ord skal dukke opp i minst 1 % og maks 99 % av dokumentene.
#                          min_docfreq = 0.01, # Ord som dukker opp veldig sjelden.
#                          max_docfreq = 0.9, # Ord som dukker opp veldig ofte.
#                          docfreq_type = "prop") # ??
# topfeatures(corp_DFM_trim, 70)  # 20 top words [a bit better]

# viktig å kjøre om jeg ikke trimmer! får med stopwords ny
 corp_DFM_trim <- corp_DFM  #  når/hvis jeg hopper over corp_DFM_trim
 
# veldig sparse fortsatt 
#quantdfm <- corp_DFM_trim [rowSums(corp_DFM_trim) > 0, ]
#quantdfm
#quan <- corp_DFM [rowSums(corp_DFM_trim) > 0, ]
#quan

# gjør om DFM-en til en stm
# dfm2stm <- convert(corp_DFM_trim, to = "stm")
# Warning message: Dropped empty document(s): text37, text71, text185, text197, text317, text346, text379, text848 hvorfor skjer det? 
########

### WTF!?
# lager vektor for testen K - denne tas senwew
# K <- c(10, 40, 70, 100)

g <- convert(corp_DFM_trim, to = "stm")


set.seed(2019)

## Velger LDA, tar kortere tid, og dessuten bedre å bestemme emner selv. Er det under 40 000 ish 
# kan den gi rare resultater når den selv setter emner. 
stm25KremlLand <- stm(documents = g$documents,
           vocab = g$vocab,
           data = g$meta,
           K = 25,
           init.type = "LDA", 
           max.em.its = 10000,
           set.seed(2019), 
           prevalence = ~ factor(kreml) + factor(land))  
          

# stm15kremlKLand <- stm15kreml
#stm18KremlLand <- stm15KremlLand 
stm <- stm25KremlLand  
#stm <- stm18KremlLand
cor(p)
stm <- stm25AvisLand
#stm2 <- stm25rusmorsAvis
#stm2 <- stm25rusmorsAvis
#stm2K<- stm25rusmorsKreml
#stm3 <- stm25rusetnAvis
#stm3a <- stm25rusetnKrem

#########
####### DENNE BENNYTTES IKKE I OPPG
#Russortod
#stm4<- stm25RussortodAvis
#save(stm25RussortodAvis, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/stm25RussortodAvis")

####### DENNE BENNYTTES IKKE I OPPG
#FFP
#stm5 <- stm25FFPAvis
#save(stm25FFPAvis, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/stm25FFPAvis")



####### DENNE BENNYTTES IKKE I OPPG
#save(stm25rusetnKrem, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/stm25rusetnKrem")

# modellen med rusmorsmål og kreml kjøres natt til 3. okt
#save(stm25rusmorsKreml, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/stm25rusmorsKreml")
# ble ikke lagret? 

#avis+rusmors
# stm25rusmorsAvis  kjørt
#save(stm25rusmorsAvis, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/stm25rusmorsAvis")
# lagret g2 

# lagre modellen med entnisitet og avis stm25rusetnAvis
#save(stm25rusetnAvis, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/stm25rusetnAvis")
#stm3 lagret

#russortod og Avis
#save(stm25RussortodAvis, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/stm25RussortodAvis")

#russortod og Avis
#save(stm25FFPAvis, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/stm25FFPAvis")

# save.image("/Users/odasmarchand/Downloads/test/2019/Korpusnye/LDAMai15kreml.rda") 
# save(stm25KremlLand, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/stm25KremlLand")
#load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/stm25KremlLand")
# en statusoppgradering som sitter dypt befestet i russernes identitet
# load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/stm15kremlKLand.rda")

# kjøre på nytt medd dise også
#########



                                        #### ###### THE SHIT #####



                                          # Variabel: KREML 01.  Kontrollvariabel: Land 
# kreml og land en gang til  nr 2
save(stm25KremlLand, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/stm25KremlLand2")
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/stm25KremlLand2")



                                          # kontrollvariabel: avis + land

# modellen med kreml (avisvarabel) og land kjørt 2. okt
save(stm25AvisLand, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/stm25AvisLand")
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/stm25AvisLand")

# Avis mot land versus Kreml mot land, modellene resulterer i veldig like emner. 


# noe geier fra en test med mai, 15 emner.. forstår ikke hva jeg laget her 
###############
# ikke kjør 
stm <- stm(documents = g$documents,
           vocab = g$vocab,
           data = g$meta,
           K = 12,
           init.type = "Spectral", 
           max.em.its = 100000,
           prevalence = ~ factor(kreml)) 
# factor(land) * factor(rusetn) * factor(rusmors) * factor(rusaffek) * factor(FFPfragile) * factor(Russortod) * factor(Plassering) * factor(tekst) * factor(avis) * factor(arkiv))  
# ha med kontrollering for antall aviser 
# skal jeg velge antall av hver? 
# neste: ta ut ting. kjøre kun avis
# deretter: kntrolllere for tekst 
# putte inn samspill? 
# kontrollere for mengden tekster
# TIl senere, fra Martin legge inn vars i liste, loop og legge inn i et plott felles
# teste est effect 
# stm og spectral går ikke med under 30/40 000
# tmp <- estimateeffect(c(topicnummer)) - kreml, stm, g$meta, nsims= 500) 
plot_tall <- plot(tmp, "kreml") # da kommer det et objekt - print det  . snittet, er prikkene,  k så kommer konfidentintervall cis. 
#plot_tallu$uvals
# plot_df <- data.frame()
# lm(av - uv1 + uv2 + uv...)
# stm::estimateEffect()
# Warning message:#####
#In doTryCatch(return(expr), name, parentenv, handler) :
 # display list redraw incomplete
## ukrainsk språk endrer!!
# factor(tid) er tatt ut 
save.image("/Users/odasmarchand/Downloads/test/2019/Korpusnye/LDAMai15.rda") 
save(stm15, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/LDAMai15.rda")
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/LDAMai15.rda")
#################




plot(stm) 
stm25KremlLand$settings$dim$K


labelTopics(stm25KremlLand, topics=NULL, n=10, frexweight = 0.5 )
terms <- labelTopics(stm25KremlLand, c(1:stm25KremlLand$settings$dim$K))  # maiking obj from label topics function, doing all topics 
head(terms$frex)[1:6, ]  # med dollartegn får man 4 use majors for toploading terms for each topic
head(terms$frex)[1:5, ]
terms$frex[1:10, ]

terms
kwic(CORPMai$documents$texts, "антихакеры", 10) # latvia-emnet? 
kwic(CORPMai$documents$texts, "banana", 10) # israel-sangen eurov
kwic(CORPMai$documents$texts, "bulletin", 10) # publisert i 
kwic(CORPMai$documents$texts, "помпео", 10)
kwic(CORPMai$documents$texts, "13а", 10)
kwic(CORPMai$documents$texts, "022", 10)
kwic(CORPMai$documents$texts, "10-15-20", 10)
kwic(CORPMai$documents$texts, "10162", 10) #dekret
kwic(CORPMai$documents$texts, "83-116", 10)

# toppemnene
terms$frex[1, ]  # ð  ñ  ta ut driten der 
terms$frex[2, ]
terms$frex[3, ]
terms$frex[4, ]
terms$frex[5, ]
terms$frex[6, ]
terms$frex[7, ]
terms$frex[8, ]
terms$frex[9, ]
terms$frex[10, ]
terms$frex[11, ]
terms$frex[12, ]
terms$frex[13, ]
terms$frex[14, ]
terms$frex[15, ]

# Top PROP
# stm$theta contains proportions for each document in each topic
top_prop <- data.frame(topic = paste0("Topic ", 1:ncol(stm$theta)),
                       m_prop = apply(stm$theta, 2, mean),
                       top_frex = apply(labelTopics(stm, n = 10)$frex, 1,  # hvor mange ord inni der
                                        function(x) paste(x, collapse = ", ")))

top_prop$topic <- factor(top_prop$topic, levels = top_prop$topic[order(top_prop$m_prop)])
head(top_prop)


top_prop %>% 
  arrange(desc(topic)) %>% #top proposjons, arragned by topics
  tail(n = 9) %>%  #lowest 20 topics only, kan ikk ta med alle
  ggplot(aes(x = topic, y = m_prop * 100)) + # prosent i stedetf ro proporsjoner
  geom_bar(stat = "identity", fill = rep(c("royalblue4", "snow", "darkred"), 3)) + # 
  geom_text(aes(label = top_frex), vjust = 0, hjust = 1.1) + # label as topic wiords , move inside bare
  coord_flip() + # flip plottet
  scale_y_continuous(expand = c(0, 0), breaks = seq(0, 0.1, 0.001) * 100) + # move bare to base of axes, hvis ike får det et gap
  labs(x = NULL, y = "Expected topic proportion") # change y axes label ish, move noe label greier 


# forsøk ## bytte inn 
# data = g$meta  
# data = g$meta$text
#documents = g$documents,
# vocab = g$vocab,
# data = g$meta,



findThoughts(stm, texts = CORPMai$documents$texts, n = 3, topics = 6) # nå  # på metadata får jeg ikke noe 
#as_tibble(t(labelTopics(stm, n = 10)$prob))
# vet ikke hvorfor det gikk nå, for originalkoden omhandler META  før: 
findThoughts(st_stm, poliblog5k.meta$text, topics = 0, n = 200)  #dette er tekster, ikke tegn
#dete er toop laoding text on this topic

top_texts <- findThoughts(stm, CORPMai$documents$texts, topics = 6, n = 20) # nå
#bytter ut for hver tekst, for å finne ut mer. før: 
top_texts <- findThoughts(stm, poliblog5k.meta$text, topics = 0, n = 10)  # kan også ta top 10 text, 

# min går dersim setter inn docs text 
top__texts <- str_sub(CORPMai$documents$texts[ top_texts$index$`Topic 6`], 1, 350) # nå
top__texts <- str_sub(poliblog5k.meta$text[ top_texts$index$`Topic 9`], 1, 50)  # før 

top__texts
kwic(CORPMai$documents$texts, "вышинского", 70)

# for labeling   ####     må her vente til alle emnene har fått navn eller til jeg kjører færre emner
top_prop2 <- top_prop
top_prop2$label <- NA
top_prop2$label <- c("gulavis", "offiserFengsel", "Eurovision", "BallistiskMissil", "Urix", "Ukraina", "MissUniverse", "tullball")


# паксас, пеннингтон, торрес, ракель, крокмаз, тиша 
kwic(CORPMai$documents$texts, "вышинского", 70)

summary.lm

# Her kan jeg velge topics som inneholder mest "propaganda". Må begrunne og si noe om hvor stor plass disse emnene tar. 
# se på hver faktor for seg selv, f eks om krem eller ikke krem-aviser diskuterer disse mest. Putt altså inn 
# en faktor på rating. på metadata, prøv å sette inn   data = g$meta,  
# stm3 er avis 
# stm3a er kreml
# bergener med avis og rusetn
# alltopicseffect <- estimateEffect(~ rusetn, 
                                 # stmobj = stm3a, metadata = g$meta, nsims = 200)



# Lazy plotting
par(mfrow=c(1,1), mar=c(1,4,1,1))
par(oma = c(1,2,1,1), xpd = F)
plot(alltopicseffect, covariate = "rusetn", topic = 1) #  
par(mfrow=c(1,1))




# Disse to, både  1) stm25KremlLand   2) stm25AvisLand  gir tilsammen riktige plot. Avis og Kreml
# er vektet mot Land, fordi Avis og Kreml ville overlappet hverande. 


# A # Kreml og land  i stm25KremlLand, her testes deres altopicseffect 
                         

                                 # Alltopicseffect basert på LDA-en stm25KremlLand 
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/stm25KremlLand2")

# velg mellom ~ land  og ~ kreml og avis

# land - denne har jeg kjørt på nytt i mars for å hente ut konfidensintervallene. 
alltopicseffect <- estimateEffect(~ land, 
                                  stmobj = stm25KremlLand, metadata = g$meta, nsims = 200)


save(alltopicseffect, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/alltopicseffect25KremlLandLAND.rda")
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/alltopicseffect25KremlLandLAND.rda")
hei <- plot(alltopicseffect, covariate = "land") # For å få tall på verdiene fra plottet



# denne var lagret her fra før av  -  KREML  # IKKE !!!!! KJØR NOE NYTT HER
alltopicseffect <- estimateEffect(~ kreml, 
                                  stmobj = stm25KremlLand, metadata = g$meta, nsims = 200)
save(alltopicseffect, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/alltopicseffect25KremlLand.rda")
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/alltopicseffect25KremlLand.rda")
hei <- plot(alltopicseffect, covariate = "kreml") # For å få tall på verdiene fra plottet


# B Her brukes TOPICmodellen som inneholder avis kontrollert mot land 
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/stm25AvisLand")

# g mars
alltopicseffect <- estimateEffect(~ avis, 
                                  stmobj = stm25AvisLand, metadata = g$meta, nsims = 2000)

#save(alltopicseffect, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/alltopicseffectstm25AvisLandAVIS.rda")
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/alltopicseffectstm25AvisLandAVIS.rda")

# lagre uten å overskrive
#save(alltopicseffect, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/alltopicseffectstm25AvisLandAVIS2000nsim.rda")
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/alltopicseffectstm25AvisLandAVIS2000nsim.rda")



hei <- plot(alltopicseffect, covariate = "avis") # For å få tall på verdiene fra plottet


par(mfrow=c(1,1))
plot.estimateEffect(alltopicseffect, covariate = "avis", topics = 24,
                    model = stm25KremlLand, method = "pointestimate",
                    xlab = "Forventet proporsjon",
                    main = "тема 24",
                    xlim = c(-.04, .10)) 
                    # labeltype = "custom")  # ,  # prob, ingenting kan også velges
                   # custom.labels = c(
                    #  'Kreml', ' ≠ Kreml'))


# Method used for plotting. 
# "pointestimate" estimates mean topic proportions for each value of the covariate. 
# "difference" estimates the mean difference in topic proportions for two different values of the covariate (cov.value1 and cov.value2 must be specified). 
# "continuous" estimates how topic proportions vary over the support of a continuous covariate.


print(plot(alltopicseffect, covariate = "kreml", topic = 25)) 
par(mfrow=c(1,1))

# fyll inn temaet som skal plottes
plot(alltopicseffect, covariate = "avis", topic = 24) #  
par(mfrow=c(1,1))

plot(alltopicseffect, covariate = "avis", topic = 6) #  
par(mfrow=c(1,1))




#? as_tibble(t(labelTopics(stm, n = 10)$prob))













 ## K.tester finn ut om dette ble brukt 


# SOLEIGS forslag 

# Finne antall topics

# dfm_stm <- convert(paragraphs_corpus_dfm_trim, to = "stm")  # har allerede konvertert

k_results <- searchK(documents = g$documents, vocab = g$vocab, 
                     K = c(5, 10, 30, 50, 70, 100, 150, 200), data = g$meta)

save(k_results, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/k_results.rda")



# ny tesst
k_results <- searchK(documents = g$documents, vocab = g$vocab, 
                     K = c(5, 10, 15, 20, 25, 30, 35), data = g$meta)

save(k_results, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/k_results2.rda")
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/k_results2.rda")

# To select the best model (coherence and exclusivity)
model_select <- selectModel(g$documents, g$vocab, K = 20,
                            max.em.its = 1000, data = g$meta, runs = 20, seed = 8458159)

#ikke kjørt ferdig gang 2 

save(model_select, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/model_select2.rda")


oo <- plotModels(model_select, pch = c(1,2,3,4), legend.position = "bottomright")











