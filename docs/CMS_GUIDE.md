# Diamond Tech Control Station

## What the CMS controls

- Homepage hero text and image URL
- All page header titles and descriptions
- Founder / CEO profile for Prince Diamond
- Phone and email
- Services: add, edit, publish/unpublish, icon, description, features and image
- Portfolio: projects, case studies, galleries, technologies, cover image and publishing
- Testimonials: client, company, review, photo and publishing
- Blog / News: article, excerpt, content, cover, author, tags and SEO description
- Media Library: image or video upload, page assignment, section assignment, caption, alt text, publish state
- Project enquiry inbox and statuses
- Audit Trail of administrator changes
- Global SEO metadata

## Media workflow

1. Open Media Library.
2. Choose Photo or Video.
3. Select the website Page.
4. Select the Section (Hero, About, Services, Founder, Testimonials, CTA, Gallery, etc.).
5. Add caption and alt text.
6. Choose the file.
7. The server stores it and the public site displays it under the assigned page/section.

## Security

The admin API uses JWT sessions, bcrypt password hashing, protected routes, rate-limited login, input validation, Helmet headers and audit logs. Keep `.env` files private and change the initial administrator password immediately.
