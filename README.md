## CSC/ECE 517 - Object Oriented Design and Development
# Program 2 - Ruby on Rails

## Library Management 
## Admin

Admin is preconfigured with the following attributes: 
* Email : jpg@gmail.com
* Name :	 jpg
* Password : jpg123

Admin is able to:

* Log in with an email and password
* Edit profile
* Create/Modify Librarian or Student accounts
* Create Books.
* View the list of users (students and librarians) and their profile details (except password)
* View the list of books, along with detailed information.
* View the list of book hold requests. – AVAILABLE ON HOMEPAGE
* View the list of Checked out books.  – AVAILABLE ON HOMEPAGE
* View the list of students with books overdue (along with overdue fines– LINK AVAILABLE AT HOMEPAGE WITH FOLLOWING NAME – “View Students with pending overdues”
Note: The overdue amount here represents the fine to student for any previous overdue book.
-FURTHER LINK TO DETAILED OVERDUE BOOKS AVAILABLE AT THE “books” sub-link

* View the borrowing history of each book. – AVAILABLE ON HOMEPAGE
* Delete Student/Book/Librarian from the system


## Librarian

Anyone can sign up as a librarian using their email, name and password. After signing up, admin needs to approve the request before they can perform the following tasks:

* Log in with email and password.
* Edit their own profile to choose an existing library. Each librarian can only work for one library.
* Edit library attributes.
* Add/Remove books to/from their own library.
* View & Edit book information.
* View all books.
* View hold requests for any book in the library he/she works in. – AVAILABLE IN HOMEPAGE
* For books in the special collection, accept or deny book hold request. – AVAILABLE IN HOMEPAGE
* View list of all the books that are checked out from their library. – AVAILABLE ON HOMEPAGE
* View the borrowing history of the books from their library. – AVAILABLE AFTER CLICKING ON “show” BUTTON AGAINST A BOOK IN THE “View Books” link.
“View Books”-> “show”
* View the list of students with overdue books from their library along with overdue fine. – LINK AVAILABLE AT HOMEPAGE WITH FOLLOWING NAME – “View Students with pending overdues”
Note: The overdue amount here represents the fine to student for any previous overdue book.
-FURTHER LINK TO DETAILED OVERDUE BOOKS AVAILABLE AT THE “books” sub-link


## Students

Anyone can sign up as a student using their email, name and password. After signing up, they can perform the following tasks:
Note: user can use same email id to register both as librarian and student

* View the list of all the libraries
* Edit profile to modify email, name and password only.
* View all books
* Check out/Request/Return a book from any library associated with their University. – AVAILABLE AT BOOK’S DETAIL/SHOW PAGE
* Delete a reservation request, which has not been approved yet (pending). – AVAILABLE AT BOOK’S DETAIL/SHOW PAGE
* View/Edit their account attributes (including changing their password).
* Search through the books
  * Search by title
  * Search by author
  * Search by publication date
  * Search by category
* Bookmark a book they are interested in. – AVAILABLE AT BOOK’S DETAIL/SHOW PAGE
* View their bookmarked books.
* At any given time, a student can borrow a max of '**N**' number of books based on their educational level.
* View the overdue fines for his/her account. 
* Receive an email when any of their book request is sucessful.



