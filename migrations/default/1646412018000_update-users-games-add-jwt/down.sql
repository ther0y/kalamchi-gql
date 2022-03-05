
alter table "public"."users" drop constraint "users_role_fkey";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."users" add column "role" text
--  not null default 'guest';

DROP TABLE "public"."roles";

-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- alter table "public"."users" add column "salt" text
--  not null default 'lbofd(!*@kcsdcoksdc';
