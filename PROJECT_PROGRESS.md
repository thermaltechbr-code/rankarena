# RankArena — ponto de retomada

Atualizado em 10/07/2026.

## Estado geral

O RankArena está com o fluxo principal do MVP funcional e validado em um torneio real de teste:

organizador cria torneio → jogadores se inscrevem → organizador aprova → torneio inicia → chave Mata-mata é gerada → jogadores registram resultado → adversário/organizador confirma → tabela e ranking atualizam → torneio é encerrado.

## Concluído

- Autenticação via Supabase.
- Separação de áreas por perfil: jogador e organizador.
- Perfil completo do jogador com dados pessoais, contato, localização e esportes.
- Onboarding do organizador com campos obrigatórios.
- Cadastro e gestão de torneios pelo organizador.
- Categorias de torneio:
  - Grand Slam da Comunidade;
  - Masters;
  - Open;
  - Challenge.
- Pontuação por colocação do torneio.
- Inscrição e aprovação de jogadores.
- Mata-mata simples com geração automática da primeira rodada.
- Tela de chave/tabela atualizada com:
  - jogadores ativos;
  - eliminados;
  - finalistas;
  - campeão;
  - status das partidas.
- Resultado de partida com fluxo seguro:
  - jogador envia resultado;
  - botão de envio desaparece após envio;
  - adversário confirma ou contesta;
  - organizador pode validar resultado;
  - ranking e campeão só atualizam após confirmação.
- Ranking pessoal do jogador.
- Ranking geral por torneio com todos os participantes.
- Encerramento seguro do torneio:
  - bloqueia encerramento se houver partida pendente;
  - bloqueia encerramento se nenhuma partida tiver sido finalizada;
  - pede confirmação antes de encerrar.
- Menu do organizador simplificado:
  - removidas opções globais sem página/sem sentido para o MVP (`Inscrições`, `Partidas`, `Jogadores`, `Relatórios`);
  - jogadores/participantes permanecem contextualizados dentro de cada torneio.
- Menu do jogador simplificado:
  - removidas opções globais de `Desafios` e `Conquistas`;
  - `Partidas` permanece como agenda/histórico geral;
  - informações específicas de torneio passam a ficar dentro da página do torneio.
- Página do torneio do jogador ganhou atalhos contextuais:
  - chave/tabela;
  - tabela atualizada;
  - minhas partidas filtradas pelo torneio;
  - ranking do torneio.
- Página de torneios do jogador remodelada como vitrine de descoberta:
  - prioriza esportes escolhidos pelo jogador;
  - destaca o esporte favorito;
  - separa torneios por `Abertos`, `Em curso` e `Finalizados`;
  - permite busca por nome, esporte, comunidade ou clube;
  - mostra cards visuais por esporte, local, inscritos e ação de inscrição/visualização.
- Entrada principal do jogador definida como `Torneios Abertos`:
  - login de jogador completo redireciona para `/jogador/torneios`;
  - acesso a `/jogador` redireciona para `/jogador/torneios`;
  - menu lateral do jogador destaca `Torneios Abertos` como primeira opção;
  - finalização/edição do perfil do jogador retorna para `/jogador/torneios`.
- Vitrine do jogador refinada visualmente como `Arenas`:
  - menu lateral exibe `Arenas`;
  - página sempre inicia com foco em `Todos os esportes`;
  - topo mantém apenas o título `Arenas` e o slogan `Seu próximo desafio pode estar aqui`;
  - removido o banner geral de `Todos os esportes`;
  - abaixo das abas, cada esporte escolhido pelo jogador ganha uma imagem/faixa horizontal própria;
  - abaixo de cada faixa aparecem os cards dos torneios daquele esporte;
  - descrição principal definida como `Seu próximo desafio pode estar aqui`;
  - quando não há torneios para o filtro/esporte, a tela mostra uma mensagem contextual sem parecer erro.
  - opção `Arenas` no menu lateral usa ícone de arena/monumento.
- Limpeza visual da vitrine `Arenas`:
  - removida contagem textual geral redundante abaixo das abas;
  - faixas de esporte ficaram menos textuais;
  - destaques voltaram para o laranja do RankArena;
  - fundos de esporte seguem como arte temporária/atmosférica até inclusão de imagens reais por modalidade.
  - cards de torneio ficaram mais compactos, sem repetir nome do esporte/status dentro da aba;
  - cabeçalho do card destaca nome do torneio e comunidade/clube como subtítulo;
  - texto genérico `Torneio disponível...` removido.
- Ícone personalizado de arena adicionado:
  - imagem salva em `public/icons/arena.png`;
  - versão em máscara transparente salva em `public/icons/arena-mask.png`;
  - opção `Arenas` usa apenas a silhueta do ícone, herdando cor/tamanho como os demais ícones do menu lateral e mobile.
- Ícone de `Arenas` corrigido para SVG interno:
  - substitui a imagem/máscara por um desenho vetorial de arena;
  - herda `currentColor`, tamanho e comportamento visual exatamente como os demais ícones.
- Logomarca do cabeçalho lateral atualizada:
  - troféu no canto superior esquerdo substituído pela parte gráfica da marca RankArena;
  - marca transparente salva em `public/brand/rankarena-mark.png`.
- Tela de detalhe do torneio do jogador separada por estágio:
  - antes da inscrição confirmada, jogador vê uma vitrine do torneio com nome, esporte, descrição, vagas/inscritos, período, valor, categoria/pontos, formato, organização e regulamento padrão temporário;
  - participantes, chave, tabela, partidas, ranking e desafios ficam ocultos até a inscrição ser confirmada;
  - depois da inscrição confirmada, jogador acessa a área interna do torneio como antes.
- Regulamento real do torneio implementado no app:
  - migração `020_tournament_regulation.sql` adiciona `tournaments.regulation`;
  - criação de torneio do organizador permite preencher regulamento;
  - edição de torneio do organizador permite alterar regulamento enquanto o torneio está em rascunho/aberto;
  - vitrine do torneio para jogador exibe regulamento preenchido ou padrão temporário quando vazio.
  - migração aplicada e coluna `regulation` confirmada no Supabase em 11/07/2026.
  - `.env.supabase.local` corrigido para manter `SUPABASE_PROJECT_REF` apenas como `sokjbksmespxftzhxvnx`.
- README e `.env.example` atualizados para beta.
- Arquivos de teste soltos removidos.

## Validações recentes

- `npm.cmd exec tsc -- --noEmit` aprovado.
- `npm.cmd exec tsc -- --noEmit` aprovado após a nova vitrine de torneios do jogador.
- `npm.cmd run build` aprovado em 10/07/2026.
- Fluxo da Copa Tennis Parque validado até torneio finalizado.
- Página do organizador mostra torneio como `FINALIZADO`.
- Página de resultados do organizador não mostra pendências após confirmações.
- Ranking geral exibiu participantes, pontuação, colocação e destaque do jogador logado.

## Atenções antes de disponibilizar

- O build de produção está aprovado. Foi necessário remover dependência de download de fontes Google durante o build e normalizar `readlink` no script local por causa de comportamento do filesystem Windows/sandbox.
- A pasta `.git` está presente, mas o repositório parece inválido/vazio. Ainda não há commit confiável de segurança.
- As migrações devem estar aplicadas no Supabase até a `019_progressive_tournament_ranking.sql`.
- `SUPABASE_SERVICE_ROLE_KEY` deve ficar apenas em segredo de servidor no ambiente de produção.

## Próximo passo recomendado

Preparar publicação beta:

1. Parar o servidor local.
2. Rodar `npm run build`.
3. Corrigir qualquer erro real de produção, se aparecer.
4. Conferir variáveis de ambiente no provedor de hospedagem.
5. Configurar URLs de autenticação no Supabase para o domínio final.
6. Criar um backup/commit do projeto antes da publicação.

Depois da publicação beta, o próximo bloco de produto recomendado é:

1. notificações básicas;
2. suporte automático a “bye” no Mata-mata;
3. Winner/Lower;
4. Sistema de Grupos.

## Atualização de 11/07/2026 - Detalhes públicos completos do torneio

- Criada e aplicada a migração `021_tournament_public_details.sql`.
- Torneios agora têm campos para:
  - início e fim das inscrições;
  - local da disputa;
  - premiação;
  - contato do organizador;
  - instruções de pagamento;
  - exigência de confirmação manual da inscrição.
- Tela de criação do torneio do organizador atualizada com esses campos.
- Tela de edição/gestão do torneio do organizador atualizada com esses campos.
- Página pública do torneio para jogador atualizada para mostrar informações gerais, inscrição, pagamento, premiação, contato e regulamento antes da inscrição.
- Regra de inscrição ajustada:
  - torneio gratuito sem confirmação manual confirma inscrição automaticamente;
  - torneio pago ou com confirmação manual deixa inscrição como pendente até aprovação do organizador.
- Validação local aprovada com `npm.cmd exec tsc -- --noEmit`.

## Atualização de 11/07/2026 - Localização e regulamento do torneio

- Criada e aplicada a migração `022_tournament_location.sql`.
- Torneios agora têm cidade e estado próprios, independentes da cidade/estado da comunidade ou clube.
- Cadastro de novo torneio do organizador ganhou campos obrigatórios de Cidade e Estado.
- Edição do torneio do organizador carrega e salva Cidade e Estado.
- Listagem e página pública do torneio para jogador passam a priorizar cidade/estado do torneio.
- Regulamento na página pública do torneio ganhou botão `Ver regulamento`, abrindo visualização somente leitura.
- Próximo refinamento recomendado: adicionar upload real de PDF do regulamento pelo organizador e abrir esse PDF no mesmo botão.
- Validação local aprovada com `npm.cmd exec tsc -- --noEmit`.
- Tela de edição do torneio do organizador agora volta automaticamente para o topo após salvar ou ao exibir erro, facilitando ver a mensagem de retorno.

