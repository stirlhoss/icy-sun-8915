require 'rails_helper'

RSpec.describe Employee: :Show do
  it 'shows the employees name and department' do
    dept = Department.create(name: 'printing', floor: 5)
    empy1 = Employee.create(name: 'mike', level: 2, department_id: "#{dept.id}")
    empy3 = Employee.create(name: 'steve', level: 2, department_id: "#{dept.id}")
    empy2 = dept.employees.create(name: 'James', level: 2)
    ticket1 = Ticket.create(subject: 'printer no work', age: 5)
    ticket2 = Ticket.create(subject: 'fax no work', age: 3)
    ticket3 = Ticket.create(subject: 'phone no work', age: 4)
    et1 = EmployeeTicket.create(employee_id: empy1.id, ticket_id: ticket1.id)
    et2 = EmployeeTicket.create(employee_id: empy2.id, ticket_id: ticket2.id)
    et3 = EmployeeTicket.create(employee_id: empy1.id, ticket_id: ticket3.id)

    # visit "/employees/#{empy1.id}"
    visit employee_path(empy1.id)

    expect(page).to have_content(empy1.name)
    expect(page).to have_content(empy1.department.name)
    expect(page).to have_content(ticket1.subject)
    expect(page).to have_content(ticket1.age)
    expect(page).to_not have_content(ticket2.subject)
  end

  it 'shows tickets ordered from oldest to youngest' do
    dept = Department.create(name: 'printing', floor: 5)
    empy1 = Employee.create(name: 'mike', level: 2, department_id: "#{dept.id}")
    empy3 = Employee.create(name: 'steve', level: 2, department_id: "#{dept.id}")
    empy2 = dept.employees.create(name: 'James', level: 2)
    ticket1 = Ticket.create(subject: 'printer no work', age: 5)
    ticket2 = Ticket.create(subject: 'fax no work', age: 3)
    ticket3 = Ticket.create(subject: 'phone no work', age: 4)
    et1 = EmployeeTicket.create(employee_id: empy1.id, ticket_id: ticket1.id)
    et2 = EmployeeTicket.create(employee_id: empy1.id, ticket_id: ticket2.id)
    et3 = EmployeeTicket.create(employee_id: empy1.id, ticket_id: ticket3.id)

    visit employee_path(empy1.id)

    within '#tickets' do
      expect(ticket1.subject).to appear_before(ticket3.subject)
      expect(ticket3.subject).to appear_before(ticket2.subject)
    end
  end

  it 'shows oldest ticket' do
    dept = Department.create(name: 'printing', floor: 5)
    empy1 = Employee.create(name: 'mike', level: 2, department_id: "#{dept.id}")
    empy3 = Employee.create(name: 'steve', level: 2, department_id: "#{dept.id}")
    empy2 = dept.employees.create(name: 'James', level: 2)
    ticket1 = Ticket.create(subject: 'printer no work', age: 5)
    ticket2 = Ticket.create(subject: 'fax no work', age: 3)
    ticket3 = Ticket.create(subject: 'phone no work', age: 4)
    et1 = EmployeeTicket.create(employee_id: empy1.id, ticket_id: ticket1.id)
    et2 = EmployeeTicket.create(employee_id: empy1.id, ticket_id: ticket2.id)
    et3 = EmployeeTicket.create(employee_id: empy1.id, ticket_id: ticket3.id)

    visit employee_path(empy1.id)

    within '#oldest-ticket' do
      expect(page).to have_content(ticket1.subject)
    end
  end
end
