BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "category" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "category_question" (
    "id" bigserial PRIMARY KEY,
    "categoryId" bigint NOT NULL,
    "questionId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "category_questions_index_idx" ON "category_question" USING btree ("categoryId", "questionId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "question" (
    "id" bigserial PRIMARY KEY,
    "content" text NOT NULL,
    "a" text NOT NULL,
    "b" text NOT NULL,
    "c" text NOT NULL,
    "d" text NOT NULL,
    "answer" text NOT NULL,
    "point" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "quiz" (
    "id" bigserial PRIMARY KEY,
    "title" text,
    "description" text,
    "time" bigint,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone,
    "status" text NOT NULL,
    "type" text NOT NULL,
    "user" json
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "quiz_question" (
    "id" bigserial PRIMARY KEY,
    "quizId" bigint NOT NULL,
    "questionId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "quiz_result" (
    "id" bigserial PRIMARY KEY,
    "quiz" json,
    "user" json,
    "correctCount" bigint NOT NULL,
    "wrongCount" bigint NOT NULL,
    "passedCount" bigint NOT NULL,
    "point" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "startedAt" timestamp without time zone NOT NULL,
    "endAt" timestamp without time zone
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "email" text NOT NULL,
    "password" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "category_question"
    ADD CONSTRAINT "category_question_fk_0"
    FOREIGN KEY("categoryId")
    REFERENCES "category"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "category_question"
    ADD CONSTRAINT "category_question_fk_1"
    FOREIGN KEY("questionId")
    REFERENCES "question"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "quiz_question"
    ADD CONSTRAINT "quiz_question_fk_0"
    FOREIGN KEY("quizId")
    REFERENCES "quiz"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "quiz_question"
    ADD CONSTRAINT "quiz_question_fk_1"
    FOREIGN KEY("questionId")
    REFERENCES "question"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR quizvideo
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('quizvideo', '20240608110121782', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240608110121782', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
