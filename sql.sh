CREATE TABLE "trains" (
"id"  SERIAL ,
"name" VARCHAR ,
PRIMARY KEY ("id")
);

CREATE TABLE "towns" (
"id"  SERIAL ,
"name" VARCHAR ,
PRIMARY KEY ("id")
);

CREATE TABLE "stops" (
"name" VARCHAR ,
"id"  SERIAL ,
"time" TIME ,
"train_id" INTEGER ,
"town_id" INTEGER ,
PRIMARY KEY ("id")
);

ALTER TABLE "stops" ADD FOREIGN KEY ("train_id") REFERENCES "trains" ("id");
ALTER TABLE "stops" ADD FOREIGN KEY ("town_id") REFERENCES "towns" ("id");
