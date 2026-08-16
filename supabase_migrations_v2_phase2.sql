-- Fase 2: Comunidades, Temporadas, Rankings e Estatísticas

-- 1. Communities (Com visibilidade)
create table if not exists public.communities (
  id uuid default gen_random_uuid() primary key,
  club_id uuid references public.clubs(id) on delete set null,
  owner_profile_id uuid references public.profiles(id) on delete cascade not null,
  sport_id uuid references public.sports(id) not null,
  name text not null,
  slug text unique,
  description text,
  city text,
  state text,
  visibility text check (visibility in ('PUBLIC', 'PRIVATE', 'INVITE_ONLY')) default 'PUBLIC',
  active boolean default true,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);

create index if not exists communities_owner_idx on public.communities(owner_profile_id);
create index if not exists communities_club_idx on public.communities(club_id);
create index if not exists communities_sport_idx on public.communities(sport_id);

alter table public.communities enable row level security;
create policy "Public communities are viewable by everyone" on public.communities for select using (visibility = 'PUBLIC' and active = true);
create policy "Owners can view their own communities" on public.communities for select using (auth.uid() = owner_profile_id);
create policy "Club staff can view communities" on public.communities for select using (
  club_id is not null and auth.uid() in (
    select profile_id from public.club_staff where club_id = public.communities.club_id and active = true
  )
);
create policy "Users can insert their communities" on public.communities for insert with check (auth.uid() = owner_profile_id);
create policy "Owners and club admins can update communities" on public.communities for update using (
  auth.uid() = owner_profile_id or (
    club_id is not null and auth.uid() in (
      select profile_id from public.club_staff where club_id = public.communities.club_id and role in ('OWNER', 'ADMIN') and active = true
    )
  )
);

-- 2. Community Members (Com papéis)
create table if not exists public.community_members (
  id uuid default gen_random_uuid() primary key,
  community_id uuid references public.communities(id) on delete cascade not null,
  player_id uuid references public.players(id) on delete cascade not null,
  role text check (role in ('MEMBER', 'MODERATOR', 'ADMIN')) default 'MEMBER',
  status text check (status in ('pending', 'active', 'suspended', 'removed')) default 'pending',
  joined_at timestamp with time zone,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  unique (community_id, player_id)
);

create index if not exists community_members_community_idx on public.community_members(community_id);
create index if not exists community_members_player_idx on public.community_members(player_id);

alter table public.community_members enable row level security;
create policy "Active members can view other members" on public.community_members for select using (
  auth.uid() in (
    select p.profile_id from public.players p
    join public.community_members cm on cm.player_id = p.id
    where cm.community_id = public.community_members.community_id and cm.status = 'active'
  )
);
create policy "Community owners can view members" on public.community_members for select using (
  auth.uid() = (select owner_profile_id from public.communities where id = community_id)
);
create policy "Players can apply for membership" on public.community_members for insert with check (
  auth.uid() = (select profile_id from public.players where id = player_id)
);
create policy "Community owners and admins can update members" on public.community_members for update using (
  auth.uid() = (select owner_profile_id from public.communities where id = community_id) or
  auth.uid() in (
    select p.profile_id from public.players p
    join public.community_members cm on cm.player_id = p.id
    where cm.community_id = public.community_members.community_id and cm.role in ('ADMIN', 'MODERATOR') and cm.status = 'active'
  )
);

-- 3. Seasons
create table if not exists public.seasons (
  id uuid default gen_random_uuid() primary key,
  community_id uuid references public.communities(id) on delete cascade not null,
  sport_id uuid references public.sports(id) not null,
  name text not null,
  starts_at timestamp with time zone,
  ends_at timestamp with time zone,
  status text check (status in ('draft', 'active', 'finished', 'cancelled')) default 'draft',
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);

create index if not exists seasons_community_idx on public.seasons(community_id);

alter table public.seasons enable row level security;
create policy "Seasons of public communities are viewable by everyone" on public.seasons for select using (
  exists (select 1 from public.communities where id = community_id and visibility = 'PUBLIC')
);
create policy "Community owners and admins can insert seasons" on public.seasons for insert with check (
  auth.uid() = (select owner_profile_id from public.communities where id = community_id) or
  auth.uid() in (
    select p.profile_id from public.players p
    join public.community_members cm on cm.player_id = p.id
    where cm.community_id = public.seasons.community_id and cm.role in ('ADMIN') and cm.status = 'active'
  )
);
create policy "Community owners and admins can update seasons" on public.seasons for update using (
  auth.uid() = (select owner_profile_id from public.communities where id = community_id) or
  auth.uid() in (
    select p.profile_id from public.players p
    join public.community_members cm on cm.player_id = p.id
    where cm.community_id = public.seasons.community_id and cm.role in ('ADMIN') and cm.status = 'active'
  )
);

