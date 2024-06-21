#' Coleta dados de proposições legislativa da Assembleia Legislativa
#'  do Mato Grosso do Sul, acessando a API do SGPL.
#'
#' @param pagina argumento que controla a paginacao, o valor padrao é 1
#' @param n_proposicoes argumento que contorla o numero de
#' proposicoes por requisicao o padrao e 100
#'
#' @return um tibble com as proposicoes legislativas
#' @export
#'
#' @examples
#' # Coleta as 100 primeiras proposicoes
#' # coleta_proposicoes_legislativa_ALMS(pagina = "1",
#' # n_proposicoes = "100")
coleta_proposicoes_legislativa_ALMS <- function(
    pagina = "1",
    n_proposicoes = "100"
){# Faz a Requisição
  resposta <-
    httr2::request("http://sgpl.consulta.al.ms.gov.br/sgpl/sgpl-api/public/proposicao") |>
    httr2::req_url_query(
      direction = "desc",
      page = pagina,
      size = n_proposicoes,
      sort = "dataLeitura",
    ) |>
    httr2::req_headers(
      Accept = "application/json, text/plain, */*",
      `Accept-Language` = "pt-BR,pt;q=0.9,en-US;q=0.8,en;q=0.7",
      `Cache-Control` = "no-cache, no-store, must-revalidate",
      Cookie = "_ga_VL9HN6W5VF=GS1.1.1718996890.1.0.1718996890.0.0.0; _ga=GA1.4.1899926392.1718996890; _gid=GA1.4.1095212462.1718996891; _gat_gtag_UA_9890771_1=1",
      `If-Modified-Since` = "Mon, 26 Jul 1997 05:00:00 GMT",
      `User-Agent` = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 OPR/111.0.0.0",
      `X-Requested-With` = "XMLHttpRequest",
    ) |>
    httr2::req_perform()

  # Estrutura os Dados
  resposta %>%
    httr2::resp_body_json() %>%
    dplyr::tibble(data= .) %>%
    dplyr::slice(1) %>%
    tidyr::unnest_longer(data) %>%
    tidyr::unnest_wider(data)
}

