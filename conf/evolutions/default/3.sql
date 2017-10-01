# --- !Ups
CREATE TABLE "USERS"(
    "ID" SERIAL NOT NULL PRIMARY KEY,
    "MAIL" VARCHAR NOT NULL,
    "PASSWORD" VARCHAR NOT NULL,
    "NAME" VARCHAR NOT NULL,
    "CREATED_AT" TIMESTAMP NOT NULL,
    "UPDATED_AT" TIMESTAMP NOT NULL
);

CREATE UNIQUE INDEX USERS_MAIL_UNIQUE_INDEX ON "USERS" ("MAIL");
CREATE INDEX USERS_PASSWORD_INDEX ON "USERS" ("PASSWORD");

CREATE TRIGGER UPDATE_TRIGGER BEFORE UPDATE ON "USERS" FOR EACH ROW
EXECUTE PROCEDURE SET_UPDATE_TIME();

CREATE TRIGGER CREATE_TRIGGER BEFORE INSERT ON "USERS" FOR EACH ROW
EXECUTE PROCEDURE SET_CREATE_TIME();






