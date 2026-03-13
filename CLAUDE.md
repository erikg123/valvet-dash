# CLAUDE.md

## Stack

- HTML with Tailwind CSS via CDN (latest version)
- Vanilla JavaScript for data fetching only
- Supabase for backend and database
- No Node.js, npm, or third-party libraries

## Conventions

### Code Style

- No comments in code
- Do not refactor unless explicitly asked
- Always use async/await for asynchronous operations

### Tailwind CSS

- Use utility classes only — no custom CSS unless absolutely necessary
- Group classes in this order:
  1. Layout (flex, grid, position)
  2. Spacing (margin, padding)
  3. Typography (font, text)
  4. Colors (bg, text color, border color)
  5. Effects (shadow, opacity, transitions)
  6. States (hover, focus, responsive)
- Mobile-first approach for all layouts

### Components

- Extract reusable components when patterns repeat

### Prompt Log

- Save every prompt to `prompts.md` with a number and clear structure
- Update this file when conventions evolve
