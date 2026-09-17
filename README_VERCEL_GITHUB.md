# DIAMOND TECH V9 — Vercel + GitHub Deployment Fix

This package fixes the V8 Vercel build errors reported by Vercel:

- `Property 'env' does not exist on type 'ImportMeta'` — added `src/vite-env.d.ts` with Vite client types.
- `Cannot find name 'data'` in Solutions and Process — both components now receive the `Site` data prop.
- Production API base URL now uses optional `VITE_API_URL`; when it is not set, the frontend uses same-origin `/api` paths instead of `127.0.0.1`.

## Vercel settings

- Framework: Vite
- Build command: `npm run build`
- Output directory: `dist`
- Root directory: repository root

## GitHub

Upload the **contents** of this project to the repository root. `package.json` and `vercel.json` must be directly visible in the repository.

## Free public URL

Set the Vercel project name to `diamondtechsoftwarecompany` if available. The resulting URL will be:

`https://diamondtechsoftwarecompany.vercel.app`

## API / CMS note

The public frontend can build and deploy independently. The existing Express/PostgreSQL CMS API remains a separate backend. Do not put database passwords, JWT secrets, or other private credentials in Vite frontend environment variables.

If the API is hosted separately, set a Vercel environment variable named `VITE_API_URL` to the HTTPS API origin, for example:

`https://api.example.com`

Then redeploy.
