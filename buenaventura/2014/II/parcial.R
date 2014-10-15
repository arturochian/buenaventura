options(stringsAsFactors = FALSE)
library(XBRL)
setwd("~/xbrl/buenaventura/2014/II")
inst <- "XBRLB20003.xml"
xbrl.vars <- xbrlDoAll(inst, verbose=TRUE)
xbrl <- XBRL()
xbrl$setCacheDir("XBRLcache")
xbrl$openInstance(inst)
## Perform a discovery of the taxonomy:
xbrl$processSchema(xbrl$getSchemaName())
## Process instance file:
xbrl$processContexts()
xbrl$processUnits()
xbrl$processFacts()
xbrl$processFootnotes()
xbrl$closeInstance()
xbrl.vars <- xbrl$getResults()
saveRDS(xbrl.vars,"buenaventura2014I.RDS")
buenaventura<-readRDS("buenaventura2014I.RDS")



library(plyr)
library(dplyr)
setwd("~/xbrl/buenaventura/2014/II")
View(buenaventura$fact)
head(buenaventura)
buenaventura$fact %>%
  filter(elementId=="ifrs_NameOfReportingEntityOrOtherMeansOfIdentification")%>%
  #select(elementId, contextId,fact)
  select(fact)

buenaventura$fact %>%
  filter(elementId=="smv_InformacionSobreElInforme")%>%
  #select(elementId, contextId,fact)
  select(fact)



# 1 trimestre del 2013
buenaventura$fact %>%
  filter(elementId=="ifrs_Assets")%>%
  filter(contextId=="id3")%>%
  #select(elementId, contextId,fact)
  select(fact)
a  

buenaventura$fact %>%
  filter(elementId=="ifrs_CurrentAssets")%>%
    filter(contextId=="id3")%>%
  select(fact,contextId)


buenaventura$fact %>%
  filter(elementId=="ifrs_FinanceIncome")%>%
  filter(contextId=="id1")
