# Prompt Log

## #1 — Project Setup

Create a CLAUDE.md with following:
Stack:
• Html styled with latest tailwind from cdn.
• No nodejs/npm packages or other libraries
• JS (vanilla) only for fetching data, nothing else.
• Supabase backend/db.
Conventions:
• No comments
• Dont refactor unless asked for
• Async/await always
• Use Tailwind utility classes only. Do not create custom CSS unless absolutely necessary.
• Group classes logically:
	1.	Layout
	2.	Spacing
	3.	Typography
	4.	Colors
	5.	Effects
	6.	States
• Mobile first layout
• Create reusable components when possible
• Always save every prompt (including this one) nicely structured in prompts.md to know whats been prompted and how many prompts
• Update this file when you think it's necessary.

Format/rephrase it as you prefer

## #2 — Customer Dashboard Design

Design a customer dashboard based on a reference screenshot (sidebar + metrics cards + content cards layout). Adapted for consulting/staffing data fields:
- Customer, Assignment duration, Price, Margin, Total revenue, Accumulated margin, Hours worked per month, Previous assignments, Skills/Competence

Key decisions:
- Sidebar lists consultants — clicking one shows their individual page
- Summary page shows aggregated data for all consultants
- Single-page app with JS view switching (no page reloads)
- Hardcoded mock data (6 consultants with Swedish company names)
- SVG circular progress rings for margin percentages
- Soft pastel color palette, mobile-first responsive layout

## #3 — Supabase Integration, Auth, CRUD & Contract Status Colors

Implement Supabase connection with secure auth and full CRUD:

**Supabase setup:**
- config.js with SUPABASE_URL and SUPABASE_ANON_KEY placeholders (committed for GitHub Pages)
- Supabase JS v2 from CDN
- Row Level Security (RLS) policies — only authenticated users can read/write
- schema.sql with `consultants` and `previous_assignments` tables + seed data + RLS policies

**Authentication:**
- Email + password login via Supabase Auth
- Login screen shown when not authenticated
- Logout button in sidebar signs out and returns to login
- Session persistence (auto-login if session exists)

**Data model changes:**
- Replaced hardcoded array with Supabase fetch (`consultants` + nested `previous_assignments`)
- Dates stored as proper `date` fields (`start_date`, `end_date`) instead of text strings
- Skills stored as `text[]` array

**Contract end date color coding:**
- 2+ months remaining = green badge + green progress bar
- 1–2 months remaining = yellow badge + yellow bar ("Ending soon")
- Less than 1 month = red badge + red bar ("Ending very soon")
- Past end date = gray badge ("Ended")

**CRUD:**
- Add Consultant form (accessible from top bar button) with all fields
- Delete consultant with confirmation modal (cascade deletes assignments)
- Dashboard and sidebar refresh after add/delete

**UI changes:**
- Replaced "Filters" button with "Add Consultant" button
- Removed non-functional Settings button
- Cards now show start/end dates instead of just start month
- Consultant detail page has Delete button
- Previous assignments show formatted date ranges

## #4 — Swedish Localization, Manual Entry & Empty State Support

Translate all UI texts to Swedish and enable full manual data entry:

**Swedish localization:**
- All buttons, labels, headings, placeholders, error messages, and status badges translated to Swedish
- HTML lang attribute changed from "en" to "sv"
- Login screen: "Logga in", "E-post", "Lösenord"
- Navigation: "Översikt", "Konsulter", "Logga ut"
- Metrics: "Total omsättning", "Snittmarginal", "Aktiva uppdrag", "Timmar denna månad"
- Status badges: "Aktiv", "Avslutas snart", "Avslutas mycket snart", "Avslutat"
- Forms: "Personuppgifter", "Nuvarande uppdrag", "Kompetenser", etc.

**Empty state handling:**
- Dashboard shows friendly empty state with icon when no consultants exist
- Sidebar shows "Inga konsulter ännu" when list is empty
- Consultant detail shows "Inget aktivt uppdrag" when no current assignment
- Previous assignments section shows "Inga tidigare uppdrag" when empty
- All views gracefully handle zero data without errors

**Manual previous assignment entry:**
- Added "Lägg till tidigare uppdrag" form on consultant detail page
- Fields: Kund, Pris (kr/h), Startdatum, Slutdatum, Marginal (%)
- Inserts directly to `previous_assignments` table linked to consultant
- Page refreshes after adding to show new assignment
- Delete button on each previous assignment card for removal

## #5 — Syntax Fix, Logo & Dark Theme

Fix syntax error, add branding logo, and switch to dark theme:

**Syntax error fix:**
- Renamed `const supabase` to `const db` to avoid redeclaring the global `supabase` identifier set by the Supabase CDN library
- Updated all references throughout the codebase (`supabase.from(...)`, `supabase.auth.*`) to use `db`

**Logo:**
- Created `valvet-logo.svg` with orange "V" icon + "alvet" text
- Replaced `<h1>Valvet</h1>` in sidebar with `<img>` logo element
- Added logo to login screen (centered)

**Dark theme:**
- Body background: `bg-gray-950`, text: `text-gray-100`
- Sidebar: `bg-gray-900` with `border-gray-800`
- Cards/panels: `bg-gray-800` with `border-gray-700`
- Inputs: `bg-gray-700` with `border-gray-600`, `text-gray-200`
- Avatar colors: dark-mode opacity variants (`bg-orange-900/40`, etc.)
- Skill badges: dark variants (`bg-purple-900/30`, etc.)
- Status badges: dark backgrounds (`bg-green-900/30`, etc.)
- Progress ring background stroke: `#374151`, text fill: `#F3F4F6`
- Modals: `bg-gray-800` with `border-gray-700`
- Focus rings: `focus:ring-orange-500/50`
- All hover states updated for dark context