## Atualização de 11/07/2026 - PDF do regulamento

- Criada e aplicada a migração `023_tournament_regulation_pdf.sql`.
- Torneios agora têm campos para armazenar URL e caminho do PDF do regulamento.
- Criado bucket público `tournament-regulations` no Supabase para PDFs de regulamento.
- Tela de criação de torneio permite anexar PDF do regulamento, com limite de 10MB.
- Tela de edição/gestão do torneio permite anexar/substituir PDF do regulamento e salvar no torneio.
- Página pública do torneio para jogador abre o PDF em uma janela somente leitura quando houver arquivo anexado.
- Quando não houver PDF, o botão `Ver regulamento` continua abrindo o regulamento em texto/padrão.
- Campo de upload de PDF ajustado para mostrar o nome do arquivo anexado em vez do texto nativo `Nenhum arquivo escolhido`.
- Opção `Remover PDF` adicionada na criação e edição do torneio para limpar o PDF anexado e permitir substituir por outro.
- Retorno ao topo após salvar torneio corrigido para usar âncora dentro do conteúdo, pois o painel rola em um contêiner interno e não na janela do navegador.
- Validação local aprovada com `npm.cmd exec tsc -- --noEmit`.
## Atualiza��o de 12/07/2026 - Patroc�nios do torneio

- Criada e aplicada a migra��o `024_tournament_sponsors.sql`.
- Torneios agora t�m campo para lista de patrocinadores com nome e logo.
- Criado bucket p�blico `tournament-sponsors` no Supabase para logos dos patrocinadores.
- Tela de cria��o de torneio permite anexar, nomear e remover logos de patrocinadores.
- Tela de edi��o/gest�o do torneio permite adicionar, renomear e remover patrocinadores.
- P�gina p�blica do torneio para jogador ganhou card de `Patroc�nios`.
- Bot�o de regulamento foi movido para dentro do card de contato/informa��es gerais do torneio.
- Valida��o local aprovada com `npm.cmd exec tsc -- --noEmit`.
## Atualiza��o de 12/07/2026 - Revis�o t�cnica e ponto de retomada

- P�gina p�blica do torneio refinada visualmente:
  - `Regulamento` agora � um card pr�prio dentro das informa��es gerais;
  - bot�o do regulamento reduzido para `Ler`;
  - selo redundante `Aberto` removido da p�gina do torneio;
  - a��o de inscri��o movida para a linha do nome do torneio;
  - bot�o de inscri��o passou a usar visual compacto tipo selo com texto `Fazer inscri��o`.
- Logo completa do RankArena aplicada no topo esquerdo do layout lateral:
  - asset salvo em `public/brand/rankarena-logo-white.png`.
- Corre��o t�cnica no upload de PDF/regulamento e logos de patrocinadores:
  - gera��o do caminho de upload movida para fun��o auxiliar fora da renderiza��o;
  - erro de lint `react-hooks/purity` resolvido.
- Valida��es realizadas:
  - `npm.cmd exec tsc -- --noEmit` aprovado;
  - `npm.cmd run lint` aprovado sem erros, restando apenas avisos sobre uso de `<img>` em vez de `next/image`.
- Build de produ��o:
  - primeira tentativa falhou com `EPERM` ao acessar `.next/trace`, prov�vel lock do servidor local/ambiente;
  - segunda tentativa ficou presa at� o limite de tempo sem erro de c�digo vis�vel;
  - pr�ximo passo recomendado: parar o servidor local, limpar/renovar `.next` se necess�rio e rodar `npm.cmd run build` novamente antes de publica��o.

## Pr�ximo passo recomendado

1. Reabrir o app e conferir visualmente a p�gina p�blica do torneio.
2. Testar, como organizador, upload/remover PDF do regulamento e logos de patrocinadores.
3. Testar, como jogador, abertura do bot�o `Ler` e visualiza��o dos patrocinadores.
4. Com o servidor local parado, rodar novo build de produ��o.
5. Depois disso, seguir para o pr�ximo bloco funcional do MVP: confirma��o de pagamento/inscri��o pelo organizador ou notifica��es b�sicas.
## Atualiza��o de 12/07/2026 - Build de produ��o resolvido

- O problema do build foi resolvido hoje, antes da pausa.
- Causa prov�vel: servidor local/Next.js segurando arquivos internos da pasta `.next`, especialmente `.next/trace`.
- A��o tomada:
  - processos locais do servidor RankArena foram identificados;
  - servidor local e processos Next filhos foram parados;
  - `npm.cmd run build` foi executado novamente.
- Resultado:
  - build de produ��o aprovado com sucesso;
  - 33 p�ginas geradas/validadas;
  - rotas din�micas e APIs reconhecidas corretamente pelo Next.js.
- Estado t�cnico final do dia:
  - `npm.cmd exec tsc -- --noEmit` aprovado;
  - `npm.cmd run lint` aprovado sem erros, apenas avisos de otimiza��o de imagem;
  - `npm.cmd run build` aprovado.

## Retomada recomendada

Para voltar ao app local amanh�, rodar:

```powershell
cd "D:\PARQUE DA CIDADE\PROJETO RANKARENA\rankarena(8)"
npm.cmd run dev
```

Depois abrir `http://localhost:3000` e continuar os ajustes funcionais.
## Atualiza��o de 12/07/2026 - Notifica��es b�sicas dentro do app

- Sistema inicial de notifica��es internas ativado usando a tabela `notifications` j� existente.
- Criada API `/api/notifications` para:
  - listar as �ltimas notifica��es do usu�rio logado;
  - marcar notifica��es n�o lidas como lidas.
- Sino do topo agora mostra notifica��es reais:
  - contador de n�o lidas;
  - dropdown com os �ltimos avisos;
  - ao abrir, marca notifica��es como lidas.
- Eventos conectados �s notifica��es:
  - jogador envia inscri��o para torneio;
  - organizador recebe aviso de nova inscri��o pendente;
  - organizador aprova ou recusa inscri��o;
  - jogador envia resultado de partida;
  - advers�rio recebe aviso para confirmar/contestar;
  - resultado contestado avisa quem enviou;
  - resultado confirmado avisa os dois jogadores;
  - resultado confirmado pelo organizador avisa os dois jogadores.
- Valida��es:
  - `npm.cmd exec tsc -- --noEmit` aprovado;
  - `npm.cmd run lint` aprovado sem erros, restando apenas avisos antigos de otimiza��o de imagem.

## Pr�ximo passo sugerido

Testar visualmente o sino de notifica��es com um fluxo real simples:

1. jogador se inscreve em um torneio pago/pendente;
2. organizador abre o sino e v� a inscri��o pendente;
3. organizador aprova;
4. jogador abre o sino e v� a confirma��o.

Depois disso, seguir para notifica��es de partida/resultado ou melhorar o painel de pend�ncias do organizador.
## Atualiza��o de 12/07/2026 - Painel de pend�ncias do organizador

- Dashboard do organizador ganhou uma �rea de `Pend�ncias do Organizador`.
- O painel mostra contadores para:
  - inscri��es aguardando aprova��o;
  - resultados aguardando valida��o;
  - resultados contestados.
- Foram adicionados atalhos diretos para:
  - p�gina de torneios, quando a pend�ncia for inscri��o;
  - p�gina de resultados, quando a pend�ncia for resultado pendente ou contestado.
- O painel tamb�m lista pend�ncias recentes com descri��o contextual:
  - jogador aguardando aprova��o em determinado torneio;
  - partida aguardando valida��o;
  - partida contestada.
- Quando n�o h� pend�ncias, o painel mostra estado limpo/positivo.
- Valida��es:
  - `npm.cmd exec tsc -- --noEmit` aprovado;
  - `npm.cmd run lint` aprovado sem erros, restando apenas avisos antigos de otimiza��o de imagem.

## Pr�ximo teste recomendado

Entrar como organizador em `/organizador` e verificar:

1. se o card `Pend�ncias do Organizador` aparece no dashboard;
2. se inscri��es pendentes aparecem com atalho para o torneio;
3. se resultados pendentes/contestados aparecem com atalho para `Resultados`;
4. se o painel mostra estado limpo quando n�o houver pend�ncias.
## Atualiza��o de 12/07/2026 - Tela operacional do torneio do organizador

- Tela de gest�o de torneio do organizador recebeu bloco operacional no topo com:
  - inscri��es aguardando aprova��o;
  - participantes confirmados;
  - ocupa��o de vagas;
  - atalho para valida��o de resultados.
- �rea de inscri��es foi reorganizada como `Inscri��es e participantes`.
- Inscri��es pendentes agora aparecem primeiro e com destaque amarelo.
- Participantes confirmados aparecem com destaque verde.
- Bot�es ficaram mais expl�citos:
  - `Aprovar inscri��o`;
  - `Remover participante`.
- Textos com acentua��o quebrada nessa tela foram corrigidos.
- Valida��es:
  - `npm.cmd exec tsc -- --noEmit` aprovado;
  - `npm.cmd run lint` aprovado sem erros, restando apenas avisos antigos de otimiza��o de imagem.
## Atualiza��o de 12/07/2026 - Dashboard do organizador em quatro blocos

