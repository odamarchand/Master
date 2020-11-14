
### analysen av mai bekrefter at det gir lite mening å behandle alle i en blokk, når
### hensikten ikke er å måle Kreml-variabelen. 
### flere grunner, Martin: 

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
setwd("~/Downloads/test/2019/Korpusnye")

## Topicmodell land




                  ################################################################################################
                  ################################################################################################
                  ################################################################################################
                  ################################################################################################

                                                          # MOLDOVA #

                  ################################################################################################
                  ################################################################################################
                  ################################################################################################
                  ################################################################################################

                          
                          ### ##### RRUSISK "PROPAGANDA" I MOLDOVA, SPUTNIK OG KOMSKOMOLSKAYA PRAVDA ### ###


load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/MOLDOVA.rda")
MOLDOVA # Corpus consisting of 6,668 documents and 12 docvars.


# endrer fra KORPUS MODLOVA til dataframe # snowball DRITTPAKKE!!!! # aldri fjerne tall, 9 mai-propagandaen kan 
# forsvinne da!
# NB NB NB !!!!
### update: fjernet tall til slutt da det skapte masse problemer


#### fra nå av fjerner jeg tall likevel. Metodevalg - mister 9. mai men var så mye tull med tall tidligere. 
# tok det bare med for mai. 


# ikke poeng å endre de to variablene, fordi de blir ikke relevante her. 

# lage korpus til dfm
corp_DFM_Moldova <- dfm(MOLDOVA,       
                remove_punct = TRUE,
                remove_symbols = TRUE, 
                remove_numbers = TRUE,  #  dukket opp beskjed om at metadataen her $clean_remove_digits
                remove_twitter = TRUE, 
                remove_url = TRUE,
                remove_hyphens = TRUE, 
                remove_separators = TRUE,tolower = TRUE, 
                remove = c(stopwords("russian"),
                           stopwords::data_stopwords_stopwordsiso$uk,"[0-9]{1,10}", "ð", "ñ", "это", "как", "і", "з", 
                           "що", "та",  "це",  "як",  "чи",  "але", "как", "russian", "(Russian)", "вести",
                           "Obozrevatel.com",  "ах", "all", "date", "filters", "industries", "language", "languages", "region",
                           "all", "date", "filters", "industries", "languages", "languages", "region", 
                           "e-mail", "новoсть", "sputnikpro", "sputnik",  "Sputnik",  "postimees",  "postimeer",
                           "которые", "газета", "Komsomolskaya Pravda", "Комсомольская правда", "спутник")) #  kjøre på nytt

topfeatures(corp_DFM_Moldova , 100)  

#corp_DFM_trim <- dfm_trim(corp_DFM_Moldova, # Ord skal dukke opp i minst 1 % og maks 99 % av dokumentene.
 #                         min_termfreq = 0.0009, # Ord som dukker opp veldig sjelden.
                          #min_docfreq = 0.002, # Ord som dukker opp veldig ofte.
   #                       termfreq_type = "prop") # ??

corp_DFM_trim <- dfm_trim(corp_DFM_Moldova,
                          max_termfreq = 0.002, # fjernes dersom dukker opp i mer enn 50 prosent
   # tas ut fordi docsletting fucker opp K results # min_docfreq = 1, # dukker det opp i flere enn 1000 dokumenter, fjern  # av 6668 dokumenter
                          termfreq_type = "prop") # ??


topfeatures(corp_DFM_trim, 100)  # 20 top words [a bit better]

# corp_DFM_trim <- corp_DFM  #  når/hvis jeg hopper over corp_DFM_trim


# veldig sparse fortsatt 
quantdfm <- corp_DFM_trim [rowSums(corp_DFM_trim) > 0, ]
quantdfm

# quan <- corp_DFM [rowSums(corp_DFM_trim) > 0, ]
# quan

