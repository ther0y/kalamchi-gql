
alter table "public"."users" add column "salt" text
 not null default 'lbofd(!*@kcsdcoksdc';

CREATE TABLE "public"."roles" ("name" text NOT NULL, PRIMARY KEY ("name") , UNIQUE ("name"));

alter table "public"."users" add column "role" text
 not null default 'guest';

alter table "public"."users"
  add constraint "users_role_fkey"
  foreign key ("role")
  references "public"."roles"
  ("name") on update restrict on delete restrict;