- Dashboard do organizador reorganizado em quatro blocos permanentes:
  - `Vis�o Geral`;
  - `A��es Pendentes`;
  - `Estat�sticas da Temporada`;
  - `Crescimento das Comunidades`.
- Card `Jogadores` corrigido para contar jogadores �nicos vinculados aos torneios do organizador, al�m de membros ativos da comunidade quando houver.
- Contadores de pend�ncias foram ajustados para usar contagem exata no Supabase, e n�o apenas os itens recentes exibidos na lista.
- `Crescimento das Comunidades` agora mostra:
  - comunidades;
  - jogadores vinculados;
  - solicita��es pendentes.
- Mantidos atalhos para gest�o de comunidades, torneios, temporadas e resultados.
- Valida��es:
  - `npm.cmd exec tsc -- --noEmit` aprovado;
  - `npm.cmd run lint` aprovado sem erros, restando apenas avisos antigos de otimiza��o de imagem.
## Atualiza��o de 12/07/2026 - Cards por comunidade no dashboard do organizador

- Bloco `Crescimento das Comunidades` deixou de ser apenas um resumo geral e passou a exibir cards por comunidade.
- Cada comunidade agora mostra:
  - jogadores vinculados;
  - crescimento no m�s;
  - partidas conclu�das;
  - torneios vinculados;
  - percentual de participa��o.
- Cada card de comunidade tem atalho `Ver` para a �rea daquela comunidade.
- O c�lculo considera membros ativos e jogadores inscritos nos torneios da comunidade.
- Participa��o � calculada com base nas inscri��es confirmadas em rela��o � capacidade dos torneios da comunidade.
- Valida��es:
  - `npm.cmd exec tsc -- --noEmit` aprovado;
  - `npm.cmd run lint` aprovado sem erros, restando apenas avisos antigos de otimiza��o de imagem.
## Atualização de 12/07/2026 - Histórico visual na guia Resultados

- Guia `Resultados` do organizador foi reorganizada para manter duas áreas:
  - `Ações pendentes`, com resultados aguardando decisão ou contestados;
  - `Histórico por torneio`, com cards de todos os torneios do organizador.
- Cada card de torneio agora mostra:
  - nome do torneio;
  - status do torneio;
  - quantidade de partidas finalizadas;
  - pódio visual com top 3 por vitórias/aproveitamento;
  - medalha/coroa animada sobre o primeiro colocado;
  - histórico das últimas partidas confirmadas, com vencedor, placar e data.
- Ao confirmar um resultado pendente, a página recarrega os dados da guia para atualizar o histórico e o pódio automaticamente.
- Validações:
  - `npm.cmd exec tsc -- --noEmit` aprovado;
  - `npm.cmd run lint` aprovado sem erros, restando apenas avisos antigos de otimização de imagem.
## Atualização de 12/07/2026 - Resultados com cards resumidos e detalhe por torneio

- Página `Resultados` do organizador foi ajustada para exibir cards menores de torneio, em grade responsiva com 2 por linha em telas maiores.
- Cada card de torneio mostra apenas:
  - nome do torneio;
  - quantidade de partidas disputadas;
  - pódio visual/top 3;
  - botão `Ver`.
- Foi removido o texto `Pódio do torneio` dos cards resumidos.
- Criada página de detalhe em `/organizador/resultados/[id]` para cada torneio, com:
  - pódio atual;
  - total de partidas finalizadas;
  - histórico completo das partidas disputadas;
  - vencedor, placar, data e identificação da rodada/jogo quando disponível.
- Validações:
  - `npm.cmd exec tsc -- --noEmit` aprovado;
  - `npm.cmd run lint` aprovado sem erros, restando apenas avisos antigos de otimização de imagem.
## Atualização de 12/07/2026 - Histórico de resultados em formato de tabela

- Página de detalhe de resultados do torneio (`/organizador/resultados/[id]`) passou a exibir as partidas em formato visual de tabela/chave.
- A seção `Tabela de torneio` mostra as partidas agrupadas por rodada, com:
  - jogadores do confronto;
  - placar ou status da partida;
  - data da partida;
  - vencedor destacado em amarelo;
  - perdedor com cor neutra;
  - rolagem horizontal quando houver muitas rodadas.
- O pódio atual foi mantido acima da tabela.
- A lista de detalhes dos resultados foi mantida abaixo como registro complementar.
- Validações:
  - `npm.cmd exec tsc -- --noEmit` aprovado;
  - `npm.cmd run lint` aprovado sem erros, restando apenas avisos antigos de otimização de imagem.
## Atualização de 12/07/2026 - Tabela de resultados com identidade visual RankArena

- A tabela visual de resultados do torneio foi refeita para seguir melhor a identidade visual do RankArena.
- Paleta aplicada na chave:
  - laranja principal para vencedores e destaques;
  - azul/preto escuro para fundo e cards;
  - cinza claro/neutro para textos secundários e jogadores eliminados.
- Os blocos com nomes dos jogadores foram compactados para reduzir largura e permitir visualizar o caminho até o campeão.
- Foi adicionada uma coluna final `Campeão/Ganhador`, mostrando o vencedor da última rodada quando houver resultado definido.
- A tabela mantém rolagem horizontal quando necessário, mas agora usa colunas mais estreitas.
- Validações:
  - `npm.cmd exec tsc -- --noEmit` aprovado;
  - `npm.cmd run lint` aprovado sem erros, restando apenas avisos antigos de otimização de imagem.
## Atualização de 12/07/2026 - Remoção de detalhes redundantes nos resultados

- A seção `Detalhes dos resultados` foi removida da página de detalhe do torneio em `Resultados`.
- A tela agora fica mais limpa, usando a própria tabela visual de partidas disputadas como fonte principal das informações.
- Permanecem visíveis na tabela:
  - rodada;
  - confronto;
  - vencedor;
  - placar/status;
  - data;
  - campeão/ganhador.
- Validações:
  - `npm.cmd exec tsc -- --noEmit` aprovado;
  - `npm.cmd run lint` aprovado sem erros, restando apenas avisos antigos de otimização de imagem.
## Atualização de 12/07/2026 - Ajustes finais da tabela de resultados

- Card superior renomeado de `Pódio atual` para `Pódio do Torneio`.
- Texto `Tabela de torneio` alterado para `Tabela do Torneio`.
- Removidas descrições redundantes abaixo de:
  - nome do torneio;
  - `Pódio do Torneio`;
  - `Partidas disputadas`.
- Texto `Ganhador` substituído por `Campeão` na coluna final da tabela.
- A tabela recebeu cálculo dinâmico de largura por quantidade de rodadas:
  - tenta ocupar a tela inteira em torneios menores;
  - compacta colunas em torneios maiores;
  - mantém rolagem horizontal quando necessário para preservar todas as partidas.
- Validações:
  - `npm.cmd exec tsc -- --noEmit` aprovado;
  - `npm.cmd run lint` aprovado sem erros, restando apenas avisos antigos de otimização de imagem.
## Atualização de 12/07/2026 - Padronização inicial da identidade visual

- Feita varredura nos componentes e páginas principais para consolidar a identidade visual do RankArena.
- Componentes base ajustados:
  - `PageTitle` agora exibe nomes de página em maiúsculas, com fonte display, peso forte e espaçamento de letras;
  - `SectionHeader` recebeu `variant="page"` para diferenciar título principal de página dos tópicos internos;
  - `PrimaryButton` passou a usar `ra-primary` em vez de cor fixa;
  - `DashboardCard` e `StatCard` passaram a usar `ra-surface` e `ra-primary`;
  - sidebar, navegação mobile e header passaram a usar tokens da identidade visual.
- Aplicada regra de título de página em maiúsculas nas principais telas de jogador e organizador, incluindo:
  - Resultados;
  - Detalhe de resultados por torneio;
  - Torneios;
  - Perfil;
  - Partidas;
  - Desafios;
  - Arenas;
  - Comunidades;
  - Temporadas;
  - criação/edição de torneio e comunidade;
  - telas de chave/tabela/desafio do jogador.
- Tópicos internos foram mantidos em caixa normal e com peso visual menor para diferenciar do nome da página.
- Validações:
  - `npm.cmd exec tsc -- --noEmit` aprovado;
  - `npm.cmd run lint` aprovado sem erros, restando apenas avisos antigos de otimização de imagem.
## Atualização de 12/07/2026 - Central de controle do torneio do organizador

- Tela de gestão do torneio do organizador foi reforçada como centro operacional do MVP.
- A página agora também carrega o resumo de partidas do torneio para orientar decisões.
- Adicionada seção `Central de controle do torneio` com checklist visual para:
  - inscrições confirmadas;
  - aprovações pendentes;
  - partidas criadas/finalizadas;
  - resultados pendentes de validação;
  - condição para encerramento.
- Botão `Iniciar torneio` agora fica desabilitado visualmente quando não há pelo menos 2 jogadores confirmados.
- Botão `Encerrar torneio` agora fica desabilitado visualmente enquanto houver partidas em aberto ou nenhum resultado finalizado.
- Foram adicionados atalhos rápidos para:
  - tabela de resultados do torneio;
  - painel geral de validação de resultados.
- A tela também alerta quando o limite de vagas foi atingido.
- Validações:
  - `npm.cmd exec tsc -- --noEmit` aprovado;
  - `npm.cmd run lint` aprovado sem erros, restando apenas avisos antigos de otimização de imagem.
## Atualização de 12/07/2026 - Tela do torneio do jogador alinhada ao fluxo do MVP

