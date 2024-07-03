BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "competition" (
    "id" bigserial PRIMARY KEY,
    "identifier" uuid NOT NULL,
    "user1Id" bigint NOT NULL,
    "user2Id" bigint NOT NULL,
    "type" text NOT NULL,
    "typeId" bigint NOT NULL,
    "createdAt" timestamp without time zone
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "competition"
    ADD CONSTRAINT "competition_fk_0"
    FOREIGN KEY("user1Id")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "competition"
    ADD CONSTRAINT "competition_fk_1"
    FOREIGN KEY("user2Id")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR quizvideo
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('quizvideo', '20240613065203766', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240613065203766', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
