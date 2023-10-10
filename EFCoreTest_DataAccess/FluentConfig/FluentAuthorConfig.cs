﻿using EFCoreTest_Model.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFCoreTest_DataAccess.FluentConfig
{
    public class FluentAuthorConfig : IEntityTypeConfiguration<Fluent_Author>
    {
        public void Configure(EntityTypeBuilder<Fluent_Author> modelBuilder) 
        {
            // Configurations for the Fluent_Author table
            modelBuilder.HasKey(u => u.Author_Id);
            modelBuilder.Property(u => u.FirstName).IsRequired();
            modelBuilder.Property(u => u.FirstName).HasMaxLength(50);
            modelBuilder.Property(u => u.LastName).IsRequired();
            modelBuilder.Ignore(u => u.FullName);
        }
    }
}