- A tela de detalhe do torneio para jogador foi revisada para ficar coerente com o controle do organizador.
- A interface agora considera vagas disponíveis antes de liberar o botão de inscrição.
- Para jogadores já inscritos, a página passou a manter visíveis:
  - status do torneio;
  - status do jogador no torneio;
  - dados gerais do torneio;
  - período do torneio e das inscrições;
  - valor de inscrição;
  - pontuação/ranking;
  - formato da chave;
  - local, premiação, contato e regulamento;
  - patrocínios.
- O regulamento agora também pode ser aberto pelo jogador já inscrito, tanto em PDF quanto em texto padrão.
- O fluxo de ações foi mantido mais seguro:
  - torneio Mata-mata automático orienta o jogador a consultar a chave;
  - o botão `Desafiar` continua bloqueado para chave automática;
  - jogadores eliminados recebem mensagem clara de que não estão mais em disputa.
- Validações:
  - `npm.cmd exec tsc -- --noEmit` aprovado;
  - `npm.cmd run lint` aprovado sem erros, restando apenas avisos antigos de otimização de imagem.
## Pausa de 12/07/2026 - Ponto de retomada

- Projeto pausado após alinhar a tela de detalhe do torneio para o jogador com o fluxo do organizador.
- Última validação técnica aprovada:
  - TypeScript sem erros;
  - lint sem erros, restando apenas avisos antigos de otimização de imagem.
- Próximo ponto recomendado ao retomar:
  - revisar o fluxo de torneio em andamento do lado do jogador;
  - conferir tela de partidas filtradas por torneio;
  - conferir chave/tabela atualizada após avanço de vencedores;
  - conferir ranking do torneio depois dos resultados confirmados;
  - garantir mensagens claras para jogador ativo, eliminado, pendente ou inscrito.
- Depois disso, seguir para os ajustes finais do organizador:
  - encerramento do torneio;
  - histórico de resultados;
  - consistência dos dashboards e indicadores.
## Atualização de 13/07/2026 - Retomada do fluxo do jogador em torneio ativo

- Retomada iniciada pelo fluxo de torneio em andamento do lado do jogador.
- Tela de partidas do jogador ajustada para:
  - exibir nome do torneio mesmo quando o filtro por torneio não retorna partidas;
  - mostrar mensagem mais clara quando ainda não há partida criada naquele torneio;
  - trocar a ação de partida agendada para `Informar resultado` e manter `Ver resultado` quando já houver resultado pendente.
- Tela de resultado da partida ajustada para:
  - voltar para a lista filtrada daquele torneio;
  - exibir atalhos para `Torneio`, `Tabela` e `Ranking` após abrir a partida;
  - manter o fluxo de confirmação/contestação sem somar pontos antes da confirmação.
- Tela de chave do torneio ajustada com atalhos diretos para:
  - tabela atualizada;
  - minhas partidas;
  - ranking do torneio.
- Tela de tabela atualizada ajustada para usar o rótulo `Campeão` no destaque principal.
- Validações:
  - `npm.cmd exec tsc -- --noEmit` aprovado;
  - `npm.cmd run lint` aprovado sem erros, restando apenas avisos antigos de otimização de imagem.
## Atualização de 13/07/2026 - Fundação das classes de disputa do torneio

- Iniciada a mudança estrutural para que torneios de tênis funcionem por classes de disputa, separadas da categoria de pontuação do torneio.
- Definidas as classes oficiais iniciais:
  - Iniciante;
  - Classe C;
  - Classe B;
  - Classe A.
- Criada a migração `025_tournament_classes.sql` com a base para:
  - classes disponíveis por torneio;
  - inscrição vinculada a uma classe do torneio;
  - partidas vinculadas a uma classe do torneio;
  - pontos vinculados a uma classe do torneio;
  - classe do jogador por comunidade/esporte.
- Criado o utilitário `lib/tournamentClasses.ts` para centralizar nomes e ordem das classes.
- O gerador de chave Mata-mata foi preparado para gerar partidas por classe, mantendo compatibilidade com torneios antigos sem classe.
- A ação de iniciar torneio foi preparada para gerar chaves separadas quando houver classes cadastradas.
- A API de inscrição foi preparada para receber `tournamentClassId`, mantendo compatibilidade com inscrições antigas sem classe.
- Criada a API inicial do organizador para listar/salvar classes do torneio.
- Após reinício inesperado do PC, o arquivo interrompido da API de classes foi recuperado e validado.
- Validações:
  - `npm.cmd exec tsc -- --noEmit` aprovado;
  - `npm.cmd run lint` aprovado sem erros, restando apenas avisos antigos de otimização de imagem.

Próximo passo recomendado:
- Conectar essa fundação à tela de criação/edição do torneio para o organizador escolher as classes do torneio.
- Depois atualizar a tela do jogador para exibir as classes disponíveis e permitir inscrição por classe.

## Atualização de 13/07/2026 - Classes de disputa conectadas
- Mantidos os termos de classe definidos para o MVP: Iniciante, Classe C, Classe B e Classe A.
- Criação e edição de torneios pelo organizador agora permitem selecionar as classes de disputa.
- O salvamento do torneio também salva as classes selecionadas em tournament_classes.
- A página do torneio para o jogador carrega as classes disponíveis, mostra inscritos por classe e exige escolha da classe antes da inscrição.
- A inscrição enviada pelo jogador agora informa a classe escolhida para que tabela, resultados e histórico possam ser separados por classe.
- Validações realizadas: npm.cmd exec tsc -- --noEmit e npm.cmd run lint aprovados; permanecem apenas avisos antigos de uso de img.
- Próximo passo sugerido: criar a página de detalhes de cada classe do torneio, com inscritos por classe, status de pagamento/aprovação e, depois, chaves/resultados filtrados por classe.


## Atualização de 13/07/2026 - Página de detalhe por classe
- Criada a rota do jogador para detalhes de cada classe do torneio: /jogador/torneios/[id]/classes/[classId].
- A página mostra resumo da classe, inscritos/vagas, pendências, partidas, campeão quando houver e taxa de inscrição da classe.
- Inscrições são listadas filtradas pela classe, com status de pagamento/aprovação/confirmado.
- Partidas são listadas filtradas pela classe, preparando chave/resultados separados por classe.
- Adicionado botão Detalhes da classe nos cards de classes da página do torneio.
- Validações realizadas: npm.cmd exec tsc -- --noEmit e npm.cmd run lint aprovados; permanecem apenas avisos antigos de img.
- Próximo passo sugerido: criar a versão do organizador para gerenciar cada classe, aprovar inscritos por classe e filtrar tabela/resultados por classe.


## Atualização de 15/07/2026 - Visão do organizador por classe
- Criada a rota administrativa /organizador/torneios/[id]/classes/[classId].
- A página permite ao organizador ver resumo da classe, inscritos/vagas, pendências, partidas, campeão e formato.
- Inscrições são filtradas por classe e exibem status de pagamento/aprovação.
- O organizador pode aprovar, recusar ou remover inscritos diretamente dentro da classe enquanto o torneio estiver em preparação/inscrições.
- Partidas são listadas filtradas por tournament_class_id, preparando resultados e tabela separados por classe.
- A tela de edição do torneio agora exibe cards das classes com botão Gerenciar classe.
- Validações realizadas: npm.cmd exec tsc -- --noEmit e npm.cmd run lint aprovados; permanecem apenas avisos antigos de img.
- Próximo passo sugerido: filtrar visualmente tabela/resultados/ranking por classe nas páginas existentes e testar o fluxo completo com um torneio novo com classes.


## Atualização de 15/07/2026 - Tabela e resultados filtrados por classe
- A página da tabela atualizada do torneio agora aceita o parâmetro ?classe=... e filtra inscrições/partidas por tournament_class_id.
- A página de resultados do organizador agora aceita o parâmetro ?classe=... e filtra pódio, partidas e tabela por classe.
- Os botões criados nas páginas de classe já apontam para essas URLs filtradas, mantendo o comportamento antigo quando não houver classe na URL.
- Validações realizadas: npm.cmd exec tsc -- --noEmit e npm.cmd run lint aprovados; permanecem apenas avisos antigos de img.
- Próximo passo sugerido: aplicar o mesmo filtro por classe no ranking do torneio e testar fluxo completo com torneio novo em classes.


## Atualização de 15/07/2026 - Ranking filtrado por classe
- O ranking geral do jogador agora carrega tournament_class_id em inscrições, pontos e partidas.
- Quando a URL usa ?torneio=...&classe=..., o ranking passa a calcular participantes, pontos, vitórias/derrotas e partidas finalizadas apenas daquela classe.
- Foi adicionado seletor de classe no ranking geral do torneio, mantendo a opção Todas as classes.
- O comportamento antigo permanece quando não há classe selecionada.
- Validações realizadas: npm.cmd exec tsc -- --noEmit e npm.cmd run lint aprovados; permanecem apenas avisos antigos de img.
- Próximo passo sugerido: testar fluxo completo com torneio novo em classes e corrigir qualquer ajuste visual/operacional encontrado no teste.


## 2026-07-15 - Correção de abertura do torneio do organizador

- Corrigido o carregamento da página `organizador/torneios/[id]` para não quebrar quando a leitura de classes do torneio estiver indisponível.
- Torneio, inscrições e partidas continuam sendo carregamentos obrigatórios; classes agora são tratadas como dado complementar/tolerante.
- Validação executada:
  - `npm.cmd exec tsc -- --noEmit` aprovado.
  - `npm.cmd run lint` aprovado, restando apenas avisos antigos de otimização de imagens.

