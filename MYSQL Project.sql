create database library;
use library;

create table Branch (Branch_no int primary key,
Manager_id int not null,
Branch_address varchar (35),
contact_no int);

desc Branch;
insert into branch values(101, 1001,'Public Library chennai',98765432);
insert into branch values(102, 1002,'Central Library Mumbai',98764324);
insert into branch values(103, 1003,'National Library Delhi',97654328);
insert into branch values(104, 1004,'City Library Kolkata',87654372);
insert into branch values(105, 1005,'State Library Bangalore',98754323);


select * from Branch;

create table Employee(Emp_id int primary key,Emp_name varchar(25),Position varchar(25),Salary int,
Branch_no int,foreign key(Branch_no)references Branch(Branch_no)on delete cascade);
desc Employee;
insert into Employee values(1001,'Venu','Trainee',30000,101);
insert into Employee values(1002,'Sara','Manager',60000,105);
insert into Employee values(1003,'John','Accountant',45000,103);
insert into Employee values(1004,'Emily','Salesman',35000,102);
insert into Employee values(1005,'David','Librarian',50000,104);
insert into Employee values(1006,'Sophia','Watchman',15000,103);

select * from Employee;

create table Book(Book_no int primary key,Book_title varchar(35),Category varchar(25),
Rental_price int,Status_b varchar(5),Author varchar(30),Publisher varchar(30));

insert into Book values(2332,'Breaking Dawn','Romance',200,'Yes','Stephanie Meyer','Eclipse Books');
insert into Book values(2333,'The Great Gatsby','Fiction',180,'No','F. Scott Fitzgerald','Scribner');
insert into Book values(2334,'To Kill a Mockingbird','Classic',281,'Yes','Harper Lee','J. B. Lippincott & Co.');
insert into Book values(2335,'Harry Potter','Fantasy',336,'Yes','J.K. Rowling','Bloomsbury Publishing');
insert into Book values(2336,'1984','Dystopian',328,'No','George Orwell','Secker & Warburg');
insert into Book values(2337,'The Catcher in the Rye','Literary Fiction',224,'Yes','J.D. Salinger','Little, Brown and Company');
insert into Book values(2338,'Pride and Prejudice','Classic',279,'Yes','Jane Austen','T. Egerton, Whitehall');

select * from Book;
 
create table Customer(Customer_id int primary key,Customer_name varchar(15),Customer_address varchar(25),Reg_date date);
desc customer;
insert into Customer values(1,'Renu','Techno street','2023-07-01');
insert into Customer values(2,'John','Main Street','2023-12-15');
insert into Customer values(3,'Emily','Oak Avenue','2023-04-25');
insert into Customer values(4,'Michael','Broadway','2023-09-10');
insert into Customer values(5,'Sophia','Park Lane','2023-11-30');
insert into Customer values(6,'Daniel','Sunset Boulevard','2024-02-18');
insert into Customer values(7,'Sarah','River Road','2024-05-05');

select * from customer;

update customer set Reg_date='2023-04-25' where Customer_id='3';
create table Issuestatus(Issue_id int primary key,issued_book_name varchar(25),issue_date date,
Book_no int,foreign key(Book_no) references Book( Book_no) on Delete cascade,Issued_cust int,
foreign key(Issued_cust) references Customer(customer_id) on delete cascade);
desc issuestatus;
select * from issuestatus;
insert into issuestatus values(11,'Breaking Dawn','2023-07-01',2332,2);
insert into issuestatus values(12,'1984','2023-11-30',2336,5);
insert into issuestatus values(13,'Pride and Prejudice','2023-04-25',2338,3);
insert into issuestatus values(14,'The Catcher in the Rye','2023-12-15',2337,2);
insert into issuestatus values(15,'Harry Potter','2024-05-05',2335,7);
insert into issuestatus values(16,'The Great Gatsby','2023-07-01',2332,1);
insert into issuestatus values(17,'To Kill a Mockingbird','2024-02-18',2334,6);
insert into issuestatus values(18,'To Kill a Mockingbird','2023-11-18',2334,4);
select * from issuestatus;

create table Returnstatus (Return_id int primary key,Return_cust int,Return_book_name varchar(30),
return_date date,Book_no2 int,foreign key(Book_no2) references Book(Book_no) on Delete cascade);
desc returnstatus;

select * from returnstatus;

insert into returnstatus (return_id,return_cust,return_book_name,return_date,Book_no2) values
(101,2,'Breaking Dawn','2023-07-14',2332),
(102,1, 'The Great Gatsby', '2023-07-06',2332),
(103,7, 'Harry Potter', '2024-05-11',2335),                                        
(104,3, 'Pride and Prejudice', '2023-05-02',2338),											
(105,4, 'To Kill a Mockingbird', '2023-11-22',2334),                                            
(106,5,'1984','2023-12-06',2332), 
(107,6,'To Kill a Mockingbird', '2024-02-25' ,2334),
(108, 2,'The Catcher in the Rye','2023-12-20',2337);
                               
  show tables in library;
  
#1. Retrieve the book title, category, and rental price of all available books.
select book_title,Category,Rental_price from book;
#2. List the employee names and their respective salaries in descending order of salary.
select Emp_name,Salary from Employee order by Salary desc;
#3. Retrieve the book titles and the corresponding customers who have issued those books.
select book_title,customer_name from IssueStatus i join Book b on i.Book_no = b.Book_no join customer c on i.issued_cust = c.customer_id;
#4. Display the total count of books in each category.
select category,count(*) as 'Count of Books' from book group by category;
#5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
select Emp_name,Position from Employee where Salary > 50000;
#6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
select Customer_name from customer where Reg_Date <'2022-01-01' and customer_id not in (select Issued_cust from IssueStatus);
#7. Display the branch numbers and the total count of employees in each branch.
select Branch_no,count(Emp_name) as Emp_count from Employee group by Branch_no;
#8. Display the names of customers who have issued books in the month of June 2023.
select Customer_Name from Issuestatus i join Customer c on i.issued_cust= c.Customer_id where month(issue_date)=09;
#9. Retrieve book_title from book table containing history.
select Book_title from Book where Category = 'Historical';
#10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
select Branch_no,count(Emp_name) as Emp_count from Employee group by Branch_no having count(Emp_name) >1;								
                                               