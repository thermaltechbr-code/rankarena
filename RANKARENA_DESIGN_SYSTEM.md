# RankArena - Design System Oficial

Este documento registra a nova estrutura visual oficial do RankArena.

A partir desta fase do projeto, cada tela/modelo/código enviado será analisado e incorporado aqui como referência para manter consistência visual em todo o app.

## Objetivo visual

Criar uma interface mais profissional, moderna, intuitiva e preparada para distribuição, mantendo coerência entre telas de jogador, organizador, torneios, rankings, partidas, resultados, inscrições e comunidades.

## Como este documento será atualizado

Para cada nova referência enviada, registrar:

- Cores e tokens visuais;
- Tipografia e hierarquia textual;
- Espaçamentos e proporções;
- Cards e containers;
- Botões e estados;
- Badges/status;
- Sombras, bordas e efeitos;
- Layout responsivo;
- Componentes reutilizáveis;
- Observações específicas da tela.

## Diretriz principal

A nova identidade visual deve ser aplicada sem quebrar as funcionalidades já existentes do RankArena.


---

## Referência 001 - Cadastro Base

Arquivo visual de referência:
`D:/PARQUE DA CIDADE/PROJETO RANKARENA/PASTA DE IMGs DEFINITIVA/Tela1_Cadastro Basico.png`

Código de referência analisado:
`C:/Users/diCristo/.codex/attachments/6ba88bf4-267d-4e0f-afd0-5f60a83cc78e/pasted-text.txt`

### Tipo de tela

Tela de cadastro base para criação de conta do RankArena.

Esta tela define o primeiro padrão oficial da nova identidade visual do app, especialmente para fluxos de autenticação, onboarding e formulários centrais.

### Conceito visual

- Interface escura, centralizada e premium.
- Aparência esportiva/competitiva, com fundo abstrato de arena/high-tech.
- Layout objetivo, sem excesso de texto.
- Foco total no formulário e na marca.
- Composição em card central vertical, com textura escura nas laterais/fundo.

### Paleta de cores extraída

#### Cores principais

- Fundo principal: `#0A0A0A`
- Background/base: `#131313`
- Surface/card: `#1A1A1A`
- Surface container: `#201F1F`
- Surface container high: `#2A2A2A`
- Surface variant: `#353534`
- Borda discreta: `#252525`
- Outline/linha secundária: `#5A4136`

#### Laranja RankArena

- Primary container / CTA principal: `#FF6B00`
- Hover CTA: `#E66000`
- Primary suave: `#FFB693`
- Primary fixed: `#FFDBCC`
- Texto/ícones laranja em destaque: `#FF6B00`

#### Texto

- Texto principal: `#E5E2E1`
- Texto secundário/mutado: `#E2BFB0`
- Texto branco em botão: `#FFFFFF`

#### Erro

- Erro: `#FFB4AB`
- Error container: `#93000A`
- Texto sobre erro: `#690005`

### Tipografia

#### Fontes oficiais desta referência

- Títulos: `Montserrat`
- Corpo, labels e campos: `Inter`
- Ícones: `Material Symbols Outlined`

#### Hierarquia textual

- Logo/título da marca no card:
  - Fonte: Montserrat
  - Tamanho: `32px`
  - Peso: `700`
  - Line-height: `1.2`

- Subtítulo do card:
  - Fonte: Inter
  - Tamanho: `16px`
  - Peso: `400`
  - Line-height: `1.5`
  - Cor: texto secundário `#E2BFB0`

- Labels de formulário:
  - Fonte: Inter
  - Tamanho: `14px`
  - Peso: `600`
  - Line-height: `1`
  - Letter-spacing: `0.05em`

- Campos/input:
  - Fonte: Inter
  - Tamanho: `16px`
  - Peso: `400`
  - Line-height: `1.5`

- Mensagem de erro:
  - Fonte: Inter
  - Tamanho: `12px`
  - Peso: `500`
  - Line-height: `1`

### Espaçamentos e proporções

Tokens observados:

- Base: `4px`
- XS: `8px`
- SM: `16px`
- MD: `24px`
- LG: `40px`
- XL: `64px`
- Margem mobile: `16px`
- Margem desktop/card padding: `32px`

### Layout

