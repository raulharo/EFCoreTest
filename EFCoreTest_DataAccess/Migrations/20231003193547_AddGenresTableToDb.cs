using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace EFCoreTest_DataAccess.Migrations
{
    /// <inheritdoc />
    public partial class AddGenresTableToDb : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "PageCount",
                table: "Books",
                newName: "page_count");

            migrationBuilder.AlterColumn<decimal>(
                name: "Price",
                table: "Books",
                type: "numeric(10,5)",
                precision: 10,
                scale: 5,
                nullable: false,
                oldClrType: typeof(double),
                oldType: "double precision");

            migrationBuilder.CreateTable(
                name: "Genres",
                columns: table => new
                {
                    GenreId = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    GenreName = table.Column<string>(type: "text", nullable: false),
                    Display = table.Column<int>(type: "integer", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Genres", x => x.GenreId);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Genres");

            migrationBuilder.RenameColumn(
                name: "page_count",
                table: "Books",
                newName: "PageCount");

            migrationBuilder.AlterColumn<double>(
                name: "Price",
                table: "Books",
                type: "double precision",
                nullable: false,
                oldClrType: typeof(decimal),
                oldType: "numeric(10,5)",
                oldPrecision: 10,
                oldScale: 5);
        }
    }
}