-- 4. Rankings (Tipado)
create table if not exists public.rankings (
  id uuid default gen_random_uuid() primary key,
  season_id uuid references public.seasons(id) on delete cascade not null,
  player_id uuid references public.players(id) on delete cascade not null,
  ranking_type text check (ranking_type in ('GLOBAL', 'LOCAL', 'CLUB', 'COMMUNITY')) default 'COMMUNITY',
  points integer default 0,
  wins integer default 0,
  losses integer default 0,
  draws integer default 0,
  matches_played integer default 0,
  position integer,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null,
  unique (season_id, player_id)
);

create index if not exists rankings_season_idx on public.rankings(season_id);
create index if not exists rankings_player_idx on public.rankings(player_id);

alter table public.rankings enable row level security;
create policy "Rankings of public communities are viewable by everyone" on public.rankings for select using (
  exists (
    select 1 from public.seasons s
    join public.communities c on c.id = s.community_id
    where s.id = season_id and c.visibility = 'PUBLIC'
  )
);
create policy "Players can view their own rankings" on public.rankings for select using (
  auth.uid() = (select profile_id from public.players where id = player_id)
);
create policy "Community owners and admins can insert rankings" on public.rankings for insert with check (
  exists (
    select 1 from public.seasons s
    where s.id = season_id and (
      auth.uid() = (select owner_profile_id from public.communities where id = s.community_id) or
      auth.uid() in (
        select p.profile_id from public.players p
        join public.community_members cm on cm.player_id = p.id
        where cm.community_id = s.community_id and cm.role in ('ADMIN') and cm.status = 'active'
      )
    )
  )
);
create policy "Community owners and admins can update rankings" on public.rankings for update using (
  exists (
    select 1 from public.seasons s
    where s.id = season_id and (
      auth.uid() = (select owner_profile_id from public.communities where id = s.community_id) or
      auth.uid() in (
        select p.profile_id from public.players p
        join public.community_members cm on cm.player_id = p.id
        where cm.community_id = s.community_id and cm.role in ('ADMIN') and cm.status = 'active'
      )
    )
  )
);

-- 5. Ranking History
create table if not exists public.ranking_history (
  id uuid default gen_random_uuid() primary key,
  ranking_id uuid references public.rankings(id) on delete cascade not null,
  player_id uuid references public.players(id) on delete cascade not null,
  season_id uuid references public.seasons(id) on delete cascade not null,
  previous_position integer,
  new_position integer,
  previous_points integer,
  new_points integer,
  change_reason text,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

create index if not exists ranking_history_ranking_idx on public.ranking_history(ranking_id);
create index if not exists ranking_history_player_idx on public.ranking_history(player_id);

alter table public.ranking_history enable row level security;
create policy "Ranking history of public communities are viewable by everyone" on public.ranking_history for select using (
  exists (
    select 1 from public.seasons s
    join public.communities c on c.id = s.community_id
    where s.id = season_id and c.visibility = 'PUBLIC'
  )
);
create policy "Community owners and admins can insert ranking history" on public.ranking_history for insert with check (
  exists (
    select 1 from public.seasons s
    where s.id = season_id and (
      auth.uid() = (select owner_profile_id from public.communities where id = s.community_id) or
      auth.uid() in (
        select p.profile_id from public.players p
        join public.community_members cm on cm.player_id = p.id
        where cm.community_id = s.community_id and cm.role in ('ADMIN') and cm.status = 'active'
      )
    )
  )
);

-- 6. Player Statistics (Geral)
create table if not exists public.player_statistics (
  id uuid default gen_random_uuid() primary key,
  player_id uuid references public.players(id) on delete cascade not null,
  sport_id uuid references public.sports(id) on delete cascade not null,
  matches_played integer default 0,
  wins integer default 0,
  losses integer default 0,
  draws integer default 0,
  win_rate numeric(5, 2) default 0.00,
  current_streak integer default 0,
  longest_streak integer default 0,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null,
  unique (player_id, sport_id)
);

create index if not exists player_stats_player_idx on public.player_statistics(player_id);
create index if not exists player_stats_sport_idx on public.player_statistics(sport_id);

alter table public.player_statistics enable row level security;
create policy "Player stats are viewable by everyone" on public.player_statistics for select using (true);
create policy "Players can view their own stats" on public.player_statistics for select using (
  auth.uid() = (select profile_id from public.players where id = player_id)
);

-- Nota: Em produção, as estatísticas devem ser atualizadas exclusivamente por funções/triggers do servidor ou pelo admin.
-- Por enquanto, para facilitar o desenvolvimento, permitimos que o próprio jogador insira/atualize.
create policy "Players can insert their own stats for dev purposes" on public.player_statistics for insert with check (
  auth.uid() = (select profile_id from public.players where id = player_id)
);
create policy "Players can update their own stats for dev purposes" on public.player_statistics for update using (
  auth.uid() = (select profile_id from public.players where id = player_id)
);