- Tela ocupa `min-height: 100vh`.
- Conteúdo centralizado horizontal e verticalmente.
- Card principal com largura máxima aproximada de `480px`.
- Card central com padding desktop de `32px`.
- Em mobile, container externo usa padding de `16px`.
- Fundo tem textura com opacidade em torno de `30%`.
- Card tem uma linha superior sutil com branco em `10%` de opacidade para profundidade.

### Cards e containers

#### Card central

- Background: `#1A1A1A`
- Borda: `1px solid #252525`
- Radius: `0.5rem` / `8px`
- Sombra: `shadow-2xl`
- Top highlight: linha de `1px`, branca com `opacity: 0.10`

### Inputs

#### Estado padrão

- Background: `#0A0A0A`
- Border: `1px solid #252525`
- Radius: `0.125rem` / `2px`
- Padding horizontal: `16px`
- Padding vertical: `12px`
- Ícone à esquerda: `20px`
- Texto: `#E5E2E1`
- Placeholder: texto secundário com opacidade reduzida

#### Estado foco

- Border muda para `#FF6B00`
- Sem ring chamativo; foco limpo e elegante.

#### Estado erro

- Label em cor de erro `#FFB4AB`
- Borda do input em `#FFB4AB`
- Ícone esquerdo e ícone de erro em `#FFB4AB`
- Mensagem abaixo do campo em `12px`
- Texto exemplo: `As senhas não coincidem`

### Checkbox / termos

- Checkbox de `16px x 16px`.
- Background escuro `#0A0A0A`.
- Borda `#252525`.
- Estado marcado usa laranja `#FF6B00`.
- Links dos termos usam laranja `#FF6B00`.

### Botão principal

- Texto: `Criar conta`
- Background: `#FF6B00`
- Hover: `#E66000`
- Texto: branco
- Fonte: Inter
- Tamanho: `14px`
- Peso: `600`
- Letter-spacing: `0.05em`
- Altura/padding vertical: `14px`
- Largura: `100%`
- Radius: `0.125rem` / `2px`
- Ícone à direita: `arrow_forward`, `20px`

### Link secundário

- Texto: `Já tem uma conta? Entrar`
- Texto normal em cor secundária.
- Link `Entrar` em laranja, com peso de label/bold.

### Ícones

- Biblioteca usada: Material Symbols Outlined.
- Ícone da marca no topo: `emoji_events`, `32px`, laranja.
- Ícones dos inputs: `person`, `mail`, `phone`, `lock`, `20px`.
- Ícone de erro: `error`, `20px`.
- Ícone do botão: `arrow_forward`, `20px`.

### Diretrizes para aplicar no RankArena

- Usar esta tela como padrão base para autenticação e cadastro.
- Evitar cards muito arredondados nesse fluxo: visual é mais premium/preciso, com radius pequeno.
- Formulários devem usar fundo `#0A0A0A`, borda discreta e foco laranja.
- Mensagens de erro devem ser claras, compactas e próximas ao campo.
- Manter o botão principal full-width em telas de autenticação.
- Preservar a hierarquia: marca > frase curta > formulário > ação principal > link secundário.
- A experiência deve ser visualmente forte, mas com baixa carga textual.

### Componentes derivados desta referência

- `AuthShell`
- `AuthCard`
- `AuthHeader`
- `AuthInput`
- `AuthPasswordInput`
- `AuthErrorMessage`
- `AuthCheckboxTerms`
- `AuthPrimaryButton`
- `AuthFooterLink`

### Observações de implementação

- A referência usa Google Fonts, mas no app local devemos manter fallback/local ou fonte carregada de forma segura para evitar travamento do servidor local.
- Podemos manter os nomes de famílias `Montserrat` e `Inter` nos tokens, com fallback para fontes locais/sistema se necessário.
- A imagem de fundo deve ser tratada como asset controlado do projeto quando possível, não dependente de URL externa para produção.


### Aplicação no app

Status: implementada como substituta da tela atual de cadastro inicial.

Arquivo alterado:
`D:/PARQUE DA CIDADE/PROJETO RANKARENA/rankarena(8)/app/cadastro/page.tsx`

Ajustes aplicados:

- Layout de autenticação centralizado em card escuro.
- Novo campo obrigatório de WhatsApp no cadastro base.
- Campos com ícones à esquerda.
- Estado de erro visual para confirmação de senha.
- Botão principal `Criar conta` com ícone de seta.
- Link inferior `Já tem uma conta? Entrar`.
- Preservada a lógica funcional de criação de conta no Supabase.
- WhatsApp salvo em `profiles.phone` e nos metadados do usuário.

