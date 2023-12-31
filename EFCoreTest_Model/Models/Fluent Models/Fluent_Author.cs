﻿using EFCoreTest_Model.Models.Fluent_Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFCoreTest_Model.Models
{
    public class Fluent_Author
    {
        public int Author_Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime BirthDate { get; set; }
        public string Location { get; set; }
        public string FullName 
        { 
            get
            {
                return $"{FirstName} {LastName}";
            } 
        }
        public List<Fluent_Book> Books { get; set; }
        public List<Fluent_BookAuthorMap> BookAuthorMap { get; set; }
        // By having this navigation property be a List and point to the Books table and doing the same in the Books table,
        // we are defining a many to many relationship between the Books and Authors tables. EF Core is smart enough to recognize
        // that having these navigation properties in both tables means we want to define a many to many relationship.
        // (There is a manual way of defining junction tables and many to many relationships but EF Core can handle it well enough for most things.)
        // public List<Fluent_Book> Books { get; set; }
    }
}
