using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFCoreTest_Model.Models
{
    public class Fluent_Book
    {
        [Key]
        public int BookId { get; set; }
        public string Title { get; set; }
        public string ISBN { get; set; }
        public decimal Price { get; set; }
        [NotMapped]
        public string PriceRange { get; set; }
        // This is another navigation property making a relation to the BookDetails table in EF Core
        public BookDetail BookDetail { get; set; }
        [ForeignKey("Publisher")]
        public int Publisher_id { get; set; }
        public Fluent_Publisher Publisher { get; set; }
        // By having this navigation property be a List and point to the Authors table and doing the same in the Authors table,
        // we are defining a many to many relationship between the Books and Authors tables. EF Core is smart enough to recognize
        // that having these navigation properties in both tables means we want to define a many to many relationship.
        // (There is a manual way of defining junction tables and many to many relationships but EF Core can handle it well enough for most things.)
        public List<Fluent_Author> Authors { get; set; }

    }
}
