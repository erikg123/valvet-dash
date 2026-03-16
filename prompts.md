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
