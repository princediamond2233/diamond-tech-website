# Diamond Tech V8 — GitHub + Vercel Free Deployment

## What this package deploys

This package is prepared to deploy the **public React/Vite website** to Vercel from GitHub.

Vercel builds the frontend with `npm run build` and publishes the generated `dist` directory.
The included `vercel.json` also rewrites client-side routes to `index.html` so direct links work.

## Important CMS note

The V8 project contains a separate Express + PostgreSQL CMS API. The public frontend can be deployed to Vercel without the API and will use its built-in/default content when the API is unavailable.

The CMS login, database editing, media uploads and contact-message storage require the Express API and PostgreSQL to be hosted separately (or adapted to a suitable serverless/database architecture). Do **not** put database passwords or JWT secrets in the Vercel frontend.

## GitHub

1. Create a new GitHub repository, for example `diamond-tech-website`.
2. Upload the contents of this folder to the repository root. Do not upload the ZIP itself as the only file.
3. Make the repository public if you want to use free GitHub features without private-repository limits.

## Vercel

1. Sign in to Vercel with GitHub.
2. Select **Add New → Project**.
3. Import the `diamond-tech-website` repository.
4. Framework Preset: **Vite**.
5. Build Command: `npm run build`.
6. Output Directory: `dist`.
7. Do not add `VITE_API_URL` unless a real hosted API has been configured.
8. Click **Deploy**.

Vercel will create a free `vercel.app` deployment URL. You can rename the Vercel project to a company-style name where the requested name is available.

## Updating the website

After the first deployment, Vercel can automatically create new deployments when changes are pushed to the connected GitHub repository.

## Suggested free public URL

Try the Vercel project name:

`diamondtechsoftwarecompany`

which should produce a URL in the form:

`https://diamondtechsoftwarecompany.vercel.app`

The exact subdomain is subject to Vercel name availability.
