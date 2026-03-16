create table consultants (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  initials text not null,
  current_customer text,
  start_date date,
  end_date date,
  price integer default 0,
  margin integer default 0,
  total_revenue integer default 0,
  accumulated_margin integer default 0,
  hours_per_month integer default 0,
  skills text[] default '{}',
  created_at timestamptz default now()
);

create table previous_assignments (
  id uuid primary key default gen_random_uuid(),
  consultant_id uuid not null references consultants(id) on delete cascade,
  customer text not null,
  start_date date,
  end_date date,
  price integer default 0,
  margin integer default 0,
  created_at timestamptz default now()
);

alter table consultants enable row level security;
alter table previous_assignments enable row level security;

create policy "Authenticated users can read consultants"
  on consultants for select
  to authenticated
  using (true);

create policy "Authenticated users can insert consultants"
  on consultants for insert
  to authenticated
  with check (true);

create policy "Authenticated users can update consultants"
  on consultants for update
  to authenticated
  using (true)
  with check (true);

create policy "Authenticated users can delete consultants"
  on consultants for delete
  to authenticated
  using (true);

create policy "Authenticated users can read previous_assignments"
  on previous_assignments for select
  to authenticated
  using (true);

create policy "Authenticated users can insert previous_assignments"
  on previous_assignments for insert
  to authenticated
  with check (true);

create policy "Authenticated users can update previous_assignments"
  on previous_assignments for update
  to authenticated
  using (true)
  with check (true);

create policy "Authenticated users can delete previous_assignments"
  on previous_assignments for delete
  to authenticated
  using (true);

insert into consultants (name, initials, current_customer, start_date, end_date, price, margin, total_revenue, accumulated_margin, hours_per_month, skills) values
  ('Erik Andersson', 'EA', 'Volvo Group', '2025-01-01', '2025-12-31', 950, 35, 456000, 159600, 160, '{"React","TypeScript","AWS"}'),
  ('Anna Johansson', 'AJ', 'H&M Digital', '2025-03-01', '2026-02-28', 1050, 42, 630000, 264600, 168, '{"Java","Spring Boot","Kubernetes"}'),
  ('Johan Karlsson', 'JK', 'SEB Bank', '2025-09-01', '2026-08-31', 1100, 38, 264000, 100320, 152, '{"Python","Machine Learning","Azure"}'),
  ('Maria Lindberg', 'ML', 'IKEA Digital', '2025-06-01', '2026-05-31', 900, 32, 216000, 69120, 160, '{"UX Design","Figma","CSS"}'),
  ('Oscar Nilsson', 'ON', 'Scania', '2025-02-01', '2026-01-31', 980, 36, 392000, 141120, 144, '{"C#",".NET","SQL Server","DevOps"}'),
  ('Sara Bergström', 'SB', 'Telia', '2025-04-01', '2026-03-31', 1020, 40, 306000, 122400, 160, '{"Go","Microservices","GCP","Terraform"}');

insert into previous_assignments (consultant_id, customer, start_date, end_date, price, margin) values
  ((select id from consultants where initials = 'EA'), 'Spotify', '2024-03-01', '2024-12-31', 850, 30),
  ((select id from consultants where initials = 'EA'), 'Klarna', '2023-06-01', '2024-02-29', 800, 28),
  ((select id from consultants where initials = 'AJ'), 'Ericsson', '2024-01-01', '2025-02-28', 950, 38),
  ((select id from consultants where initials = 'JK'), 'Nordea', '2024-02-01', '2025-08-31', 1000, 34),
  ((select id from consultants where initials = 'JK'), 'Handelsbanken', '2023-05-01', '2024-01-31', 900, 30),
  ((select id from consultants where initials = 'JK'), 'Swedbank', '2022-01-01', '2023-04-30', 850, 27),
  ((select id from consultants where initials = 'ML'), 'Spotify', '2024-08-01', '2025-05-31', 850, 29),
  ((select id from consultants where initials = 'ON'), 'ABB', '2023-03-01', '2025-01-31', 920, 33),
  ((select id from consultants where initials = 'ON'), 'Atlas Copco', '2022-09-01', '2023-02-28', 870, 28),
  ((select id from consultants where initials = 'SB'), 'Tre Sweden', '2024-06-01', '2025-03-31', 950, 35),
  ((select id from consultants where initials = 'SB'), 'Telenor', '2023-01-01', '2024-05-31', 880, 31);
