
CREATE TABLE "public"."users" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "username" text, "email" text, "phone" text, "is_email_verified" boolean NOT NULL DEFAULT false, "is_phone_verified" boolean NOT NULL DEFAULT false, "password" text, "avatar" text, "created_at" timestamptz DEFAULT now(), "updated_at" timestamptz DEFAULT now(), "deleted_at" timestamptz NOT NULL, PRIMARY KEY ("id") , UNIQUE ("id"), UNIQUE ("username"), UNIQUE ("email"), UNIQUE ("phone"));
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_users_updated_at"
BEFORE UPDATE ON "public"."users"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_users_updated_at" ON "public"."users" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;

alter table "public"."users" alter column "deleted_at" drop not null;

alter table "public"."games" add column "created_at" timestamptz
 null default now();

alter table "public"."games" alter column "created_at" set not null;

alter table "public"."games" add column "updated_at" timestamptz
 not null default now();
