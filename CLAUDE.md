# Valvet Dash

## Stack

- **HTML** styled with the latest Tailwind CSS via CDN
- **Vanilla JS** — used only for data fetching (no frameworks, no npm)
- **Supabase** — backend and database
- No Node.js, npm, or third-party libraries

## Conventions

### Code Style

- No comments in code
- Always use `async`/`await` (never raw Promises or callbacks)
- Do not refactor existing code unless explicitly asked

### Tailwind CSS

- Use utility classes only — no custom CSS unless absolutely necessary
- Group classes in this order:
  1. Layout (`flex`, `grid`, `relative`, `block`, etc.)
  2. Spacing (`p-`, `m-`, `gap-`, etc.)
  3. Typography (`text-`, `font-`, `leading-`, etc.)
  4. Colors (`bg-`, `text-`, `border-`, etc.)
  5. Effects (`shadow-`, `opacity-`, `rounded-`, etc.)
  6. States (`hover:`, `focus:`, `active:`, etc.)

### Design

- Mobile-first layout (base styles for mobile, use `sm:`, `md:`, `lg:` for larger screens)
- Create reusable components when possible

### Prompt Log

- Save every prompt (structured) to `prompts.md`
- Update `CLAUDE.md` when conventions or stack decisions change
