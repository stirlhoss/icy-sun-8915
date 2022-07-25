— 
title: Ticket, Please
layout: page
—

Read user stories very carefully.

Fork and clone repo. 

When time is up, submit pull request.

## Overview

We are creating an application to track departments, employees and tickets.

* Departments have a name and a floor.
	* ex. name: ‘IT’, floor: ‘Basement’
* Employees have a name, and level
	* ex. name: ‘Christina Aguilera’, level: 2
* Tickets have a subject and an age
	* ex. subject: ‘printers broken’, age: 5

* Departments have many Employees
* Employees belong to a Department
* Employees have many Tickets
* Tickets can belong to many Employees

You will need to create all the migrations

```
Story 1
Department Index

As a user,
When I visit the Department index page,
I see each department's name and floor
And underneath each department, I can see the names of all of its employees
```
```
Story 2
Employee Show

As a user,
When I visit the Employee show page,
I see the employee's name, department
and a list of all of their tickets from oldest to youngest.
I also see the oldest ticket assigned to the employee listed separately
```
```
Story 3

As a user,
When I visit the employee show page,
I do not see any tickets listed that are not assigned to the employee
and I see a form to add a ticket to this employee
When I fill in the form with the id of a ticket that already exists in the database
and I click submit
Then I am redirected back to that employees show page
and i see the ticket's subject now listed
(you do not have to test for sad path, for example if the id does not match an existing ticket
```
## Extension
```
Extension
Best Friends

As a user,
When I visit an employee's show page
I see that employees name and level
and I see a unique list of all the other employees that this employee shares tickets with
```
