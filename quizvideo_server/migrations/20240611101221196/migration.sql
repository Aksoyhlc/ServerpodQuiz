BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "category_question" DROP CONSTRAINT "category_question_fk_0";
ALTER TABLE "category_question" DROP CONSTRAINT "category_question_fk_1";
ALTER TABLE ONLY "category_question"
    ADD CONSTRAINT "category_question_fk_0"
    FOREIGN KEY("categoryId")
    REFERENCES "category"("id")
    ON DELETE CASCADE
    ON UPDATE CASCADE;
ALTER TABLE ONLY "category_question"
    ADD CONSTRAINT "category_question_fk_1"
    FOREIGN KEY("questionId")
    REFERENCES "question"("id")
    ON DELETE CASCADE
    ON UPDATE CASCADE;

--
-- MIGRATION VERSION FOR quizvideo
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('quizvideo', '20240611101221196', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240611101221196', "timestamp" = now();

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
