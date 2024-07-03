BEGIN;

--
-- ACTION ALTER TABLE
--
CREATE INDEX "quiz_status_idx" ON "quiz" USING btree ("status");

--
-- MIGRATION VERSION FOR quizvideo
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('quizvideo', '20240612140944541', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240612140944541', "timestamp" = now();

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
