# DIAMOND TECH V8 — Vercel + GitHub Edition

This edition is prepared for free public frontend deployment on Vercel from GitHub.

### Build

```bash
npm install
npm run build
```

### Vercel

- Framework: Vite
- Build command: `npm run build`
- Output directory: `dist`
- `vercel.json` is included for SPA routing.

See `docs/VERCEL_GITHUB_DEPLOYMENT.md` for the step-by-step deployment process.

### CMS/API

The Express/PostgreSQL CMS remains in `server/`. It is intentionally not bundled into the public frontend deployment. A hosted API and database can be connected later with `VITE_API_URL`.
