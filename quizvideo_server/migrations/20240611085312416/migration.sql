BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "quiz_question" DROP CONSTRAINT "quiz_question_fk_0";
ALTER TABLE "quiz_question" DROP CONSTRAINT "quiz_question_fk_1";
ALTER TABLE ONLY "quiz_question"
    ADD CONSTRAINT "quiz_question_fk_0"
    FOREIGN KEY("quizId")
    REFERENCES "quiz"("id")
    ON DELETE CASCADE
    ON UPDATE CASCADE;
ALTER TABLE ONLY "quiz_question"
    ADD CONSTRAINT "quiz_question_fk_1"
    FOREIGN KEY("questionId")
    REFERENCES "question"("id")
    ON DELETE CASCADE
    ON UPDATE CASCADE;

--
-- MIGRATION VERSION FOR quizvideo
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('quizvideo', '20240611085312416', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240611085312416', "timestamp" = now();

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