## 2026-07-15 - Correção de acentuação na página de resultados do organizador

- Corrigidos textos com codificação quebrada em `app/organizador/resultados/[id]/page.tsx`.
- Ajustados termos como `Pódio do Torneio`, `Campeão`, `Nenhuma partida concluída ainda`, mensagens de erro e símbolos de ordinal.
- Validação executada: `npm.cmd exec tsc -- --noEmit` aprovado.

## 2026-07-15 - Varredura geral de acentuação/codificação

- Feita varredura em `app`, `components` e `lib` procurando textos com codificação quebrada.
- Corrigidos textos em páginas do jogador, criação/edição de torneios, ranking, tabela e mensagens de API.
- Exemplos corrigidos: `competição`, `pontuação`, `descrição`, `inscrições`, `confirmação`, `Troféu`, `Brasília`, `Você`, `Campeão`.
- Validações executadas:
  - `npm.cmd exec tsc -- --noEmit` aprovado.
  - `npm.cmd run lint` aprovado, restando apenas avisos antigos de otimização de imagens.

## 2026-07-15 - Correção da seleção de classes do torneio

- Corrigida a seleção de classes na criação de torneios para evitar tela preta ao clicar em Iniciante, Classe C, Classe B ou Classe A.
- A seleção deixou de usar checkbox escondido dentro de label e passou a usar botões seguros com `type="button"`.
- Aplicada a mesma proteção na tela de edição do torneio.
- Validações executadas:
  - `npm.cmd exec tsc -- --noEmit` aprovado.
  - `npm.cmd run lint` aprovado, restando apenas avisos antigos de otimização de imagens.

## 2026-07-15 - Ajustes na criação de torneios

- Removidos os campos textuais de descrição e regulamento da tela de criação; ficou apenas o upload do PDF do regulamento.
- Campos de data receberam estilo específico para deixar o seletor/calendário mais visível no tema escuro.
- Fluxo de patrocinadores ajustado: agora o organizador seleciona a imagem, informa o nome do patrocinador e salva antes de adicionar à lista.
- Botão final passou de `Criar e publicar` para `Criar` quando o torneio será publicado.
- Ao criar ou falhar, a tela rola para o topo para exibir a mensagem de sucesso ou erro.
- A API de criação agora retorna detalhe do erro para ajudar a identificar o motivo da falha.
- Validações executadas:
  - `npm.cmd exec tsc -- --noEmit` aprovado.
  - `npm.cmd run lint` aprovado, restando avisos antigos de otimização de imagens.

## 2026-07-15 - Calendário visível e erro detalhado na criação de torneios

- Tela de criação de torneio agora inicia com data de hoje às 00:00 em `Início` e `Início das inscrições`.
- Adicionado botão visível de calendário ao lado dos campos de data/hora.
- Ao alterar data/hora, o campo perde foco para tentar fechar o seletor nativo automaticamente após a escolha.
- A API de criação agora extrai detalhes de erro também quando o Supabase retorna objeto simples, evitando mensagem genérica `Erro interno desconhecido`.
- Validações executadas:
  - `npm.cmd exec tsc -- --noEmit` aprovado.
  - `npm.cmd run lint` aprovado, restando avisos antigos de otimização de imagens.

## 2026-07-15 - Correções finais na criação de torneio

- Corrigido erro ao escolher data/hora: o `blur` agora usa uma referência segura ao input antes do evento ser liberado pelo React.
- Ajustado botão de upload de patrocinador para abrir o seletor de arquivo sem usar `label` apontando diretamente para input escondido, reduzindo salto de rolagem da página.
- Criação do torneio ficou tolerante quando a tabela `tournament_classes` ainda não existe no Supabase: o torneio é criado e a ausência da tabela é registrada como aviso no servidor.
- Observação: para salvar classes por torneio definitivamente, ainda é necessário aplicar a migração `025_tournament_classes.sql` no Supabase.
- Validações executadas:
  - `npm.cmd exec tsc -- --noEmit` aprovado.
  - `npm.cmd run lint` aprovado, restando avisos antigos de otimização de imagens.

## 2026-07-15 - Limpeza e prevenção de torneios duplicados

- Removidos 4 registros duplicados de `Torneio Teste 3` que foram criados durante tentativas anteriores com erro pós-inserção.
- Mantido apenas o registro mais recente de `Torneio Teste 3`.
- Verificado antes da remoção que os duplicados não possuíam inscrições, partidas ou desafios.
- API de criação reforçada para impedir duplicidade com mesmo nome, data de início, esporte e comunidade/clube.
- API também passou a remover o torneio recém-criado caso uma etapa posterior falhe por motivo diferente da ausência temporária de `tournament_classes`.
- Validações executadas:
  - `npm.cmd exec tsc -- --noEmit` aprovado.
  - `npm.cmd run lint` aprovado, restando avisos antigos de otimização de imagens.

## 2026-07-15 - Ajuste de inscri��o do jogador e per�odo do torneio

- Ajustei a exibi��o do per�odo do torneio na p�gina do jogador para mostrar `In�cio: dd/mm/aaaa` e `Fim: dd/mm/aaaa` em linhas separadas.
- Corrigi o fluxo de inscri��o para continuar funcionando quando a estrutura nova de classes ainda n�o estiver aplicada no Supabase.
- A API de inscri��o agora evita usar `tournament_class_id` quando o banco ainda est� no formato legado.
- Melhorei o retorno de erro da inscri��o para trazer detalhes t�cnicos quando ocorrer nova falha.
- Valida��o executada: TypeScript aprovado e lint aprovado sem erros, restando apenas avisos antigos de otimiza��o de imagens.

Pr�ximo teste recomendado: recarregar a p�gina do torneio como jogador e clicar em `Fazer inscri��o` novamente.

## 2026-07-15 - Limpeza visual da p�gina p�blica do torneio

- Alterei o status de inscri��o pendente para `Aguardando confirma��o`.
- Removi a descri��o textual do torneio no topo da p�gina p�blica do torneio.
- Removi a linha de vagas restantes do card `Inscritos / Vagas`.
- Removi cidade/estado do card `Organiza��o`, mantendo esse detalhe apenas no card `Local`.

Mudan�a futura registrada:

- Criar nesta mesma p�gina uma �rea p�blica de acompanhamento do torneio em andamento, para jogadores e visitantes acompanharem jogos, tabela/chave, fases e andamento mesmo sem participarem do torneio.

## 2026-07-17 - Fluxo de inscri��o por classe no torneio

- Transformei o bot�o `Fazer inscri��o` na p�gina do torneio do jogador em um fluxo em duas etapas:
  - sele��o da classe de disputa;
  - confirma��o da inscri��o com resumo do torneio, classe escolhida, taxa e status inicial.
- A confirma��o mostra instru��es de pagamento/valida��o quando o torneio exige pagamento ou confirma��o do organizador.
- A contagem das classes agora considera inscri��es pendentes e confirmadas.
- A p�gina de detalhes da classe do jogador foi enriquecida para mostrar:
  - inscritos daquela classe;
  - status da inscri��o (`Aguardando pagamento`, `Aguardando confirma��o` ou `Inscrito`);
  - idade do jogador quando houver data de nascimento;
  - pontua��o e posi��o no ranking da comunidade quando houver ranking ativo dispon�vel.
- Mantida compatibilidade com o banco atual: se o torneio ainda n�o tiver classes cadastradas no Supabase, o fluxo antigo n�o quebra.

Ponto t�cnico importante:

- Para os torneios exibirem classes reais como `Iniciante`, `Classe C`, `Classe B` e `Classe A`, a migra��o `supabase/migrations/025_tournament_classes.sql` precisa estar aplicada no Supabase e o torneio precisa ter registros em `tournament_classes`.

Valida��o:

- TypeScript aprovado.
- Lint aprovado sem erros, restando apenas avisos antigos de otimiza��o de imagens.

## Atualização - 17/07/2026 - Classes flexíveis por torneio

- Criada a migração `026_flexible_tournament_classes.sql` para permitir que cada torneio tenha quantidade e nomes próprios de classes.
- As classes padrão continuam como sugestão inicial: Iniciante, Classe C, Classe B e Classe A.
- A criação de torneios agora envia `classDefinitions`, com nome e chave de cada classe.
- A edição do torneio foi protegida para preservar classes personalizadas em vez de voltar para a lista fixa antiga.
- APIs de criação e edição de classes foram ajustadas para aceitar classes personalizadas.
- Validação técnica realizada:
  - TypeScript aprovado.
  - Lint aprovado sem erros; permanecem apenas avisos antigos de otimização de imagem.

Pendente para o próximo passo:
- Aplicar no Supabase a migração `supabase/migrations/026_flexible_tournament_classes.sql`.
- Após aplicar, testar criação de um torneio com classes diferentes, por exemplo: Iniciante, Classe C, Classe B, Classe A e uma classe personalizada.
- Em seguida, avançar para a página pública de detalhes de cada classe, com inscritos/status/pontuação por classe.

## Atualização - 17/07/2026 - Migração aplicada no Supabase

- Apliquei no banco Supabase as migrações:
  - `025_tournament_classes.sql`
  - `026_flexible_tournament_classes.sql`
- A tabela `tournament_classes` foi criada no Supabase.
- A tabela agora possui suporte a `class_slug`, permitindo classes personalizadas por torneio.
- Próximo teste recomendado: criar um torneio novo com classes padrão e uma classe personalizada para validar o fluxo completo.

