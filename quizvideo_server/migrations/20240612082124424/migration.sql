BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "quiz_result" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "quiz_result" (
    "id" bigserial PRIMARY KEY,
    "typeId" bigint NOT NULL,
    "userId" bigint,
    "correctCount" bigint NOT NULL,
    "wrongCount" bigint NOT NULL,
    "passedCount" bigint NOT NULL,
    "point" bigint NOT NULL,
    "createdAt" timestamp without time zone,
    "startedAt" timestamp without time zone,
    "endAt" timestamp without time zone
);


--
-- MIGRATION VERSION FOR quizvideo
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('quizvideo', '20240612082124424', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240612082124424', "timestamp" = now();

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
