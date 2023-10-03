using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFCoreTest_Model.Models
{
    public class Book
    {
        [Key]
        public int IdBook { get; set; }
        public string Title { get; set; }
        public string ISBN { get; set; }
        public decimal Price { get; set; }
        // The method of setting the column name for the database below is one way to do it;
        // but another way is to use the Fluent API to set the name
        [Column(name:"page_count")]
        public int PageCount { get; set; }
        public string Author { get; set; }

    }
}
