# Library_NCSU
Project for Program2 CSC517 OODD
Here is description of all the functionality in the project:
The environmental setup required is as follows:

        1. Ruby  --version 2.6.4
        2. Rails --version 6.0.0

Follow these steps to get the project running:
      
        1. Bundle install #installs all the gem
        2. Rake db:migrate #helps in migrations of the db
        3. Rake db:seed #used for initialize some values in the db
        4. Rails server #to start the rails app.
 
        
Some of the important components of the system are :

        1. Admin
        2. University
        3. Library
        4. Book
        5. Student
        6. Librarian
        
Library->
A library has the attributes of Name, University, Location, Maximum no of days a book can be borrowed, Overdue fines

Book->
A book has the attributes of ISBN, Title, Author, language, Published, Edition, Associated Library and many more.

Librarian->
A librarian has the attributes of Email(unique), Name, Password, Library.

Student->
A student has the attributes of Email(unique), Name, Password, Educational level(program), University, Maximum number of books that can be borrowed depending on the level of education.

## ADMIN FUNCTIONALITIES:-

1. Log in with email and password.

   Email - jpg@gmail.com
   
   password- jpg123

2. Edit their own profile to choose an existing library. Each librarian can only work for one library.

3. Edit library attributes.

4. Add/Remove books to/from a library.

5. View & Edit book information.

6. View all books.

7. View hold requests for any book in the library he/she works in.

8. For books in the special collection, accept or deny book hold request.

9. View list of all the books that are checked out from their library.

10. View the borrowing history of the books from their library.

11. View the list of students with overdue books from their library along with overdue fine.


## LIBRARIAN FUNCTIONALITIES
1. Log in with email and password.

2. Edit their own profile to choose an existing library. Each librarian can only work for one library.

3. Edit library attributes.

4. Add/Remove books to/from a library.

5. View & Edit book information.

6. View all books.

7. View hold requests for any book in the library he/she works in.

8. For books in the special collection, accept or deny book hold request.

9. View list of all the books that are checked out from their library.

10. View the borrowing history of the books from their library.

11. View the list of students with overdue books from their library along with overdue fine

## STUDENT FUNCTIONALITIES

1. View the list of all the libraries

2. Edit profile to modify email, name and password only.

3. View all books

4. Check out/Request/Return a book from any library associated with their University.

5. Delete a reservation request, which has not been approved yet (pending).

6. View/Edit their account attributes (including changing their password).

7. Search through the books

8. Search by title

9. Search by author

10. Search by publication date

11. Search by subject

12. Bookmark a book they are interested in.

13. View their bookmarked books.

14. At any given time, a student can borrow a max of 'N' number of books based on their educational level.

15. View the overdue fines for his/her account.

16. Receive an email when any of their book request is sucessful.

