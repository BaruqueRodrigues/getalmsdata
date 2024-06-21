
<!-- README.md is generated from README.Rmd. Please edit that file -->

# getalmsdata

# Coleta de Proposições Legislativas da ALMS

Este pacote permite a coleta de dados de proposições legislativas da
Assembleia Legislativa do Mato Grosso do Sul (ALMS) acessando a API do
SGPL.

## Instalação

Para instalar este pacote, você pode utilizar o seguinte comando em R:

``` r
# Instalar o pacote diretamente do GitHub (substitua 'usuario' e 'repositorio' pelo nome do seu usuário e repositório)
devtools::install_github("BaruqueRodrigues/getalmsdata")
```

## Utilização

Após instalar o pacote, você pode utilizar a função
`coleta_proposicoes_legislativa_ALMS` para coletar os dados. Aqui está
um exemplo de como utilizar a função

``` r
library(nome_do_pacote)

# Coleta as 100 primeiras proposições
proposicoes <- coleta_proposicoes_legislativa_ALMS(pagina = "1", n_proposicoes = "100")

# Visualizar os dados
print(proposicoes)
```