## Atualização - 17/07/2026 - Classes visíveis na página do torneio do jogador

- Corrigida a consulta da página do torneio do jogador para carregar `tournament_class_id` nas inscrições.
- A contagem por classe agora consegue considerar inscrições pendentes e confirmadas da classe correta.
- A página do torneio do jogador passa a mostrar as classes também após o jogador já estar inscrito.
- A classe do jogador fica destacada como `Sua classe`.
- Cada classe exibe quantidade de inscritos/vagas, taxa e botão `Detalhes da classe`.
- Validação técnica realizada:
  - TypeScript aprovado.
  - Lint aprovado sem erros; permanecem apenas avisos antigos de otimização de imagem.

Próximo passo recomendado:
- Testar como jogador a sequência: abrir torneio > ver classes > abrir detalhes da classe > fazer inscrição escolhendo classe > conferir status na página da classe.

## Atualização - 18/07/2026 - Gerenciamento da classe pelo organizador

- A tela do organizador em cada classe do torneio agora funciona melhor como um mini torneio.
- Adicionado controle para iniciar uma classe específica pelo botão `Iniciar classe`.
- Ao iniciar a classe, o sistema gera a chave Mata-mata apenas daquela classe e mantém as partidas filtradas por classe.
- A API do torneio agora aceita a ação `start_class`, validando:
  - torneio aberto ou em andamento;
  - classe existente naquele torneio;
  - pelo menos 2 jogadores confirmados na classe;
  - quantidade compatível com chave automática Mata-mata: 2, 4, 8, 16, 32, 64 ou 128 jogadores.
- A tela da classe mostra status da classe, inscritos/vagas, pendências, partidas e campeão da classe.
- Corrigidos textos de retorno da API com acentuação quebrada.

Validação técnica realizada:

- TypeScript aprovado.
- Lint aprovado sem erros; permanecem apenas avisos antigos de otimização de imagem.

Próximo teste recomendado:

- Entrar como organizador em um torneio com classes, abrir `Gerenciar classe`, aprovar jogadores daquela classe e clicar em `Iniciar classe` quando houver 2, 4, 8 ou 16 inscritos confirmados.
- Depois conferir se a `Tabela` e `Resultados` daquela classe mostram apenas os jogos daquela classe.

## Atualização - 18/07/2026 - Tabela de progressão para o organizador

- Corrigido o botão `Tabela` na tela de gerenciamento da classe do organizador.
- Antes, ele apontava para a página da área do jogador e o app redirecionava o organizador para o Dashboard.
- Criada a página própria do organizador em `/organizador/torneios/[id]/tabela`.
- A tabela do organizador usa a visualização de progressão Mata-mata e respeita o filtro da classe via `?classe=...`.
- Os botões de voltar retornam para a classe quando a tabela estiver filtrada por classe.

Validação técnica realizada:

- TypeScript aprovado.

## Atualização - 22/07/2026 - Acompanhamento público por classe

Retomamos o projeto com uma revisão geral do estado atual e seguimos no fluxo principal do MVP: torneios com classes, inscrição por classe, aprovação, início da classe e visualização da tabela.

Ajustes feitos agora:

- Na página do torneio para o jogador, os atalhos principais agora respeitam a classe do jogador quando existir:
  - Ver chave / tabela;
  - Tabela atualizada;
  - Ranking do torneio.
- Os cards de classes agora têm também o botão `Tabela`, além de `Detalhes da classe`.
- Isso prepara melhor a área pública de acompanhamento do torneio, inclusive para quem quiser acompanhar a progressão dos jogos por classe.

Validação:

- TypeScript aprovado com `npm.cmd exec tsc -- --noEmit`.
- Lint aprovado com `npm.cmd run lint`.
- Permanecem apenas avisos antigos de otimização de imagem (`<img>`), sem erro bloqueante.

Próximo passo recomendado:

- Testar como jogador um torneio com classes:
  1. abrir o torneio;
  2. clicar em `Detalhes da classe`;
  3. clicar em `Tabela` em uma classe;
  4. após inscrição/confirmado, conferir se os botões do topo levam para a tabela e ranking filtrados pela classe correta.
- Depois disso, avançar para melhorar a área pública de acompanhamento do torneio na própria página do torneio, mostrando andamento/tabela das classes mesmo para quem não está inscrito.

## Atualização - 22/07/2026 - Agendamento de partidas

Objetivo trabalhado:

Permitir dois modos de agendamento das partidas:

1. Jogador propõe data e horário, e o adversário confirma ou recusa.
2. Organizador define diretamente a data e horário da partida, útil para torneios com jogos no mesmo dia ou em sequência.

Implementado no código:

- Nova migração: `supabase/migrations/027_match_scheduling.sql`.
- Nova API para jogador: `PATCH /api/matches/[id]/schedule`.
  - `propose`: jogador propõe data/hora.
  - `confirm`: adversário confirma a proposta.
  - `decline`: adversário recusa a proposta.
- Nova API para organizador: `PATCH /api/organizer/matches/[id]/schedule`.
  - organizador define data/hora oficial da partida.
- Tela da partida do jogador atualizada com bloco de `Agendamento da partida`.
- Tela da classe do organizador atualizada para definir horário em cada partida da classe.

Validação local:

- TypeScript aprovado com `npm.cmd exec tsc -- --noEmit`.
- Lint aprovado com `npm.cmd run lint`.
- Permanecem apenas avisos antigos de otimização de imagem (`<img>`), sem erro bloqueante.

Atenção antes de testar no navegador:

- É necessário aplicar a migração `027_match_scheduling.sql` no Supabase, pois as telas agora consultam campos novos em `matches`.

Próximo passo recomendado:

1. Aplicar a migração no Supabase.
2. Recarregar o app.
3. Testar como organizador definindo horário em uma partida da classe.
4. Testar como jogador propondo horário e com o adversário confirmando/recusando.

## Atualização - 22/07/2026 - Correção visual do agendamento

Ajustes após teste visual:

- A lista `Minhas partidas` do jogador agora não mostra mais `Em disputa` quando a partida ainda não tem data/hora definida.
- Partidas sem horário aparecem como `A definir`.
- O botão da partida sem horário passa a indicar `Agendar partida`, levando para a tela onde o jogador pode propor data/hora.
- Na página pública da classe, a partida não aparece mais como `Agendada` se ainda não houver `scheduled_at`.
- Com horário definido, o rótulo passa a `Agendada`.

Validação:

- TypeScript aprovado.
- Lint aprovado, apenas com avisos antigos de imagem.

## Atualização - 22/07/2026 - Agendamento em popup e resultado separado

Ajustes feitos após revisão visual da página de partida:

- O agendamento deixou de ficar misturado com a tela de resultado.
- A lista `Minhas partidas` agora abre um popup para:
  - propor data e horário;
  - confirmar horário proposto pelo adversário;
  - recusar horário proposto.
- A tela `Resultado da partida` ficou focada apenas em:
  - selecionar vencedor;
  - informar placar;
  - confirmar, contestar ou acompanhar resultado pendente.
- Textos quebrados por acentuação na tela de resultado foram corrigidos.
- A navegação de retorno para partidas do torneio foi mantida.

Validação:

- TypeScript aprovado.
- Lint aprovado, restando apenas avisos antigos de otimização de imagem.

Próximo teste recomendado:

1. Abrir `Partidas` do jogador dentro de um torneio.
2. Em partida sem horário, clicar em `Agendar partida`.
3. Propor uma data/hora pelo popup.
4. Entrar como adversário e confirmar ou recusar o horário.
5. Depois de horário confirmado, abrir a partida e informar o resultado.

## Atualização - 22/07/2026 - Refinamento do popup de agendamento

Ajustes feitos após teste visual:

- O popup de agendamento agora tem um botão visível de calendário ao lado do campo de data/hora.
- Ao escolher data/hora, o campo perde o foco automaticamente para tentar fechar o seletor nativo do navegador.
- Quando o jogador já propôs um horário, a partida passa a mostrar `Aguardando oponente`.
- Enquanto aguarda o oponente, a lista não mostra mais `Agendar partida` nem `Informar resultado` para aquela partida.
- Quando o horário foi proposto pelo adversário, a ação exibida é `Responder horário`.

Validação:

- TypeScript aprovado.
- Lint aprovado, restando apenas avisos antigos de otimização de imagem.

## Atualização - 22/07/2026 - Alteração de horário proposto

Ajuste feito no fluxo de agendamento:

- Quando o jogador propõe um horário e o adversário ainda não respondeu, a partida mostra `Aguardando oponente`.
- Nesse estado, agora aparece o botão `Alterar horário`.
- O botão abre o mesmo popup de agendamento já preenchido com o horário proposto.
- Ao salvar, a proposta é reenviada com o novo horário.
- Depois que o horário estiver confirmado, a alteração livre continua bloqueada para proteger a organização do torneio.

Validação:

- TypeScript aprovado.
- Lint aprovado, restando apenas avisos antigos de otimização de imagem.

## Atualização - 22/07/2026 - Calendário do agendamento

Correção após teste visual:

- Removido o fechamento automático do seletor de data/hora a cada clique.
- O jogador agora pode escolher dia, mês, hora e minutos sem o calendário fechar antes da hora.
- A confirmação da escolha fica concentrada no botão do popup (`Propor horário` ou `Salvar alteração`).

Validação:

- TypeScript aprovado.
- Lint aprovado, restando apenas avisos antigos de otimização de imagem.

## 2026-07-31 - Ajuste do agendamento de partidas

