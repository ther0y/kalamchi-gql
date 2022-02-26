
CREATE TABLE "public"."games" ("id" uuid NOT NULL, "round" integer NOT NULL, "word" text NOT NULL, "guess_count" integer NOT NULL DEFAULT 6, "date" date NOT NULL, PRIMARY KEY ("id") , UNIQUE ("round"), UNIQUE ("word"), UNIQUE ("date"));

alter table "public"."games" alter column "guess_count" drop not null;

alter table "public"."games" drop constraint "games_pkey";

alter table "public"."games" alter column "id" set default gen_random_uuid();
alter table "public"."games" alter column "id" drop not null;

alter table "public"."games"
    add constraint "games_pkey"
    primary key ("id");

alter table "public"."games" alter column "guess_count" set not null;

ALTER TABLE "public"."games" ALTER COLUMN "date" TYPE timestamp;
