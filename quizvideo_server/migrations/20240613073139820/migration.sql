BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "online_user" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "online_user" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "type" text NOT NULL,
    "typeId" bigint NOT NULL,
    "createdAt" timestamp without time zone
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "online_user"
    ADD CONSTRAINT "online_user_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE CASCADE
    ON UPDATE CASCADE;


--
-- MIGRATION VERSION FOR quizvideo
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('quizvideo', '20240613073139820', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240613073139820', "timestamp" = now();

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
