-- Fase 1: Esportes, Papéis (Roles) e Dados Específicos por Papel

-- 1. Sports (Melhorado com icon, color, description, display_order)
create table if not exists public.sports (
  id uuid default gen_random_uuid() primary key,
  name text not null,
  slug text not null unique,
  icon text,
  color text,
  description text,
  display_order integer default 0,
  active boolean default true,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

alter table public.sports enable row level security;
create policy "Sports are viewable by everyone" on public.sports for select using (true);

insert into public.sports (name, slug, display_order) values
  ('Tênis', 'tennis', 1),
  ('Beach Tennis', 'beach_tennis', 2),
  ('Padel', 'padel', 3),
  ('Pickleball', 'pickleball', 4),
  ('Futevôlei', 'futevolei', 5),
  ('Xadrez', 'chess', 6),
  ('Sinuca', 'snooker', 7)
on conflict (slug) do nothing;

-- 2. Profile Roles (Múltiplos papéis por usuário)
create table if not exists public.profile_roles (
  id uuid default gen_random_uuid() primary key,
  profile_id uuid references public.profiles(id) on delete cascade not null,
  role text not null check (role in ('ROLE_PLAYER', 'ROLE_ORGANIZER', 'ROLE_CLUB', 'ROLE_ADMIN')),
  active boolean default true,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  unique (profile_id, role)
);

alter table public.profile_roles enable row level security;
create policy "Users can view their own roles" on public.profile_roles for select using (auth.uid() = profile_id);
-- Direct role inserts are intentionally disabled. Use the select_initial_role
-- function from supabase/migrations/011_security_hardening.sql instead.

-- Opcional: Adicionar campos extras na tabela profiles, se necessário (mantendo role por compatibilidade inicial)
alter table public.profiles add column if not exists phone text;

-- 3. Players
create table if not exists public.players (
  id uuid default gen_random_uuid() primary key,
  profile_id uuid references public.profiles(id) on delete cascade not null unique,
  nickname text,
  city text,
  state text,
  country text,
  birth_date date,
  dominant_hand text check (dominant_hand in ('right', 'left', 'ambidextrous')),
  bio text,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);

alter table public.players enable row level security;
create policy "Players are viewable by everyone" on public.players for select using (true);
create policy "Users can insert their player profile" on public.players for insert with check (auth.uid() = profile_id);
create policy "Users can update their player profile" on public.players for update using (auth.uid() = profile_id);

-- 4. Player Sports (Múltiplos esportes por jogador)
create table if not exists public.player_sports (
  id uuid default gen_random_uuid() primary key,
  player_id uuid references public.players(id) on delete cascade not null,
  sport_id uuid references public.sports(id) on delete cascade not null,
  level text,
  is_favorite boolean default false,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null,
  unique(player_id, sport_id)
);

create index if not exists player_sports_player_idx on public.player_sports(player_id);
create index if not exists player_sports_sport_idx on public.player_sports(sport_id);

alter table public.player_sports enable row level security;
create policy "Player sports are viewable by everyone" on public.player_sports for select using (true);
create policy "Users can insert their player sports" on public.player_sports for insert with check (
  auth.uid() = (select profile_id from public.players where id = player_id)
);
create policy "Users can update their player sports" on public.player_sports for update using (
  auth.uid() = (select profile_id from public.players where id = player_id)
);
create policy "Users can delete their player sports" on public.player_sports for delete using (
  auth.uid() = (select profile_id from public.players where id = player_id)
);

-- 5. Organizers
create table if not exists public.organizers (
  id uuid default gen_random_uuid() primary key,
  profile_id uuid references public.profiles(id) on delete cascade not null unique,
  organization_name text,
  document text,
  phone text,
  city text,
  state text,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);

alter table public.organizers enable row level security;
create policy "Organizers are viewable by everyone" on public.organizers for select using (true);
create policy "Users can insert their organizer profile" on public.organizers for insert with check (auth.uid() = profile_id);
create policy "Users can update their organizer profile" on public.organizers for update using (auth.uid() = profile_id);

-- 6. Clubs
create table if not exists public.clubs (
  id uuid default gen_random_uuid() primary key,
  created_by_profile_id uuid references public.profiles(id) on delete set null,
  name text not null,
  slug text unique,
  description text,
  city text,
  state text,
  address text,
  phone text,
  logo_url text,
  active boolean default true,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);

create index if not exists clubs_created_by_idx on public.clubs(created_by_profile_id);

alter table public.clubs enable row level security;
create policy "Clubs are viewable by everyone" on public.clubs for select using (true);
create policy "Users can insert their clubs" on public.clubs for insert with check (auth.uid() = created_by_profile_id);

-- 7. Club Staff (Múltiplos gestores por clube)
create table if not exists public.club_staff (
  id uuid default gen_random_uuid() primary key,
  club_id uuid references public.clubs(id) on delete cascade not null,
  profile_id uuid references public.profiles(id) on delete cascade not null,
  role text not null check (role in ('OWNER', 'ADMIN', 'MANAGER', 'STAFF')),
  active boolean default true,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null,
  unique(club_id, profile_id)
);

create index if not exists club_staff_club_idx on public.club_staff(club_id);
create index if not exists club_staff_profile_idx on public.club_staff(profile_id);

alter table public.club_staff enable row level security;
create policy "Club staff viewable by everyone" on public.club_staff for select using (true);
create policy "Club creators or owners can insert staff" on public.club_staff for insert with check (
  auth.uid() = (select created_by_profile_id from public.clubs where id = club_id) OR
  auth.uid() in (select profile_id from public.club_staff cs where cs.club_id = club_id and cs.role = 'OWNER' and cs.active = true)
);
create policy "Owners can update staff" on public.club_staff for update using (
  auth.uid() in (select profile_id from public.club_staff cs where cs.club_id = club_id and cs.role = 'OWNER' and cs.active = true)
);

-- Policy para clubs (depende de club_staff)
create policy "Owners and admins can update clubs" on public.clubs for update using (
  auth.uid() in (
    select profile_id from public.club_staff where club_id = id and role in ('OWNER', 'ADMIN') and active = true
  )
);

-- 8. Trigger para adicionar criador do clube como OWNER automaticamente
create or replace function public.handle_new_club()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  if new.created_by_profile_id is not null then
    insert into public.club_staff (club_id, profile_id, role, active)
    values (new.id, new.created_by_profile_id, 'OWNER', true);
  end if;
  return new;
end;
$$;

drop trigger if exists on_club_created on public.clubs;
create trigger on_club_created
  after insert on public.clubs
  for each row execute procedure public.handle_new_club();
