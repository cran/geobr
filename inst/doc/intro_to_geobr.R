## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
# Load geobr and other libraries we'll use
  library(geobr)
  library(ggplot2)
  library(sf)
  library(dplyr)
  library(rio)


## ----message=FALSE,warning=FALSE,results='hide'--------------------------
# download data
  state <- read_state(code_state="SE", year=2018)          # State
  micro <- read_micro_region(code_micro=160101, year=2000) # Micro region


## ----message=FALSE,warning=FALSE,results='hide'--------------------------
# download data
  meso <- read_meso_region(code_meso="PA", year=2018)      # Meso region
  muni <- read_municipality(code_muni= "AL", year=2007)    # Municipality


## ----message=FALSE,warning=FALSE,results='hide'--------------------------
# download data
  state <- read_state(code_state="all", year=1991)         # State
  meso <- read_meso_region(code_meso="all", year=2001)     # Meso region


## ---- fig.height = 8, fig.width = 8, fig.align = "center",message=FALSE,warning=FALSE----

# No plot axis
  no_axis <- theme(axis.title=element_blank(),
                   axis.text=element_blank(),
                   axis.ticks=element_blank())



# Plot all Brazilian states
  ggplot() + 
    geom_sf(data=state, fill="#2D3E50", color="#FEBF57", size=.15, show.legend = FALSE) + 
    labs(subtitle="States", size=8) + 
    theme_minimal() +
    no_axis
  

## ---- fig.height = 8, fig.width = 8, fig.align = "center",message=FALSE,warning=FALSE----
# Download all municipalities of Rio
  all_muni <- read_municipality( code_muni = "RJ", year= 2000)

# plot
  ggplot() + 
    geom_sf(data=all_muni, fill="#2D3E50", color="#FEBF57", size=.15, show.legend = FALSE) +
    labs(subtitle="Municipalities of Rio de Janeiro, 2000", size=8) + 
    theme_minimal() +
    no_axis
    

## ---- fig.height = 8, fig.width = 8, fig.align = "center",message=FALSE,warning=FALSE----

# download Life Expectancy data
  adh <- rio::import("http://atlasbrasil.org.br/2013/data/rawData/Indicadores%20Atlas%20-%20RADAR%20IDHM.xlsx", which = "Dados")



# keep only information for the year 2010 and the columns we want
  adh <- subset(adh, ANO == 2014)
  
# Download the sf of all Brazilian states
  all_states <- read_state(code_state= "all", year= 2014)

  
# joind the databases
  all_states <-left_join(all_states, adh, by = c("abbrev_state" = "NOME_AGREGA"))

## ---- fig.height = 8, fig.width = 8, fig.align = "center",message=FALSE,warning=FALSE----

  ggplot() + 
    geom_sf(data=all_states, aes(fill=ESPVIDA), color= NA, size=.15) + 
      labs(subtitle="Life Expectancy at birth, Brazilian States, 2014", size=8) + 
      scale_fill_distiller(palette = "Blues", name="Life Expectancy", limits = c(65,80)) +
      theme_minimal() +
      no_axis


