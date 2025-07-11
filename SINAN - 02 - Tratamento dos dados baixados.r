pacman::p_load(read.dbc, tidyverse)
arq_sinan_dbc <- list.files('./dados_sinan/', full.names = T)

colunas_selecionadas <- c('ID_MUNICIP',
  'ID_MN_RESI',
  'DT_OCOR',
  'NU_IDADE_N',
  'CS_SEXO',
  'CS_RACA',
  'VIOL_SEXU',
  'VIOL_TRAF',
  'VIOL_FINAN',
  'VIOL_NEGLI',
  'VIOL_INFAN',
  'VIOL_LEGAL',
  'VIOL_OUTR',
  'VIOL_ESPEC',
  'REL_PAI',
  'REL_MAE',
  'REL_PAD',
  'REL_CONJ',
  'REL_EXCON',
  'REL_NAMO',
  'REL_EXNAM',
  'REL_FILHO',
  'REL_DESCO',
  'REL_IRMAO',
  'REL_CONHEC',
  'REL_CUIDA',
  'REL_PATRAO',
  'REL_INST',
  'REL_POL',
  'REL_PROPRI',
  'REL_OUTROS',
  'REL_ESPEC',
  'AUTOR_SEXO',
  'AUTOR_ALCO',
  'ORIENT_SEX',
  'IDENT_GEN',
  'VIOL_MOTIV',
  'CICL_VID')

sinan <- read.dbc(arq_sinan_dbc[1]) |> 
  select(colunas_selecionadas)

for(arq in arq_sinan_dbc[2:length(arq_sinan_dbc)]){
  print(arq)
  temp <- read.dbc(arq)
  sinan <- bind_rows(sinan, temp)
}

save(sinan, file = './rda/sinan')