# kan ikke trimme noe mer. президент, 947 frexblir borte ellers. 0.002 mX TERM FREQ. kjøre det samme på resten nå. 
# knske endre min docfreq avh av hvor mange artikler det er. 
# januar og frebruar er med. vet ikk emed de andre månedene. og mai. mars og. apr. 
# andre ting er tatt bort - stopw og bindestrek ord - kan ha noe å si. # stoppord på ukrainsk eller andre 
# dialekter blir ikke alltid fjernet og kan ende opp i emenen - og må ta bort soppord på alt for
# å gjøre det sammenlignbart. 
# 6,667 documents, 13,929 features (99.6% sparse).
# Ikke tatt vekk doc og 0.002 grense: Document-feature matrix of: 6,668 documents, 82,978 features (99.9% sparse).

# gjør om til stm
g <- convert(corp_DFM_trim, to = "stm")
# ferdig med prepp




set.seed(2019)

k_results <- searchK(documents = g$documents, vocab = g$vocab, 
                     max.em.its = 1000,
                     K = c(30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 45), data = g$meta, set.seed(2019)) 

save(k_results, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/k_results_MOLDOVA3.rda")
# load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/k_results_MOLDOVA.rda")

# For replikasjon: ved øknske om replikasjon må man naturligvis sette inn sine egne versjoner av testene, akkurat som man lagrer på egen browser..

plot(k_results)

# dev.off()
# install.packages("ggplot2")
# library(ggplot2)


# Another alternative
k_result_plotdata <- data.frame(Exclusivity = k_results$results$exclus,
                                Coherence = k_results$results$semcoh,
                                Heldout = k_results$results$heldout,
                                Residual = k_results$results$residual,
                                K = k_results$results$K)
library(reshape2)
k_result_plotdata <- melt(k_result_plotdata, measure.vars = c("Exclusivity", "Coherence",
                                                              "Heldout", "Residual"))


?melt 
?melt.data.table
load(reshape2)
load(data.table)
library(reshape2)


ggplot(k_result_plotdata, aes(x = K, y = value, color = variable)) + # colour = variable i stedet for metric
  facet_wrap(~variable, scales = "free_y") +
  geom_line(size = 1.5, alpha = 0.7, show.legend = FALSE) + # tok inn 
  geom_point() +
  geom_line() +
  theme_bw() +
  labs(y = NULL, x = "Number of topics")





                                              ########### stm #############
                                              ####### TOPIC MODELLING #####



# LDA MED 35 TEMAER

m37MOLDOVA <- stm(documents = g$documents,
                    vocab = g$vocab,
                    data = g$meta,
                    K = 37,
                    init.type = "LDA", 
                    max.em.its = 10000,
                    set.seed(2019), 
                    prevalence = ~ factor(avis))  

stm <- m35MOLDOVA 

# 35 emner
save(m35MOLDOVA, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/m35MOLDOVA")
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/m35MOLDOVA")
save.image("/Users/odasmarchand/Downloads/test/2019/Korpusnye/m35MOLDOVA") 
stm <- m35MOLDOVA 

# 37 emner
save(m37MOLDOVA, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/m37MOLDOVA")
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/m37MOLDOVA")
stm <- m37MOLDOVA 


plot(stm) # plot
stm$settings$dim$K # sjekker antall emner





              ######## sjekker sider, egenskaper ved emnene



# Topplading med frekvens # FREX
labelTopics(stm, topics=NULL, n=37, frexweight = 0.5 ) # ?  0.5 - kun frekvens? 
terms <- labelTopics(stm, c(1:stm$settings$dim$K))  # Lgger objekt via LabelTopics, med alle temaene
terms
        
#FREX: topladetermer på emnene, de som har høyest frekvens.  
terms$frex[1:10, ] # head(terms$frex)[1:6, ]   
terms$frex[31, ] ## nummeret er Temaet, emnet, topic-et
terms$frex[2, ] ## eventuelt 

# sjekke ord og sammenheng
kwic(MOLDOVA$documents$texts, "бессмертный", 50) # 
kwic(MOLDOVA$documents$texts, " ", 10) # 
kwic(MOLDOVA$documents$texts, " ", 10) # 








###############
#De emnene som har høyest andel ###########≈÷alt+
# en seksjon jeg forstår lite av. En seksjon som jeg må gjennomgå, siden. 

# Toppsannsynlighet ord i emnene

# stm$theta inneholder porporsjoner for hvert dokument de 10 største emnene eller flere 
top_prop <- data.frame(topic = paste0("Topic ", 1:ncol(stm$theta)),        # thetaverdiene ..?
                       m_prop = apply(stm$theta, 2, mean),                 # thetaverdienes gjennomsnittet av alle ordene?
                       top_frex = apply(labelTopics(stm, n = 37)$frex, 1,  # toppfrekvens ordene
                                        function(x) paste(x, collapse = ", ")))


# Ordene i emnene med høyest sannynlighet for forekomst i hvert emne
top_prop$topic <- factor(top_prop$topic, levels = top_prop$topic[order(top_prop$m_prop)])
head(top_prop)
top_prop

# PLOT  MOLDOVA 
top_prop %>% 
  arrange(desc(topic)) %>% #top proposjons, arragned by topics
  head(n = 37) %>%  #lowest/highest tail vs head 20 topics only, kan ikk ta med alle
  ggplot(aes(x = topic, y = m_prop * 100)) + # prosent i stedetf ro proporsjoner
  geom_bar(stat = "identity", fill = rep(c("#0046AE", "#0046AE", "#0046AE", "#0046AE", "#0046AE", "#0046AE", "#0046AE", "#0046AE",  "#0046AE", "#0046AE", "#0046AE", "#0046AE", "#0046AE", "#FFD200", "#FFD200", "#FFD200", "#FFD200", "#FFD200", "#FFD200", "#FFD200", "#FFD200", "#FFD200", "#FFD200", "#FFD200", "#FFD200", "#CC092F", "#CC092F", "#CC092F", "#CC092F", "#CC092F", "#CC092F", "#CC092F", "#CC092F", "#CC092F", "#CC092F", "#CC092F", "#CC092F"), 1)) + # "#fdb913","#006a44","#c1272d"
  #geom_text(aes(label = top_frex), vjust = 0, hjust = 1.1) + # label as topic wiords , move inside bare
  coord_flip() + # flip plottet
  scale_y_continuous(expand = c(0, 0), breaks = seq(0, 0.1, 0.001) * 100) + # move bare to base of axes, hvis ike får det et gap
  labs(x = NULL, y = "Forventet emneproporsjon") # change y axes label ish, move noe label greier 



# hva skjer her? Og hva er forskjellen på prob, m_, thetea, frex
OOO <- as_tibble(t(labelTopics(stm, n = 10)$prob)) 



# Navngi emnene 
top_prop2 <- top_prop
top_prop2$label <- NA
top_prop2$label <- c("gulavis", "offiserFengsel", "Eurovision", "BallistiskMissil", "Urix", "Ukraina", "MissUniverse", "tullball")



############### linjen her må klikkes på.# disse må åpnes opp. # gå gjennom siden! 
# Her er det også oppskrift på plotting av emnenes andeler. # DETTE må jeg tilbake til senere


##### FORDELINGEN MELLOM KOVARIATENE #####
##### emner: 
alltopicseffect <- estimateEffect(~ avis, 
                                  stmobj = stm, metadata = g$meta, nsims = 200)

save(alltopicseffect, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/alltopicseffectAvis35MOLDOVA.rda")
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/alltopicseffectAvis35MOLDOVA.rda")

save(alltopicseffect, file = "/Users/odasmarchand/Downloads/test/2019/Korpusnye/alltopicseffectAvis37MOLDOVA.rda")
load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/alltopicseffectAvis37MOLDOVA.rda")


# kjør bare hei
# putt inn [1] [[1]] osv her 
# husk $topics [1]    og $means[[1]]     $cis[[1]]

# for å få alt i ett plot
heiMoldova <- plot(alltopicseffect, covariate = "avis" )

# For å få alle verdiene, Konfidensintervall etc
heiMoldova


# PLOT AV EMNENES FORDELING

# enkelt plot
par(mfrow=c(1,1), mar=c(1,4,1,1))
par(oma = c(1,2,1,1), xpd = F)
plot(alltopicseffect, covariate = "avis", topic = 27 ) #  hvis man ikke skriver inn emne, komemr alle opp
par(mfrow=c(1,1))

# mer avansert plot
par(mfrow=c(1,1),  mar=c(2,2,2,2))
par(oma = c(2,6,2,2), xpd = F)
plot.estimateEffect(alltopicseffect, covariate = "avis", topics = 27,
                    model = stm, method = "pointestimate",
                    xlab = "Forventet proporsjon",
                    main = "тема",
                    xlim = c(-.001, .05))    

# Method used for plotting. 
# "pointestimate" estimates mean topic proportions for each value of the covariate. 
# "difference" estimates the mean difference in topic proportions for two different values of the covariate (cov.value1 and cov.value2 must be specified). 
# "continuous" estimates how topic proportions vary over the support of a continuous covariate.

print(plot(alltopicseffect, covariate = "avis", topic = 25)) 
par(mfrow=c(1,1))
plot(alltopicseffect, covariate = "avis", topic = 24) #  
par(mfrow=c(1,1))


### Finne tekstene!!! 

# finne tekstene på hvert emne
findThoughts(stm, texts = MOLDOVA$documents$texts, n = 10, topics = 20) # 





#### DENNNE ER GULL!!
# Finne tekstene som har høyest sannsynlighet for å lade på dette emnet!
top_texts <- findThoughts(stm, MOLDOVA$documents$texts, topics = 32, n = 15) 
top__texts <- str_sub(MOLDOVA$documents$texts[ top_texts$index$`Topic 32`], 1, 200) 
top__texts


# Bruker kwik for å finne ut mer om dem
kwic(MOLDOVA$documents$texts, "ес", 70) 
kwic(MOLDOVA$documents$texts, "агентов", 70)

kwic(MOLDOVA$documents$texts, "конституция", 20)
kwic(MOLDOVA$documents$texts, "беженец", 70)
kwic(MOLDOVA$documents$texts, "нейтральна", 5)


#нейтральный
#нейтраль
#нейтральная   не ресылтаты
#нейтрально
# Молдова не нейтральна
#конституция
#нейтральна

kwic(MOLDOVA$documents$texts, "цензурирования", 5)
#цензурирования
kwic(MOLDOVA$documents$texts, "Молдова", 0)
#цензура

#Молдова
#молдавский
kwic(MOLDOVA$documents$texts, "цензура", 10)


# ([text3503, 328])     






######## 
#тема # 
# Method used for plotting.
# Kan sette inn: labeltype = "custom") # prob, ingenting kan også velges # custom.labels = c(
# "pointestimate" estimates mean topic proportions for each value of the covariate. 
# "difference" estimates the mean difference in topic proportions for two different values of the covariate (cov.value1 and cov.value2 must be specified). 
# "continuous" estimates how topic proportions vary over the support of a continuous covariate.
########







#####
as_tibble(t(labelTopics(stm, n = 10)$prob))
??findThoughts



# K result alternativ modell
oo <- plotModels(model_select, pch = c(1,2,3,4), legend.position = "bottomright")









                ##############      ##############    ###         ####        ############## #############                      ###  ########              #########    #########             ####         ######### #
                ##############      ##############    #          ###         #############              #####                  ##    ########             #########     #########               ####      #########     #
                ##############      ##############    #          ##          ##############              ######              ##        ######             #########     ######### ##            #         #########       # 
                ##############      ##############    ###      ###            ##############              ######             ##          ####             #########     #########   ##          #         #########         #
                ##############      ##############    ###    ###             ##############                ######           ##           ####             #########     #########     ##        #         #########   #####   #
                ##############      ##############    ### ###                 ##############              ######           ##  ##############             #########     #########       #       #          #########  #####   #
                ##############      ##############    ### ## #  ##           ##############              ######            ##  ##############             #########     #########         #     #          #########          ##
                ##############      ##############    ###        # ##         ##############         ######                ##            ####             #########     #########           #   #          #########           #
                ##############      ##############    ###         ###        ##############  ######                       ##               ##             #########     #########            #  #          #########           #
                ##############      ##############    ###         ##         ##############    ######                    ##                ###            #########     #########             # #          #########            #
                ##############      ##############    ###         ###         ##############         ######              ##                ####           #########     #########              #           #########             #
                ##############      ##############    ###         ###        ##############          ######            ##                  ########       #########     #########               #         #########               #
                #################################     ###           ###        ###########             ###### ##     ##                      ########   #########     #########                  #     #########                    #




 
 



