-- Fase 3: Torneios, Partidas e Desafios (com Sets detalhados)

-- 1. Tournaments
create table if not exists public.tournaments (
  id uuid default gen_random_uuid() primary key,
  organizer_id uuid references public.organizers(id) on delete cascade not null,
  club_id uuid references public.clubs(id) on delete set null,
  community_id uuid references public.communities(id) on delete set null,
  sport_id uuid references public.sports(id) not null,
  name text not null,
  slug text unique,
  description text,
  start_date timestamp with time zone,
  end_date timestamp with time zone,
  status text check (status in ('draft', 'open', 'running', 'finished', 'cancelled')) default 'draft',
  max_players integer,
  entry_fee numeric(10, 2),
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);

create index if not exists tournaments_organizer_idx on public.tournaments(organizer_id);
create index if not exists tournaments_sport_idx on public.tournaments(sport_id);

alter table public.tournaments enable row level security;
create policy "Tournaments are viewable by everyone" on public.tournaments for select using (true);

-- 2. Tournament Registrations
create table if not exists public.tournament_registrations (
  id uuid default gen_random_uuid() primary key,
  tournament_id uuid references public.tournaments(id) on delete cascade not null,
  player_id uuid references public.players(id) on delete cascade not null,
  status text check (status in ('pending', 'confirmed', 'cancelled', 'rejected')) default 'pending',
  registered_at timestamp with time zone default timezone('utc'::text, now()) not null,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  unique (tournament_id, player_id)
);

create index if not exists tournament_registrations_tournament_idx on public.tournament_registrations(tournament_id);
create index if not exists tournament_registrations_player_idx on public.tournament_registrations(player_id);

alter table public.tournament_registrations enable row level security;
create policy "Registrations are viewable by everyone" on public.tournament_registrations for select using (true);

-- 3. Matches
create table if not exists public.matches (
  id uuid default gen_random_uuid() primary key,
  tournament_id uuid references public.tournaments(id) on delete cascade,
  community_id uuid references public.communities(id) on delete cascade,
  season_id uuid references public.seasons(id) on delete cascade,
  sport_id uuid references public.sports(id) not null,
  player_one_id uuid references public.players(id) on delete cascade,
  player_two_id uuid references public.players(id) on delete cascade,
  winner_id uuid references public.players(id) on delete cascade,
  score text, -- Resumo opcional, ex: "6-4, 7-5"
  status text check (status in ('scheduled', 'pending_result', 'completed', 'cancelled', 'disputed')) default 'scheduled',
  scheduled_at timestamp with time zone,
  played_at timestamp with time zone,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);

create index if not exists matches_tournament_idx on public.matches(tournament_id);
create index if not exists matches_season_idx on public.matches(season_id);
create index if not exists matches_players_idx on public.matches(player_one_id, player_two_id);

alter table public.matches enable row level security;
create policy "Matches are viewable by everyone" on public.matches for select using (true);

-- 4. Match Sets
create table if not exists public.match_sets (
  id uuid default gen_random_uuid() primary key,
  match_id uuid references public.matches(id) on delete cascade not null,
  set_number integer not null,
  player_one_score integer not null default 0,
  player_two_score integer not null default 0,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  unique(match_id, set_number)
);

create index if not exists match_sets_match_idx on public.match_sets(match_id);

alter table public.match_sets enable row level security;
create policy "Match sets are viewable by everyone" on public.match_sets for select using (true);

-- 5. Challenges
create table if not exists public.challenges (
  id uuid default gen_random_uuid() primary key,
  community_id uuid references public.communities(id) on delete cascade not null,
  sport_id uuid references public.sports(id) not null,
  challenger_id uuid references public.players(id) on delete cascade not null,
  challenged_id uuid references public.players(id) on delete cascade not null,
  status text check (status in ('pending', 'accepted', 'declined', 'cancelled', 'completed')) default 'pending',
  scheduled_at timestamp with time zone,
  accepted_at timestamp with time zone,
  completed_at timestamp with time zone,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);

create index if not exists challenges_community_idx on public.challenges(community_id);
create index if not exists challenges_players_idx on public.challenges(challenger_id, challenged_id);

alter table public.challenges enable row level security;
create policy "Challenges are viewable by everyone" on public.challenges for select using (true);
