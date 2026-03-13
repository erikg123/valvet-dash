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
