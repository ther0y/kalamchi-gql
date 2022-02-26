
ALTER TABLE "public"."games" ALTER COLUMN "date" TYPE date;

alter table "public"."games" alter column "guess_count" drop not null;

alter table "public"."games" drop constraint "games_pkey";

alter table "public"."games" alter column "id" set not null;
ALTER TABLE "public"."games" ALTER COLUMN "id" drop default;

alter table "public"."games"
    add constraint "games_pkey"
    primary key ("id");

alter table "public"."games" alter column "guess_count" set not null;

DROP TABLE "public"."games";
