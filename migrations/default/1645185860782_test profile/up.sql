
SET check_function_bodies = false;

CREATE TABLE "public"."profile" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "username" text NOT NULL, PRIMARY KEY ("id") , UNIQUE ("username"));
CREATE EXTENSION IF NOT EXISTS pgcrypto;
