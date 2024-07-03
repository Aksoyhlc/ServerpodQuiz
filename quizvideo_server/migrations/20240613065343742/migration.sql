BEGIN;

--
-- ACTION ALTER TABLE
--
CREATE INDEX "competition_identifier_idx" ON "competition" USING btree ("identifier");

--
-- MIGRATION VERSION FOR quizvideo
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('quizvideo', '20240613065343742', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240613065343742', "timestamp" = now();

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
