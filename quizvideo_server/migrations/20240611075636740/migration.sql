BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "quiz" ALTER COLUMN "createdAt" DROP NOT NULL;
ALTER TABLE "quiz" ALTER COLUMN "status" DROP NOT NULL;
ALTER TABLE "quiz" ALTER COLUMN "type" DROP NOT NULL;

--
-- MIGRATION VERSION FOR quizvideo
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('quizvideo', '20240611075636740', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240611075636740', "timestamp" = now();

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
