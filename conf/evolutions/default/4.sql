# --- !Ups

CREATE TABLE "STATUSES" (
    "ID" SERIAL NOT NULL PRIMARY KEY,
    "USER_ID" INTEGER NOT NULL REFERENCES "USERS" ("ID"),
    "TEXT" VARCHAR NOT NULL,
    "CREATED_AT" TIMESTAMP NOT NULL,
    "UPDATED_AT" TIMESTAMP NOT NULL
);

--LIKEを使う場合前方一致検索のみでしかインデックスが有効にならないので、"TEXT"にインデックスはつけない

--一覧表示する場合、日付順に並び替えるためインデックスをつける
CREATE INDEX "STATUSES_CREATED_AT_INDEX" ON "STATUSES" ("CREATED_AT");

CREATE TRIGGER UPDATE_TRIGGER BEFORE UPDATE ON "STATUSES" FOR EACH ROW
EXECUTE PROCEDURE SET_UPDATE_TIME();

CREATE TRIGGER CREATE_TRIGGER BEFORE INSERT ON "STATUSES" FOR EACH ROW
EXECUTE PROCEDURE SET_CREATE_TIME();