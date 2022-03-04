
-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."games" add column "updated_at" timestamptz
--  not null default now();

alter table "public"."games" alter column "created_at" drop not null;

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."games" add column "created_at" timestamptz
--  null default now();

alter table "public"."users" alter column "deleted_at" set not null;

DROP TABLE "public"."users";
