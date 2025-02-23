library(geobr)
library(ggplot2)
library(readxl)
library(dplyr)
library(viridis)
library(colorspace)

options(scipen = 999)

dados <- read_xlsx("mapas/R_Macro_Micro2.xlsx")

shp <- geobr::read_micro_region()

shp_minas <- shp %>% 
  filter(abbrev_state == "MG")

shp_merge <- merge(shp_minas, dados[,c("cod", "prod","consumo","investimento","governo","fatores")], by.x = "code_micro", by.y = "cod", all.x = TRUE)

plot_consumo <- ggplot(data = shp_merge) +
  geom_sf(aes(fill = consumo)) +
  scale_fill_continuous_sequential(palette = "Heat") +
  theme_minimal() +
  labs(fill = "Consumo", title = "Consumo das Famílias")

plot_producao <- ggplot(data = shp_merge) +
  geom_sf(aes(fill = prod)) +
  scale_fill_continuous_sequential(palette = "Heat") +  
  theme_minimal() +
  labs(fill = "prod", title = "Produção")

plot_investimento <- ggplot(data = shp_merge) +
  geom_sf(aes(fill = investimento)) +
  scale_fill_continuous_sequential(palette = "Heat") +  
  theme_minimal() +
  labs(fill = "investimento", title = "Investimento")

plot_governo <- ggplot(data = shp_merge) +
  geom_sf(aes(fill = governo)) +
  scale_fill_continuous_sequential(palette = "Heat") +  
  theme_minimal() +
  labs(fill = "governo", title = "Gasto do Governo")

plot_fatores <- ggplot(data = shp_merge) +
  geom_sf(aes(fill = fatores)) +
  scale_fill_continuous_sequential(palette = "Heat") +  
  theme_minimal() +
  labs(fill = "fatores", title = "Fatores Primários/População")