using EFCoreTest_Model.Models.Fluent_Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFCoreTest_DataAccess.FluentConfig
{
    public class FluentBookAuthorMapConfig : IEntityTypeConfiguration<Fluent_BookAuthorMap>
    {
        public void Configure(EntityTypeBuilder<Fluent_BookAuthorMap> modelBuilder) 
        {
            // In this set of Fluent API configs, we are creating a composite key for the Fluent_BookAuthorMap table in the first line and
            // creating a many to many relationship in the following 2 lines.
            modelBuilder.HasKey(u => new { u.Author_Id, u.Book_Id });
            modelBuilder.HasOne(u => u.Book).WithMany(u => u.BookAuthorMap).HasForeignKey(u => u.Book_Id);
            modelBuilder.HasOne(u => u.Author).WithMany(u => u.BookAuthorMap).HasForeignKey(u => u.Author_Id);
        }
    }
}
