using EFCoreTest_Model.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFCoreTest_DataAccess.Data
{
    internal class ApplicationDbContext : DbContext
    {
        // These DbSets hold a collection of entities of the type input into the carets. Once its time to create a migration
        // these DbSets will be converted to tables in the database and take the names that we set here.
        public DbSet<Book> Books { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Author> Authors { get; set; }
        public DbSet<Publisher> Publishers { get; set; }
        public DbSet<SubCategory> subCategories { get; set; }
        public DbSet<BookDetail> BookDetails { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder options)
        {
            options.UseNpgsql("Host=del-qa-sql-01;Port=5432;Database=EFCoreTest;User ID=nasaclient;Password=acc50cGMP;");
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // These are examples of the Fluent API in action.

            // This example is using the Fluent API's HasPrecision method to set the amount of decimals that this Price column will hold
            modelBuilder.Entity<Book>().Property(u => u.Price).HasPrecision(10, 5);

            // Here is an example of seeding using the Fluent API's HasData method. You can add predefined records into the database
            // by entering data as shown below.
            modelBuilder.Entity<Book>().HasData(
                new Book { BookId = 1, Title = "Spider without Duty", ISBN = "123B12", Price = 10.99m, Publisher_id = 1},
                new Book { BookId = 2, Title = "Fortune of Time", ISBN = "12123B12", Price = 11.99m, Publisher_id = 1 }
            );

            var bookList = new Book[]
            {
                new Book { BookId = 3, Title = "Fake Sunday", ISBN = "77652", Price = 20.99m, Publisher_id = 2 },
                new Book { BookId = 4, Title = "Cookie Jar", ISBN = "CC12B12", Price = 25.99m, Publisher_id = 3},
                new Book { BookId = 5, Title = "Cloudy Forest", ISBN = "90392B33", Price = 40.99m, Publisher_id = 3}
            };
            modelBuilder.Entity<Book>().HasData(bookList);

            modelBuilder.Entity<Publisher>().HasData(
                new Publisher { Publisher_Id = 1, Name = "Pub 1 Jimmy", Location = "Chicago" },
                new Publisher { Publisher_Id = 2, Name = "Pub 2 John", Location = "New York" },
                new Publisher { Publisher_Id = 3, Name = "Pub 3 Ben", Location = "Hawaii" }
            );
        }
    }
}