Validação:

- TypeScript aprovado com `npm.cmd exec tsc -- --noEmit`.


### Atualização da Referência 001 - Logo oficial no cadastro

A tela de cadastro base deve usar a logomarca oficial horizontal do RankArena no cabeçalho do card, substituindo o conjunto anterior de ícone de troféu + texto. O asset oficial aplicado no app é `public/rankarena-logo-white.png`. A logo deve permanecer centralizada, proporcional e sem deformação, com largura visual aproximada de 260px no desktop para equilibrar com o subtítulo e o formulário.

## Diretriz estrutural - preservação de rotas e fluxo

Sempre que uma tela estiver recebendo apenas uma troca de layout, o RankArena deve manter o nome da página, a rota existente e o fluxo atual de navegação. A mudança visual não deve criar novas rotas desnecessárias nem alterar contratos com banco de dados, autenticação ou APIs. Novas rotas só devem ser criadas quando houver uma nova funcionalidade real.

### Referência 002 - Completar Perfil do Jogador

Tela aplicada sobre a rota existente `/jogador/perfil`, preservando o fluxo atual de onboarding/edição do jogador.

Conceito visual:
- Layout escuro, competitivo e mais denso, com painel principal centralizado.
- Borda externa com destaque roxo/azulado discreto e interiores em superfícies escuras.
- Hierarquia de cadastro em blocos: perfil/foto, dados pessoais, contato, esportes e nível.
- Tela deve funcionar tanto como complemento inicial do perfil quanto como edição posterior dos dados.

Campos obrigatórios mantidos para o jogador:
- Nome completo.
- Nome público/de preferência.
- Data de nascimento.
- Sexo: Masculino/Feminino.
- Estado.
- Cidade.
- WhatsApp.
- Esportes de interesse.
- Esporte principal.

Campos complementares:
- Bairro.
- Foto/avatar.
- Nível/classe visual do esporte principal: Iniciante, Classe C, Classe B, Classe A.

Componentes derivados:
- PlayerProfileShell.
- PlayerProfilePhotoCard.
- PlayerPersonalDataCard.
- PlayerContactCard.
- PlayerSportsInterestCard.
- PlayerSkillLevelCard.
- PlayerProfileProgressIndicator.

Observação funcional:
- A tela usa a rota existente `/jogador/perfil` para evitar quebra de fluxo.
- Dados continuam sendo salvos em `profiles`, `players` e `player_sports`.
- O nível/classe é salvo no vínculo do esporte principal quando disponível.

## Referência 002 — Perfil do Jogador / Completar Perfil refinado

Tela aplicada na rota existente `/jogador/perfil`, preservando o fluxo e os contratos atuais com o banco de dados.

Ajustes oficiais definidos nesta etapa:

- A tela deve ocupar melhor o espaço disponível em desktop, sem moldura externa colorida delimitando artificialmente a área de conteúdo.
- O indicador de passos foi removido enquanto o fluxo permanecer em tela única; só deve voltar se houver um onboarding realmente dividido em etapas.
- O texto "Perfil 100% completo" foi removido porque não representava uma métrica real.
- O botão "Pular por enquanto" foi removido para não incentivar cadastro incompleto.
- O botão principal passa a seguir o padrão Apex/RankArena: fundo laranja, alto contraste, texto forte, ação clara e objetiva. Texto oficial: "Salvar Perfil".
- Ícones de esportes devem ser visuais lineares/profissionais, evitando emojis ou símbolos com aparência infantil/amadora.
- Manter tipografia com hierarquia próxima ao modelo: títulos em estilo display forte, labels compactas e textos de apoio menores, sem inflar os elementos.
- Preservar o nome da página, rota e lógica de gravação sempre que a alteração for apenas visual.

### Atualização — Ícones de esportes do Perfil do Jogador

Na tela `/jogador/perfil`, os ícones de modalidades devem seguir a mesma família visual da referência do Google Stitch: `Material Symbols Outlined`.

Mapeamento oficial inicial:

- Tênis: `sports_tennis`
- Futebol: `sports_soccer`
- Vôlei: `sports_volleyball`
- Beach Tennis: `sports_baseball` como placeholder visual da referência
- Corrida: `directions_run`
- Ícone do bloco de esportes: `sports_score`

Evitar emojis e SVGs manuais para modalidades nessa tela, salvo se forem substituídos posteriormente por uma família oficial própria do RankArena.

