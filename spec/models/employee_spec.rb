require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'relationships' do
    it { should belong_to :department }
    it { should have_many :employee_tickets }
    it { should have_many(:tickets).through :employee_tickets }
  end

  describe 'instance methods' do
    it '#tickets_by_age orders tickets from oldest to youngest' do
      dept = Department.create(name: 'printing', floor: 5)
      employee = Employee.create(name: 'mike', level: 5, department_id: dept.id)
      ticket1 = Ticket.create(subject: 'printer no work', age: 5)
      ticket2 = Ticket.create(subject: 'fax no work', age: 3)
      ticket3 = Ticket.create(subject: 'phone no work', age: 4)
      et1 = EmployeeTicket.create(employee_id: employee.id, ticket_id: ticket1.id)
      et2 = EmployeeTicket.create(employee_id: employee.id, ticket_id: ticket2.id)
      et3 = EmployeeTicket.create(employee_id: employee.id, ticket_id: ticket3.id)

      expect(employee.tickets_by_age).to eq([ticket1, ticket3, ticket2])
    end
  end

  it '#oldest_ticket orders tickets from oldest to youngest' do
    dept = Department.create(name: 'printing', floor: 5)
    employee = Employee.create(name: 'mike', level: 5, department_id: dept.id)
    ticket1 = Ticket.create(subject: 'printer no work', age: 5)
    ticket2 = Ticket.create(subject: 'fax no work', age: 3)
    ticket3 = Ticket.create(subject: 'phone no work', age: 4)
    et1 = EmployeeTicket.create(employee_id: employee.id, ticket_id: ticket1.id)
    et2 = EmployeeTicket.create(employee_id: employee.id, ticket_id: ticket2.id)
    et3 = EmployeeTicket.create(employee_id: employee.id, ticket_id: ticket3.id)

    expect(employee.oldest_ticket).to eq(ticket1)
  end
end