- Removido o fechamento automático do seletor de data/hora no pop-up de agendamento do jogador.
- Reforçado o botão visual para abrir o calendário no pop-up de agendamento.
- Ajustado o rótulo de alteração de horário para “Alterar proposta”, deixando claro que o jogador pode mudar o horário sugerido enquanto o adversário ainda não confirmou.
- Corrigidas mensagens com acentuação quebrada nas APIs de agendamento e resultado de partidas.
- Validação realizada:
  - TypeScript aprovado.
  - Lint aprovado sem erros, restando apenas avisos antigos sobre uso de imagens.

Próximo teste recomendado: jogador propõe horário, confere se aparece “Aguardando oponente”, adversário confirma ou recusa, e depois a partida segue para envio de resultado.

## 2026-07-31 - Correção de tela vermelha na página inicial

- Ajustada a checagem de conexão do Supabase na página inicial para não registrar erro no console quando a sessão/rede falhar.
- Antes, uma falha esperada de autenticação podia aparecer como tela vermelha do Next em desenvolvimento antes mesmo do teste de partidas.
- Agora a home apenas mostra o estado visual de erro do Supabase sem interromper a navegação.
- Validação realizada: TypeScript aprovado.

## 2026-07-31 - Correção de textos da página inicial

- Corrigidos textos com acentuação quebrada na home após ajuste anterior de conexão Supabase:
  - “Já Tenho Uma Conta”
  - “Premiações”
- Varredura rápida feita em `app`, `components`, `lib`, `services`, `hooks` e `types` para localizar outros textos quebrados.
- Validação realizada: TypeScript aprovado.

## Diretriz visual permanente - Paleta RankArena

- Não alterar a identidade visual para cores que fujam da paleta atual do RankArena.
- Paleta base: preto/cinza escuro, laranja RankArena, branco e cinzas neutros.
- Referências externas podem inspirar layout, hierarquia, espaçamento, cards e imagens, mas não devem substituir a identidade visual do projeto.
- Quando for necessário ajustar contraste ou destaque, usar variações que combinem com a paleta atual.

## 2026-07-31 - Padrão visual aprovado para Arenas e detalhe do torneio
- Tela Arenas: manter proporções atuais aprovadas, com título principal forte, mas sem exagerar tamanhos; banners por esporte com uma única ocorrência do nome do esporte; cards compactos e visuais.
- Detalhe do torneio do jogador: título do torneio deve ser menor que o título principal de página, usando aproximadamente text-2xl no mobile e text-3xl no desktop; cards de informações devem permanecer compactos, com altura aproximada min-h-[88px] e padding reduzido.
- Fonte oficial: Montserrat para títulos via font-display e Inter para texto via font-body.
- Paleta visual obrigatória: preto/cinza escuro, laranja RankArena, branco e cinzas neutros.
- Lembrete para a próxima sessão: possibilitar que a área do título/cabeçalho do torneio tenha imagem de background configurável, mantendo overlay escuro/laranja para preservar a identidade RankArena.


## 2026-08-11 - Background no cabeçalho do torneio

- Página de detalhe do torneio do jogador preparada para usar imagem de fundo no cabeçalho.
- Nesta primeira etapa, o cabeçalho usa como fallback a imagem da comunidade (`banner_url`) ou do clube (`cover_image_url`), sem exigir alteração imediata no banco de dados.
- Mantido overlay escuro/laranja para preservar a paleta RankArena e garantir leitura do título.
- A estrutura fica pronta para, na próxima etapa, criar um campo próprio de imagem/banner por torneio na tela do organizador.

Validação:

- TypeScript aprovado.
- Lint aprovado sem erros, restando apenas avisos antigos de otimização de imagem.

## 2026-08-11 - Correção rápida do ranking do jogador

- Corrigido texto quebrado nas posições/medalhas da página de ranking do jogador.
- As posições do pódio e da tabela agora usam rótulos estáveis (`1º`, `2º`, `3º`, `4`, etc.) em vez de emojis que estavam sendo salvos com codificação quebrada.
- Mantida a estrutura visual atual da página para nova avaliação do usuário.

Validação:

- TypeScript aprovado.
- Lint aprovado sem erros, restando apenas avisos antigos de otimização de imagem.

## 2026-08-11 - Ranking direto no Ranking Geral

- Página de Ranking do jogador ajustada para abrir diretamente no Ranking Geral.
- Removidas as abas que separavam “Meu ranking” e “Ranking geral”, pois estavam redundantes.
- Mantidos os filtros por Torneio e Classe, porque continuam importantes para visualizar rankings separados por classe.
- Mantido o card “Sua posição” com indicação de movimento quando houver dado disponível: subiu, caiu ou estável.
- Mantida a identidade visual do RankArena: fundo escuro, laranja RankArena, branco e cinzas neutros.

Validação:

- TypeScript aprovado.
- Lint aprovado sem erros, restando apenas avisos antigos de otimização de imagem.

Ponto para retomada:

- Recarregar a página `/jogador/ranking` e conferir visualmente se o Ranking abre direto no Ranking Geral com os filtros de Torneio e Classe.
- Depois disso, seguir para o fluxo principal do MVP: revisar o ciclo Torneio → Classe → Inscrição → Aprovação → Tabela → Agendamento → Resultado → Ranking atualizado.

## 2026-08-14 - Organizador alinhado ao fluxo por classes

- Ranking do jogador foi validado visualmente pelo usuário e ficou como Ranking Geral direto, mantendo filtro por torneio e classe.
- Na página principal do torneio do organizador, as inscrições agora carregam a classe escolhida pelo jogador.
- A lista de inscrições do organizador mostra a classe de cada participante, ajudando na conferência de pagamento/aprovação.
- A Central de Controle passou a considerar classes quando o torneio possui classes: mostra quantas classes estão prontas para gerar chave.
- Os cards de Classes do Torneio agora mostram confirmados, pendentes, partidas criadas e status visual: Aguardando, Pronta ou Iniciada.
- A regra visual foi alinhada ao Mata-mata automático: classe pronta exige 2, 4, 8, 16... jogadores confirmados.
- Validação executada: TypeScript aprovado e lint aprovado sem erros; permanecem apenas avisos antigos de otimização de imagens.

Próximo teste recomendado:
1. Entrar como organizador em um torneio com classes.
2. Conferir se cada inscrição mostra a classe escolhida.
3. Conferir os cards das classes: confirmados, pendentes, jogos e status.
4. Abrir uma classe pronta e iniciar a classe por ali.
5. Verificar se a tabela, partidas e ranking continuam separados por classe.

## 2026-08-14 - Placar estruturado para calculo de games

- Decisao tecnica registrada: o placar visual da partida continua existindo como texto para exibicao, mas os games de cada jogador passam a ser salvos tambem de forma estruturada.
- Criado o apoio de servidor para interpretar placares como `6/4 6/3` ou `6-4 6-3`.
- Ao enviar/confirmar resultado, o placar e normalizado para exibicao e os sets sao gravados na tabela `match_sets`.
- Isso prepara o RankArena para formatos futuros como Sistema de Grupos, onde sera necessario calcular:
  - games ganhos;
  - games perdidos;
  - saldo de games;
  - criterios de desempate por grupo.
- O fluxo foi aplicado tanto para resultado enviado/confirmado pelos jogadores quanto para resultado finalizado pelo organizador.

Validacao:

- TypeScript aprovado.
- Lint aprovado sem erros, restando apenas avisos antigos de otimizacao de imagem.

Proximo teste recomendado:

1. Abrir uma partida ainda nao finalizada.
2. Informar um placar no formato `6/4 6/3`.
3. Confirmar o resultado pelo adversario ou pelo organizador.
4. Conferir se o resultado continua aparecendo normalmente na tela.
5. Na etapa seguinte, criar a exibicao dos sets/games e os calculos de saldo para grupos.

## 2026-08-14 - Resultado com tipo e base para desempate por games

- Fortalecida a base de resultados das partidas para suportar calculos futuros de Sistema de Grupos.
- O resultado agora pode ser tratado como:
  - regular;
  - W.O.;
  - desist�ncia.
- O placar regular/desist�ncia continua aceitando formatos como `6/4 6/3` ou `6-4 6-3`.
- Para W.O., o sistema nao exige placar em games; o placar visual fica como `W.O.`.
- Para desist�ncia, o sistema mant�m os games jogados e registra o placar visual com indica��o de desist�ncia.
- Criada migra��o `028_match_result_types_and_score_totals.sql` para:
  - garantir `result_type` e `proposed_result_type` em `matches`;
  - aceitar `regular`, `walkover` e `retirement`;
  - criar a view `match_score_totals` com games/sets pr�, contra e saldo por partida.
- A tela de resultado do jogador passou a permitir escolher tipo de resultado.
- A tela de resultados pendentes do organizador passou a permitir confirmar resultado normal, W.O. ou desist�ncia.
- Registrada a regra pr�tica para super tie-break: lan�ar como `1/0` no set final quando for usado como crit�rio para n�o distorcer saldo de games.

Valida��o:

- TypeScript aprovado.
- Lint aprovado sem erros, restando apenas avisos antigos de otimiza��o de imagem.

Antes do teste:

- Aplicar no Supabase a migra��o `supabase/migrations/028_match_result_types_and_score_totals.sql`.

Pr�ximo teste recomendado:

1. Finalizar uma partida com placar normal, por exemplo `6/4 6/3`.
2. Finalizar outra como W.O., escolhendo apenas o vencedor.
3. Finalizar outra como desist�ncia, mantendo os games jogados.
4. Conferir se a partida finaliza, se o placar aparece corretamente e se a tabela/ranking continuam atualizando.

