using EFCoreTest_Model.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFCoreTest_DataAccess.FluentConfig
{
    // This class was created to better organize our Fluent API configurations, rather than having all of them clustered in the onModelCreating method inside of
    // the ApplicationDbContext. 
    public class FluentBookDetailConfig : IEntityTypeConfiguration<Fluent_BookDetail>
    {
        // Because we are implementing the IEntityTypeConfiguration interface, we must include this Configure() method to hold all of our configurations
        // Also, because we specified that the parameter is an EntityTypeBuilder of type Fluent_BookDetail, we do not have to add the Entity()<Fluent_BookDetail>
        // like we would have had to in the onModelCreating method in the ApplicationDbContext
        public void Configure(EntityTypeBuilder<Fluent_BookDetail> modelBuilder)
        {
            // Name of table
            modelBuilder.ToTable("Fluent_BookDetails");

            // Name of columns
            modelBuilder.Property(u => u.NumberOfChapters).HasColumnName("NoOfChapters");

            // Primary key
            modelBuilder.HasKey(u => u.BookDetail_Id);

            // Other validations
            modelBuilder.Property(u => u.NumberOfChapters).IsRequired();

            // Relationship mapping
            modelBuilder.HasOne(b => b.Book).WithOne(b => b.BookDetail).HasForeignKey<Fluent_BookDetail>(u => u.BookDetail_Id);
        }
    }
}
