// See https://aka.ms/new-console-template for more information
using EFCoreTest_DataAccess.Data;
using EFCoreTest_DataAccess.Migrations;
using EFCoreTest_Model.Models;

Console.WriteLine("Hello, World!");

//using (ApplicationDbContext context = new())
//{
//    context.Database.EnsureCreated();

//}

//AddBook();
//GetAllBooks();
//GetBook();
UpdateBook();

// EF Core will keep track of any record that is retrieved from the database, so if you make a change to the object that was created from
// the retrieved data, EF Core will track that change and make the same changes to the record in the database upon hitting the .SaveChanges() method
void UpdateBook()
{
    using var context = new ApplicationDbContext();
    var books = context.Books.Find(6);
    books.ISBN = "777";
    context.SaveChanges();

}

void AddBook()
{
    Book book = new() { Title="New EF Core Book", ISBN="123123123", Price=10.93m, Publisher_id = 2 };
    using var context = new ApplicationDbContext();
    var books = context.Books.Add(book);
    context.SaveChanges();
}


void GetBook()
{
    using var context = new ApplicationDbContext();
    var book = context.Books.FirstOrDefault(u => u.Publisher_id == 3); // As seen here you can pass a filter directly into the FirstOrDefault method
    //var book = context.Books.Find(6); // The Find() method will work on the primary key of a table and look through the primary key's column for the value
                                        // that was passed in. Find is not a LINQ method, rather it is a method on the DbSet itself.
    Console.WriteLine($"{book.Title} - {book.ISBN}");
}

void GetAllBooks()
{
    using var context = new ApplicationDbContext();
    var books = context.Books.ToList();
    foreach (var book in books)
    {
        Console.WriteLine($"{book.Title} - {book.ISBN}");
    }
}