using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFCoreTest_Model.Models
{
    public class Fluent_Publisher
    {
        [Key]
        public int Publisher_Id { get; set; }
        [Required]
        public string Name { get; set; }
        public string Location { get; set; }
        // Notice that this navigation property is not holding a single value, but rather it is holding a list of books.
        // By declaring this navigation property as a List and having the Books table contain a foreign key that points
        // to this Publishers table, we are creating a one to many relationship.
        public List<Fluent_Book> Books { get; set; }
    }
}
