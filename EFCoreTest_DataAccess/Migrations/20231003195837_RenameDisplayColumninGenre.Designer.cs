﻿// <auto-generated />
using EFCoreTest_DataAccess.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace EFCoreTest_DataAccess.Migrations
{
    [DbContext(typeof(ApplicationDbContext))]
    [Migration("20231003195837_RenameDisplayColumninGenre")]
    partial class RenameDisplayColumninGenre
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "8.0.0-rc.1.23419.6")
                .HasAnnotation("Relational:MaxIdentifierLength", 63);

            NpgsqlModelBuilderExtensions.UseIdentityByDefaultColumns(modelBuilder);

            modelBuilder.Entity("EFCoreTest_Model.Models.Book", b =>
                {
                    b.Property<int>("IdBook")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("IdBook"));

                    b.Property<string>("Author")
                        .HasColumnType("text");

                    b.Property<string>("ISBN")
                        .HasColumnType("text");

                    b.Property<int>("PageCount")
                        .HasColumnType("integer")
                        .HasColumnName("page_count");

                    b.Property<decimal>("Price")
                        .HasPrecision(10, 5)
                        .HasColumnType("numeric(10,5)");

                    b.Property<string>("Title")
                        .HasColumnType("text");

                    b.HasKey("IdBook");

                    b.ToTable("Books");
                });

            modelBuilder.Entity("EFCoreTest_Model.Models.Genre", b =>
                {
                    b.Property<int>("GenreId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("GenreId"));

                    b.Property<int>("DisplayOrder")
                        .HasColumnType("integer");

                    b.Property<string>("GenreName")
                        .HasColumnType("text");

                    b.HasKey("GenreId");

                    b.ToTable("Genres");
                });
#pragma warning restore 612, 618
        }
    }
}
