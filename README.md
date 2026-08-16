# RankArena

RankArena é uma plataforma para organizar torneios esportivos, controlar partidas, validar resultados e atualizar rankings automaticamente.

## Stack

- Next.js 15 com App Router
- React 19
- Tailwind CSS
- Supabase Auth + PostgreSQL
- Lucide React

## Fluxos já funcionais no MVP

- Cadastro, login e escolha de perfil.
- Perfil completo do jogador.
- Onboarding do organizador com campos obrigatórios.
- Criação e gestão de torneios pelo organizador.
- Inscrição de jogadores em torneios.
- Aprovação de inscrições.
- Torneio Mata-mata com geração automática da primeira rodada.
- Registro de resultado por jogador.
- Confirmação por adversário ou validação pelo organizador.
- Atualização automática de tabela, campeão e ranking após confirmação.
- Ranking pessoal do jogador.
- Ranking geral por torneio com todos os participantes.
- Encerramento seguro do torneio, bloqueado se houver partidas pendentes.

## Banco de dados

As migrações canônicas ficam em:

```text
supabase/migrations
```

Elas devem ser aplicadas em ordem numérica no Supabase. Arquivos antigos `supabase_migrations_*.sql` na raiz são históricos e não devem ser usados em novos ambientes.

## Variáveis de ambiente

Copie `.env.example` para `.env.local` no ambiente local e configure:

- `NEXT_PUBLIC_SUPABASE_URL`
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`
- `SUPABASE_SERVICE_ROLE_KEY`
- `NEXT_PUBLIC_APP_URL`

Em produção, mantenha `SUPABASE_SERVICE_ROLE_KEY` apenas como segredo do servidor.

## Comandos

```bash
npm install
npm run dev
npm run build
npm run start
```

Antes de rodar `npm run build`, pare o servidor local de desenvolvimento para evitar bloqueio dos arquivos em `.next`.

## Próximos passos de produto

1. Publicar uma versão beta fechada.
2. Validar o fluxo com usuários reais em um torneio pequeno.
3. Implementar suporte automático a “bye” no Mata-mata.
4. Implementar Winner/Lower e Sistema de Grupos.
5. Melhorar notificações de resultado pendente, confirmação e avanço de fase.
