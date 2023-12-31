﻿CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

START TRANSACTION;


DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231003171235_AddBookToDb') THEN
    CREATE TABLE "Books" (
        "IdBook" integer GENERATED BY DEFAULT AS IDENTITY,
        "Title" text NOT NULL,
        "ISBN" text NOT NULL,
        "Price" double precision NOT NULL,
        CONSTRAINT "PK_Books" PRIMARY KEY ("IdBook")
    );
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231003171235_AddBookToDb') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20231003171235_AddBookToDb', '8.0.0-rc.1.23419.6');
    END IF;
END $EF$;
COMMIT;

START TRANSACTION;


DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231003173346_AddTwoPropsToBook') THEN
    ALTER TABLE "Books" ADD "Author" text NOT NULL DEFAULT '';
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231003173346_AddTwoPropsToBook') THEN
    ALTER TABLE "Books" ADD "PageCount" integer NOT NULL DEFAULT 0;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231003173346_AddTwoPropsToBook') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20231003173346_AddTwoPropsToBook', '8.0.0-rc.1.23419.6');
    END IF;
END $EF$;
COMMIT;

START TRANSACTION;


DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231003193547_AddGenresTableToDb') THEN
    ALTER TABLE "Books" RENAME COLUMN "PageCount" TO page_count;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231003193547_AddGenresTableToDb') THEN
    ALTER TABLE "Books" ALTER COLUMN "Price" TYPE numeric(10,5);
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231003193547_AddGenresTableToDb') THEN
    CREATE TABLE "Genres" (
        "GenreId" integer GENERATED BY DEFAULT AS IDENTITY,
        "GenreName" text NOT NULL,
        "Display" integer NOT NULL,
        CONSTRAINT "PK_Genres" PRIMARY KEY ("GenreId")
    );
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231003193547_AddGenresTableToDb') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20231003193547_AddGenresTableToDb', '8.0.0-rc.1.23419.6');
    END IF;
END $EF$;
COMMIT;

