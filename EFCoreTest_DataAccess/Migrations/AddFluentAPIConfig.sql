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

START TRANSACTION;


DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231003195837_RenameDisplayColumninGenre') THEN
    ALTER TABLE "Genres" RENAME COLUMN "Display" TO "DisplayOrder";
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231003195837_RenameDisplayColumninGenre') THEN
    ALTER TABLE "Genres" ALTER COLUMN "GenreName" DROP NOT NULL;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231003195837_RenameDisplayColumninGenre') THEN
    ALTER TABLE "Books" ALTER COLUMN "Title" DROP NOT NULL;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231003195837_RenameDisplayColumninGenre') THEN
    ALTER TABLE "Books" ALTER COLUMN "ISBN" DROP NOT NULL;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231003195837_RenameDisplayColumninGenre') THEN
    ALTER TABLE "Books" ALTER COLUMN "Author" DROP NOT NULL;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231003195837_RenameDisplayColumninGenre') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20231003195837_RenameDisplayColumninGenre', '8.0.0-rc.1.23419.6');
    END IF;
END $EF$;
COMMIT;

START TRANSACTION;


DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231004154530_RenamedGenreToCategory') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20231004154530_RenamedGenreToCategory', '8.0.0-rc.1.23419.6');
    END IF;
END $EF$;
COMMIT;

START TRANSACTION;


DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231004160236_AddAuthorPublisherSubcatgory') THEN
    ALTER TABLE "Genres" DROP CONSTRAINT "PK_Genres";
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231004160236_AddAuthorPublisherSubcatgory') THEN
    ALTER TABLE "Genres" DROP COLUMN "GenreName";
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231004160236_AddAuthorPublisherSubcatgory') THEN
    ALTER TABLE "Genres" RENAME TO "Categories";
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231004160236_AddAuthorPublisherSubcatgory') THEN
    ALTER TABLE "Categories" RENAME COLUMN "GenreId" TO "CategoryId";
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231004160236_AddAuthorPublisherSubcatgory') THEN
    ALTER TABLE "Categories" ADD "Name" text NOT NULL DEFAULT '';
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231004160236_AddAuthorPublisherSubcatgory') THEN
    ALTER TABLE "Categories" ADD CONSTRAINT "PK_Categories" PRIMARY KEY ("CategoryId");
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231004160236_AddAuthorPublisherSubcatgory') THEN
    CREATE TABLE "Authors" (
        "Author_Id" integer GENERATED BY DEFAULT AS IDENTITY,
        "FirstName" character varying(50) NOT NULL,
        "LastName" text NOT NULL,
        "BirthDate" timestamp with time zone NOT NULL,
        "Location" text,
        CONSTRAINT "PK_Authors" PRIMARY KEY ("Author_Id")
    );
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231004160236_AddAuthorPublisherSubcatgory') THEN
    CREATE TABLE "Publishers" (
        "Publisher_Id" integer GENERATED BY DEFAULT AS IDENTITY,
        "Name" text NOT NULL,
        "Location" text,
        CONSTRAINT "PK_Publishers" PRIMARY KEY ("Publisher_Id")
    );
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231004160236_AddAuthorPublisherSubcatgory') THEN
    CREATE TABLE "subCategories" (
        "SubCategory_Id" integer GENERATED BY DEFAULT AS IDENTITY,
        "Name" character varying(50) NOT NULL,
        CONSTRAINT "PK_subCategories" PRIMARY KEY ("SubCategory_Id")
    );
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231004160236_AddAuthorPublisherSubcatgory') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20231004160236_AddAuthorPublisherSubcatgory', '8.0.0-rc.1.23419.6');
    END IF;
END $EF$;
COMMIT;

START TRANSACTION;


DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231004173930_AddRelationshipsBetweenTables') THEN
    ALTER TABLE "Books" DROP COLUMN "Author";
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231004173930_AddRelationshipsBetweenTables') THEN
    ALTER TABLE "Books" DROP COLUMN page_count;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231004173930_AddRelationshipsBetweenTables') THEN
    CREATE TABLE "BookDetails" (
        "BookDetail_Id" integer GENERATED BY DEFAULT AS IDENTITY,
        "NumberOfChapters" integer NOT NULL,
        "NumberOfPages" integer NOT NULL,
        "Weight" text,
        CONSTRAINT "PK_BookDetails" PRIMARY KEY ("BookDetail_Id")
    );
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231004173930_AddRelationshipsBetweenTables') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20231004173930_AddRelationshipsBetweenTables', '8.0.0-rc.1.23419.6');
    END IF;
END $EF$;
COMMIT;

START TRANSACTION;


DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231006190214_AddingFluentAPIConfigurations') THEN
    ALTER TABLE "Books" DROP CONSTRAINT "PK_Books";
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231006190214_AddingFluentAPIConfigurations') THEN
    ALTER TABLE "Books" RENAME COLUMN "IdBook" TO "Publisher_id";
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231006190214_AddingFluentAPIConfigurations') THEN
    ALTER TABLE "Books" ALTER COLUMN "Publisher_id" DROP IDENTITY;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231006190214_AddingFluentAPIConfigurations') THEN
    ALTER TABLE "Books" ADD "BookId" integer GENERATED BY DEFAULT AS IDENTITY;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231006190214_AddingFluentAPIConfigurations') THEN
    ALTER TABLE "BookDetails" ADD "Book_Id" integer NOT NULL DEFAULT 0;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231006190214_AddingFluentAPIConfigurations') THEN
    ALTER TABLE "Books" ADD CONSTRAINT "PK_Books" PRIMARY KEY ("BookId");
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231006190214_AddingFluentAPIConfigurations') THEN
    CREATE TABLE "AuthorBook" (
        "AuthorsAuthor_Id" integer NOT NULL,
        "BooksBookId" integer NOT NULL,
        CONSTRAINT "PK_AuthorBook" PRIMARY KEY ("AuthorsAuthor_Id", "BooksBookId"),
        CONSTRAINT "FK_AuthorBook_Authors_AuthorsAuthor_Id" FOREIGN KEY ("AuthorsAuthor_Id") REFERENCES "Authors" ("Author_Id") ON DELETE CASCADE,
        CONSTRAINT "FK_AuthorBook_Books_BooksBookId" FOREIGN KEY ("BooksBookId") REFERENCES "Books" ("BookId") ON DELETE CASCADE
    );
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231006190214_AddingFluentAPIConfigurations') THEN
    INSERT INTO "Publishers" ("Publisher_Id", "Location", "Name")
    VALUES (1, 'Chicago', 'Pub 1 Jimmy');
    INSERT INTO "Publishers" ("Publisher_Id", "Location", "Name")
    VALUES (2, 'New York', 'Pub 2 John');
    INSERT INTO "Publishers" ("Publisher_Id", "Location", "Name")
    VALUES (3, 'Hawaii', 'Pub 3 Ben');
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231006190214_AddingFluentAPIConfigurations') THEN
    INSERT INTO "Books" ("BookId", "ISBN", "Price", "Publisher_id", "Title")
    VALUES (1, '123B12', 10.99, 1, 'Spider without Duty');
    INSERT INTO "Books" ("BookId", "ISBN", "Price", "Publisher_id", "Title")
    VALUES (2, '12123B12', 11.99, 1, 'Fortune of Time');
    INSERT INTO "Books" ("BookId", "ISBN", "Price", "Publisher_id", "Title")
    VALUES (3, '77652', 20.99, 2, 'Fake Sunday');
    INSERT INTO "Books" ("BookId", "ISBN", "Price", "Publisher_id", "Title")
    VALUES (4, 'CC12B12', 25.99, 3, 'Cookie Jar');
    INSERT INTO "Books" ("BookId", "ISBN", "Price", "Publisher_id", "Title")
    VALUES (5, '90392B33', 40.99, 3, 'Cloudy Forest');
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231006190214_AddingFluentAPIConfigurations') THEN
    CREATE INDEX "IX_Books_Publisher_id" ON "Books" ("Publisher_id");
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231006190214_AddingFluentAPIConfigurations') THEN
    CREATE UNIQUE INDEX "IX_BookDetails_Book_Id" ON "BookDetails" ("Book_Id");
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231006190214_AddingFluentAPIConfigurations') THEN
    CREATE INDEX "IX_AuthorBook_BooksBookId" ON "AuthorBook" ("BooksBookId");
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231006190214_AddingFluentAPIConfigurations') THEN
    ALTER TABLE "BookDetails" ADD CONSTRAINT "FK_BookDetails_Books_Book_Id" FOREIGN KEY ("Book_Id") REFERENCES "Books" ("BookId") ON DELETE CASCADE;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231006190214_AddingFluentAPIConfigurations') THEN
    ALTER TABLE "Books" ADD CONSTRAINT "FK_Books_Publishers_Publisher_id" FOREIGN KEY ("Publisher_id") REFERENCES "Publishers" ("Publisher_Id") ON DELETE CASCADE;
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231006190214_AddingFluentAPIConfigurations') THEN
    PERFORM setval(
        pg_get_serial_sequence('"Publishers"', 'Publisher_Id'),
        GREATEST(
            (SELECT MAX("Publisher_Id") FROM "Publishers") + 1,
            nextval(pg_get_serial_sequence('"Publishers"', 'Publisher_Id'))),
        false);
    PERFORM setval(
        pg_get_serial_sequence('"Books"', 'BookId'),
        GREATEST(
            (SELECT MAX("BookId") FROM "Books") + 1,
            nextval(pg_get_serial_sequence('"Books"', 'BookId'))),
        false);
    END IF;
END $EF$;

DO $EF$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM "__EFMigrationsHistory" WHERE "MigrationId" = '20231006190214_AddingFluentAPIConfigurations') THEN
    INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
    VALUES ('20231006190214_AddingFluentAPIConfigurations', '8.0.0-rc.1.23419.6');
    END IF;
END $EF$;
COMMIT;

