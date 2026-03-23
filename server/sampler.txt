# compose.base.yml
services:
  api:
    networks:
      - stocky-net
    depends_on:
      postgres: # Wait for the database to be healthy
        condition: service_healthy

  postgres:
    image: postgres:16-alpine
    restart: unless-stopped
    networks:
      - stocky-net
    volumes:
      - stocky-data:/var/lib/postgresql/data
    healthcheck: # Use pg_isready to check if the database is ready
      test: ["CMD-SHELL", "pg_isready -U $$POSTGRES_USER -d $$POSTGRES_DB"]
      interval: 10s
      timeout: 5s
      retries: 5
      start_period: 15s


# compose.dev.yml
services:
  api:
    build:
      context: .
      target: development
      dockerfile: dockerfile
    extends:
      service: api
      file: compose.base.yml
    container_name: stocky-dev
    restart: unless-stopped
    env_file: .env.dev
    ports:
      - "3000:3000"
    develop:
      watch:
        # Sync source code changes
        - action: sync
          path: ./source
          target: /usr/src/app/source
        # Rebuild when Prisma models change
        - action: rebuild
          path: ./prisma
        # Sync package.json for dependency tracking
        - action: sync
          path: ./package.json
          target: /usr/src/app/package.json
        # Rebuild when dependencies change
        - action: rebuild
          path: ./bun.lock

  postgres:
    extends:
      service: postgres
      file: compose.base.yml
    container_name: postgres-dev
    restart: unless-stopped
    env_file: .env.dev
    ports:
      - "5432:5432"


# compose.prod.yml
services:
  api:
    build:
      context: .
      target: production
      dockerfile: dockerfile
    extends:
      service: api
      file: compose.base.yml
    container_name: stocky-prod
    restart: unless-stopped
    env_file: .env.prod
    healthcheck: # Use curl to check if the application is healthy
      test: ["CMD", "curl", "-f", "http://localhost:3000/health"]
      interval: 10s
      timeout: 5s
      retries: 5
      start_period: 15s
  
  postgres:
    extends:
      service: postgres
      file: compose.base.yml
    container_name: postgres-prod
    restart: unless-stopped
    env_file: .env.prod


# RLS in Postgres
-- Enable Row Level Security
ALTER TABLE "stocky"."users" ENABLE ROW LEVEL SECURITY;

-- Tenant Isolation Policy
CREATE POLICY "tenant_isolation" ON "stocky"."users"
    FOR ALL
    USING ("tenantId" = current_setting('app.current_tenant')::INTEGER)
    WITH CHECK ("tenantId" = current_setting('app.current_tenant')::INTEGER);
