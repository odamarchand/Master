
# HER FØLGER NOEN NYTTIGE KODER 


### Fjerne tom tekst
# I enkelte tilfeller dukker det opp tomme tekster. Noen ganger skaper disse problemer. 
# Her følger en "loop" for å løse dette dersom et slikt problem skulle oppstå. 
head(CORPUS, 100)
head(CORPUS)
p <- CORPUS %>% tidy()
pp <- CORPUS %>% tidy()
pp <- p[-c(848), ] # ta ut tekst, for eksempel 848
CORPUS <- corpus(pp) 

# For å finne linjen uten ord, bruker jeg denne koden 
heiehi <- p%>% 
  mutate(text = ifelse(str_detect(text, " "), text, NA))
hhhhsjallabais <- na.omit(heiehi)
CORPUS <- corpus(heiehi)



# Endre navn på variabel fra "medium" til middels" 
# Ved kodingen av datasettet har jeg forvekslet middels med medium. Dette har ingen innvirikning på analysen som er gjort. 
# Følgende koder kan kjøres rette opp i datasettet dersom det skal utvides, og man ønsker å benytte variabler jeg 
# har lagt inn i datasettet for moro skyld. Disse kan benyttes dersom det er ønskelig å tilføye flere land og flere 
# aviser i analyser på region-nivå. I så tilfelle er man nødt til å tilføye en rekke nye land for å få en statistisk 
# signifikant undersøkelse. 

load("/Users/odasmarchand/Downloads/test/2019/Korpusnye/CORPMai.rda") # endre navn på variabler i mai-corpuset

# Endre variabelen "medium" på Russortod, til middels. Avvikene er irrelevante for oppgavens funn. 
test <- CORPMai
test <- test %>% 
  tidytext::tidy() %>% 
  mutate(Russortod = ifelse(Russortod == "medium", "middels", Russortod)) %>%
  corpus()

table(docvars(test, "Russortod"))
Ii <- as.data.frame(docvars(test)) 
CORPMai <- test


# endre "medium" på variabelen rusetn til middels, bare for ryddigheten
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


