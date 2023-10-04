using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EFCoreTest_Model.Models
{
    public class BookDetail
    {
        [Key]
        public int BookDetail_Id { get; set; }
        [Required]
        public int NumberOfChapters { get; set; }
        public int NumberOfPages { get; set; }
        public string Weight { get; set; }
        // This annotation makes Book_Id a foreign key in the BookDetails table that points to the Books table
        [ForeignKey("Book")]
        public int Book_Id { get; set; }
        // Navigation property that will point to the Book table
        public Book Book { get; set; }
    }
}