## 2026-08-14 - Corre��o de sess�o ao confirmar resultado

- Corrigido fluxo da tela de resultado do jogador quando a API retorna sess�o inv�lida ao confirmar/contestar resultado.
- A tela agora tenta renovar a sess�o automaticamente e repete a chamada uma vez antes de pedir novo login.
- Isso evita perder a confirma��o quando o token local estiver expirado, mas o usu�rio ainda estiver navegando no app.

Valida��o:

- TypeScript aprovado.
- Lint aprovado sem erros, restando apenas avisos antigos de otimiza��o de imagem.

Pr�ximo teste:

- Recarregar a p�gina da partida e clicar novamente em Confirmar.
- Se ainda aparecer sess�o expirada, sair e entrar novamente na conta do jogador para renovar o login no navegador.

## 2026-08-14 - Corre��o local de certificado Supabase no servidor

- Ao confirmar resultado pelo jogador, a API retornava `Sess�o inv�lida. Detalhe: fetch failed`.
- Diagn�stico mostrou que o Node local n�o conseguia validar o certificado HTTPS do Supabase: `UNABLE_TO_VERIFY_LEAF_SIGNATURE`.
- O navegador acessava normalmente, mas as rotas de servidor que usam `supabaseAdmin.auth.getUser(token)` falhavam antes de salvar resultado/games/sets.
- Ajustado `lib/supabaseAdmin.ts` para desabilitar valida��o TLS apenas em `NODE_ENV=development`, evitando impacto em produ��o.
- Depois do ajuste, o teste de conex�o passou do erro de certificado e recebeu resposta HTTP do Supabase.

Valida��o:

- TypeScript aprovado.
- Lint aprovado sem erros, restando apenas avisos antigos de otimiza��o de imagem.

Pr�ximo teste:

- Recarregar a p�gina da partida e tentar confirmar novamente.
- Se o servidor local n�o aplicar o hot reload, reiniciar o `npm.cmd run dev`.

## 2026-08-14 - Correção do servidor local travando no arquivo trace

- Corrigido travamento do Next.js em desenvolvimento causado por bloqueio do Windows no arquivo temporário `.next\trace` / `.next-dev\trace`.
- O script local `scripts/normalize-readlink.cjs` agora redireciona a escrita do trace para a pasta temporária do Windows.
- Removida dependência de download do Google Fonts no `app/layout.tsx`; o app mantém as famílias via CSS/fallback local para evitar falha de certificado em desenvolvimento.
- A tela inicial voltou a responder em `http://localhost:3000/` com status 200.

## 2026-08-14 - Encerramento do dia / ambiente local estabilizado

Status salvo para retomada:

- Problema investigado: app em `http://localhost:3000` mostrava 404 mesmo com o servidor aparentemente rodando.
- Causa identificada: havia múltiplas instâncias do servidor Next/RankArena abertas ao mesmo tempo. A porta `3000` ficava presa por uma instância antiga, e novas execuções subiam em `3001`, enquanto o navegador continuava em `3000`.
- Correção aplicada:
  - encerrados processos duplicados do RankArena;
  - servidor reiniciado limpo em `http://localhost:3000`;
  - `scripts/run-next.cjs` ajustado para impedir que o app suba silenciosamente em `3001` quando a porta `3000` estiver ocupada;
  - validação feita: página inicial respondeu `200 OK`.
- Observação importante para próximos usos:
  - manter apenas um terminal do servidor aberto;
  - não rodar `npm.cmd run dev` novamente se o servidor já estiver ativo;
  - se aparecer 404 antigo no navegador, usar `Ctrl + Shift + R`.

Próximo ponto recomendado para retomar:

1. Abrir o app em `http://localhost:3000`.
2. Confirmar visualmente que a home carrega.
3. Voltar ao fluxo principal do MVP: resultado de partida com placar estruturado, confirmação do adversário/organizador, atualização da tabela/ranking e testes por classe.


## 2026-08-15 - Nova tela de cadastro base aplicada

A tela de cadastro inicial (/cadastro) foi substituída pelo novo layout visual de referência Tela1_Cadastro Basico.png, mantendo a criação de conta no Supabase e adicionando WhatsApp ao cadastro base. TypeScript aprovado.


## 2026-08-15 - Logo oficial no cadastro

- Substituído o cabeçalho textual da tela de cadastro inicial pela logomarca oficial do RankArena.
- A logo foi disponibilizada em `public/rankarena-logo-white.png` para uso controlado pelo app.
- Validação TypeScript concluída sem erros.

## 2026-08-15 - Nova tela de perfil do jogador

- Aplicado novo layout de completar perfil do jogador na rota existente `/jogador/perfil`.
- Mantido o fluxo atual para evitar quebra de navegação e compatibilidade com Supabase.
- Incluídos/organizados os campos necessários: nome completo, nome público, nascimento, sexo, estado, cidade, bairro, WhatsApp, e-mail, esportes, esporte principal e nível/classe.
- Registrada diretriz oficial: quando a mudança for apenas de layout, manter o nome/rota das páginas existentes.
- Validação TypeScript concluída sem erros.

## 2026-08-15 — Refinamento visual da tela de Perfil do Jogador

- Ajustei a tela existente `/jogador/perfil` conforme a nova referência visual do RankArena.
- Mantive a rota, o nome da página e a lógica de salvamento para evitar quebra de fluxo com Supabase/onboarding.
- Removi elementos que não estavam alinhados à referência: borda externa azul, indicador de passos sem fluxo real, "Perfil 100% completo" e "Pular por enquanto".
- Substituí os ícones infantis/emojis dos esportes por ícones lineares em SVG, com aparência mais profissional.
- Ajustei proporções de layout, fontes e botão principal para ficar mais próximo do sistema visual Apex Competition System / RankArena.
- Botão principal atualizado para "Salvar Perfil".
- Validação técnica executada: `npm.cmd exec tsc -- --noEmit` passou sem erros.

## 2026-08-15 — Ajuste nas modalidades do Perfil do Jogador

- Removi da exibição da tela `/jogador/perfil` as opções Pickleball, Padel e Sinuca.
- A remoção foi feita por filtro na lista carregada do banco, sem alterar tabelas, rotas ou fluxo de salvamento.
- Validação técnica executada: `npm.cmd exec tsc -- --noEmit` passou sem erros.

## 2026-08-16 — Perfil do Jogador alinhado à referência visual

- Ajustei a tela `/jogador/perfil` para seguir melhor a referência `Tela1_Cadastro Perfil Jogador.png`.
- Troquei os ícones de esportes para a família `Material Symbols Outlined`, incluindo: Tênis, Futebol, Vôlei, Basquete e Beach Tênis.
- O bloco "Esportes de Interesse" agora usa o ícone `sports_score`, conforme a referência.
- Ajustei proporção de títulos, subtítulos, cards e espaçamento da grade para aproximar o layout do modelo enviado.
- Mantive a rota, o nome da página e o fluxo de salvamento atuais para não quebrar integração com Supabase.
- Validação técnica executada: TypeScript passou sem erros.

## 2026-08-16 — Ajustes finais no Perfil do Jogador

- Restrita a lista de esportes da tela `/jogador/perfil` para o conjunto oficial: Tênis, Futebol, Vôlei, Basquete e Beach Tênis.
- Mantida a ordem visual oficial dessas modalidades quando existirem no banco.
- Removidas as bordas do cabeçalho e da lateral apenas na Área do Jogador, preservando o visual das demais áreas.
- Validação técnica executada: TypeScript passou sem erros.

## 2026-08-16 00:22 - Ajustes na tela de perfil do jogador

- A tela /jogador/perfil passou a ocupar melhor a Área do Jogador, removendo o excesso de espaço herdado do layout geral.
- A Área do Jogador não deve usar bordas visuais de cabeçalho/lateral no mesmo padrão antigo do dashboard administrativo.
- A tela de perfil mantém a referência visual do novo design RankArena, com foco em layout escuro, laranja de ação e hierarquia mais próxima da referência Stitch.
- Esportes oficiais para seleção no perfil: Tênis, Futebol, Vôlei, Basquete e Beach Tênis.
- O cadastro de esportes foi normalizado no Supabase para exibir as cinco opções oficiais e consolidar Beach Tênis sem duplicidade.
- Validação técnica: TypeScript aprovado sem erros.

## 16/08/2026 — Novo layout: Completar Perfil do Organizador

- A rota existente `/onboarding/organizador` foi mantida para preservar o fluxo de login/onboarding.
- A tela foi redesenhada com base na referência `Tela1_Cadastro Perfil Organizador.png`:
  - cabeçalho interno `Tournament Central`;
  - seção `Configure sua Arena`;
  - cards de `Dados da Organização`, `Dados do Responsável`, `Logo da Comunidade`, `Esportes Organizados` e `Configurações de Acesso`;
  - botão principal `Finalizar cadastro` no padrão laranja do RankArena.
- A API `/api/organizer/onboarding` foi ampliada para salvar dados estruturais do organizador, responsável, política de acesso e esportes organizados.
- Criada a migration `029_organizer_profile_details.sql` com novos campos em `organizers` e a tabela `organizer_sports`.
- Validação técnica: TypeScript aprovado com `npm.cmd exec tsc -- --noEmit`.

Próxima ação necessária antes de testar salvamento completo no Supabase: aplicar a migration `029_organizer_profile_details.sql` no SQL Editor.
