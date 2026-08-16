-- Fase 4: Conquistas, Auditoria, Plataforma e Monetização Expandida

-- 1. Notifications
create table if not exists public.notifications (
  id uuid default gen_random_uuid() primary key,
  profile_id uuid references public.profiles(id) on delete cascade not null,
  title text not null,
  message text not null,
  type text,
  read boolean default false,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

create index if not exists notifications_profile_idx on public.notifications(profile_id);

alter table public.notifications enable row level security;
create policy "Users can view their notifications" on public.notifications for select using (auth.uid() = profile_id);

-- 2. Sponsors
create table if not exists public.sponsors (
  id uuid default gen_random_uuid() primary key,
  name text not null,
  logo_url text,
  website_url text,
  active boolean default true,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

alter table public.sponsors enable row level security;
create policy "Sponsors are viewable by everyone" on public.sponsors for select using (true);

-- 3. Achievements
create table if not exists public.achievements (
  id uuid default gen_random_uuid() primary key,
  name text not null,
  slug text unique not null,
  description text,
  icon text,
  sport_id uuid references public.sports(id) on delete set null,
  active boolean default true,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

alter table public.achievements enable row level security;
create policy "Achievements are viewable by everyone" on public.achievements for select using (true);

-- 4. Player Achievements
create table if not exists public.player_achievements (
  id uuid default gen_random_uuid() primary key,
  player_id uuid references public.players(id) on delete cascade not null,
  achievement_id uuid references public.achievements(id) on delete cascade not null,
  earned_at timestamp with time zone default timezone('utc'::text, now()) not null,
  unique(player_id, achievement_id)
);

create index if not exists player_achievements_player_idx on public.player_achievements(player_id);

alter table public.player_achievements enable row level security;
create policy "Player achievements are viewable by everyone" on public.player_achievements for select using (true);

-- 5. Plans
create table if not exists public.plans (
  id uuid default gen_random_uuid() primary key,
  name text not null,
  slug text unique not null,
  price numeric(10, 2) not null,
  billing_cycle text check (billing_cycle in ('monthly', 'yearly', 'lifetime')),
  active boolean default true,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

alter table public.plans enable row level security;
create policy "Plans are viewable by everyone" on public.plans for select using (true);

insert into public.plans (name, slug, price, billing_cycle) values
  ('Gratuito', 'free', 0.00, 'monthly'),
  ('Pro Clube', 'pro_club', 99.90, 'monthly'),
  ('Pro Organizador', 'pro_organizer', 149.90, 'monthly')
on conflict (slug) do nothing;

-- 6. Plan Limits (Expandido)
create table if not exists public.plan_limits (
  id uuid default gen_random_uuid() primary key,
  plan_id uuid references public.plans(id) on delete cascade not null unique,
  max_players integer,
  max_clubs integer,
  max_communities integer,
  max_active_tournaments integer,
  max_matches_per_month integer,
  max_admins integer,
  max_sponsors integer,
  has_reports boolean default false,
  has_custom_branding boolean default false,
  has_priority_support boolean default false,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

alter table public.plan_limits enable row level security;
create policy "Plan limits are viewable by everyone" on public.plan_limits for select using (true);

-- 7. Subscriptions
create table if not exists public.subscriptions (
  id uuid default gen_random_uuid() primary key,
  profile_id uuid references public.profiles(id) on delete cascade not null,
  club_id uuid references public.clubs(id) on delete set null,
  plan_id uuid references public.plans(id) on delete restrict not null,
  status text check (status in ('active', 'trialing', 'past_due', 'cancelled', 'expired')) default 'active',
  starts_at timestamp with time zone default timezone('utc'::text, now()),
  ends_at timestamp with time zone,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);

create index if not exists subscriptions_profile_idx on public.subscriptions(profile_id);

alter table public.subscriptions enable row level security;
create policy "Users can view their subscriptions" on public.subscriptions for select using (auth.uid() = profile_id);

-- 8. Audit Logs
create table if not exists public.audit_logs (
  id uuid default gen_random_uuid() primary key,
  actor_profile_id uuid references public.profiles(id) on delete set null,
  action text not null,
  entity_type text not null,
  entity_id uuid not null,
  metadata jsonb default '{}'::jsonb,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

create index if not exists audit_logs_actor_idx on public.audit_logs(actor_profile_id);
create index if not exists audit_logs_entity_idx on public.audit_logs(entity_type, entity_id);

alter table public.audit_logs enable row level security;
create policy "Audit logs are viewable by admins" on public.audit_logs for select using (
  auth.uid() in (select profile_id from public.profile_roles where role = 'ROLE_ADMIN')
);