## Atualização — Perfil do Jogador alinhado à referência Tela1_Cadastro Perfil Jogador

A tela `/jogador/perfil` passa a usar a referência visual do arquivo `Tela1_Cadastro Perfil Jogador.png` como régua para proporção e hierarquia.

Decisões oficiais desta etapa:

- Conjunto inicial de esportes exibidos no perfil: Tênis, Futebol, Vôlei, Basquete e Beach Tênis.
- Ícones oficiais nessa tela devem usar `Material Symbols Outlined`, mantendo aparência linear/profissional:
  - Tênis: `sports_tennis`
  - Futebol: `sports_soccer`
  - Vôlei: `sports_volleyball`
  - Basquete: `sports_basketball`
  - Beach Tênis: `sports_baseball` como aproximação visual temporária da referência
- Ícone do bloco "Esportes de Interesse": `sports_score`, com tamanho visual aproximado de 32px e cor primária RankArena (`#FF6B00`).
- Ícone do bloco de habilidade: `moving`, mantendo a linguagem Material Symbols.
- Tipografia preserva a lógica Apex/RankArena:
  - títulos principais com Montserrat/display, peso alto, proporção forte e tracking levemente negativo;
  - títulos de seção com Montserrat em torno de 20–24px;
  - textos auxiliares com Inter/body em torno de 14–16px;
  - labels compactas com peso 600 e espaçamento discreto.
- Layout desktop oficial do perfil:
  - conteúdo máximo aproximado de 1280px;
  - coluna esquerda ocupando 4/12 da grade;
  - coluna direita ocupando 8/12 da grade;
  - espaçamento entre cabeçalho "Completar Perfil" e cards principais ampliado para criar respiro, como na referência;
  - evitar molduras externas desnecessárias que reduzam a área útil da tela.

Observação: se Basquete não aparecer no app, isso indica que a modalidade ainda precisa existir/estar ativa na tabela `sports` do Supabase; o layout já está preparado para exibi-la.

### Ajuste — Esportes oficiais e limpeza do layout do jogador

Na tela `/jogador/perfil`, o conjunto oficial de esportes exibidos no RankArena passa a ser estritamente:

- Tênis
- Futebol
- Vôlei
- Basquete
- Beach Tênis

A exibição deve respeitar essa ordem quando as modalidades estiverem cadastradas/ativas no banco. Modalidades fora desse conjunto não devem aparecer no perfil do jogador nesta fase do produto.

Para a Área do Jogador, o cabeçalho e a lateral devem evitar bordas visuais fortes/desnecessárias. O objetivo é aproximar o layout do visual mais limpo da nova referência, mantendo foco nos cards e no conteúdo principal.

## Tela de Perfil do Jogador - regra visual atualizada

- A rota deve permanecer /jogador/perfil para não quebrar fluxo, autenticação, onboarding ou integração com Supabase.
- A Área do Jogador deve priorizar uso amplo do espaço disponível, sem container estreito artificial e sem grandes vazios laterais/superiores.
- Remover bordas visuais antigas do cabeçalho e lateral quando estiver no contexto do jogador, mantendo a tela limpa e imersiva.
- Esportes oficiais no RankArena: Tênis, Futebol, Vôlei, Basquete e Beach Tênis.
- Ícones dos esportes devem seguir estética séria/profissional, alinhada à referência Material Symbols/Stitch, evitando aparência infantil ou amadora.
- Não adicionar esportes como Pickleball, Padel ou Sinuca nesta fase.

## Tela: Completar Perfil do Organizador

Referência visual: `Tela1_Cadastro Perfil Organizador.png`.

Diretrizes incorporadas ao sistema visual:

- Base escura com painel principal preto/cinza profundo.
- Títulos em fonte display, peso alto, branco, hierarquia clara.
- Subtítulos em tom pêssego/laranja claro, com leitura curta e objetiva.
- Cabeçalhos de cards em cinza escuro sólido (`#282828`) e conteúdo em painel `#1A1A1A`.
- Campos de formulário claros dentro de blocos escuros, como no modelo Stitch/Apex.
- Ação primária sempre em laranja RankArena (`#FF6B00`), com texto forte e seta de avanço.
- Cards laterais para informações auxiliares: logo, esportes organizados e configuração de acesso.
- Não criar nova rota para troca de layout quando já existir fluxo funcional; preservar `/onboarding/organizador`.
