## Teste
ewrw

- [teste link](www.google.com.br)


## Migração da vm Replica MV N local para cloud

A vm Replica MV N é uma vm de datawarehouse que replica os bancos de dados do nosso sistema ERP(MV Gestão Hospitalar) e sistema HCM(Sênior), para alta disponibilidade de dados para desenvolvimento de dashboards e kpi's que auxiliam tanto nos setores assistenciais com painéis em power bi em direct query como paineis para solicitação de internação, imagens, exames e farmácia e paineis de andares, compras e almoxarifado, quanto em setores administrativos para tomada de decisão baseada em inidicadores paíneis de DRE, Fluxo de Caixa, Faturamento, Custos, Absenteísmo, Curva ABC, Taxa de ocupação de leitos, Total de atendimento  entre outros. 

Visto que a imagem da vm foi replicada pela BrDrive, e não houve nessecidade de backup e restore do BD, pois as informações se manteram as mesmas.

A demanda de migração surgiu devido a instabilidades na vm local que estam causando lentidão em consultas no banco postgresql, visto também que a vm local estava parando devido a falhas no hardware.

