CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE IF NOT EXISTS users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(), username TEXT UNIQUE NOT NULL,
  password_hash TEXT NOT NULL, role TEXT NOT NULL DEFAULT 'admin', active BOOLEAN NOT NULL DEFAULT TRUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS site_settings (
  id INTEGER PRIMARY KEY DEFAULT 1 CHECK (id=1), data JSONB NOT NULL DEFAULT '{}'::jsonb,
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS services (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(), title TEXT NOT NULL, slug TEXT UNIQUE NOT NULL,
  description TEXT NOT NULL DEFAULT '', icon TEXT NOT NULL DEFAULT 'code', image_url TEXT,
  features JSONB NOT NULL DEFAULT '[]'::jsonb, sort_order INTEGER NOT NULL DEFAULT 0,
  published BOOLEAN NOT NULL DEFAULT FALSE, created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS projects (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(), title TEXT NOT NULL, slug TEXT UNIQUE NOT NULL,
  category TEXT NOT NULL DEFAULT 'Software', description TEXT NOT NULL DEFAULT '', content TEXT NOT NULL DEFAULT '',
  cover_url TEXT, gallery JSONB NOT NULL DEFAULT '[]'::jsonb, technologies JSONB NOT NULL DEFAULT '[]'::jsonb,
  published BOOLEAN NOT NULL DEFAULT FALSE, sort_order INTEGER NOT NULL DEFAULT 0, created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS testimonials (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(), name TEXT NOT NULL, company TEXT NOT NULL DEFAULT '',
  text TEXT NOT NULL, image_url TEXT, published BOOLEAN NOT NULL DEFAULT FALSE,
  sort_order INTEGER NOT NULL DEFAULT 0, created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS blog_posts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(), title TEXT NOT NULL, slug TEXT UNIQUE NOT NULL,
  excerpt TEXT NOT NULL DEFAULT '', content TEXT NOT NULL DEFAULT '', cover_url TEXT, author TEXT NOT NULL DEFAULT 'Diamond Tech',
  tags JSONB NOT NULL DEFAULT '[]'::jsonb, seo JSONB NOT NULL DEFAULT '{}'::jsonb,
  published BOOLEAN NOT NULL DEFAULT FALSE, published_at TIMESTAMPTZ, created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS media (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(), filename TEXT NOT NULL, original_name TEXT NOT NULL,
  mime_type TEXT NOT NULL, size_bytes BIGINT NOT NULL, url TEXT NOT NULL, media_type TEXT NOT NULL,
  page TEXT NOT NULL DEFAULT 'Home', section TEXT NOT NULL DEFAULT 'Hero', caption TEXT NOT NULL DEFAULT '', alt_text TEXT NOT NULL DEFAULT '',
  published BOOLEAN NOT NULL DEFAULT TRUE, uploaded_by UUID REFERENCES users(id) ON DELETE SET NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS messages (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(), full_name TEXT NOT NULL, email TEXT NOT NULL,
  phone TEXT NOT NULL DEFAULT '', service TEXT NOT NULL DEFAULT '', budget TEXT NOT NULL DEFAULT '', message TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'new', created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(), read_at TIMESTAMPTZ
);
CREATE TABLE IF NOT EXISTS audit_logs (
  id BIGSERIAL PRIMARY KEY, user_id UUID REFERENCES users(id) ON DELETE SET NULL, action TEXT NOT NULL,
  entity TEXT NOT NULL DEFAULT '', entity_id TEXT, details JSONB NOT NULL DEFAULT '{}'::jsonb, ip TEXT, created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE INDEX IF NOT EXISTS idx_services_published ON services(published, sort_order);
CREATE INDEX IF NOT EXISTS idx_projects_published ON projects(published, sort_order);
CREATE INDEX IF NOT EXISTS idx_blog_published ON blog_posts(published, published_at DESC);
CREATE INDEX IF NOT EXISTS idx_messages_status ON messages(status, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_audit_created ON audit_logs(created_at DESC);

CREATE TABLE IF NOT EXISTS site_revisions (id UUID PRIMARY KEY DEFAULT gen_random_uuid(), label TEXT NOT NULL, data JSONB NOT NULL, created_by UUID REFERENCES users(id) ON DELETE SET NULL, created_at TIMESTAMPTZ NOT NULL DEFAULT NOW());
CREATE INDEX IF NOT EXISTS idx_site_revisions_created ON site_revisions(created_at DESC);
