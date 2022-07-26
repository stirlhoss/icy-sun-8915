require 'rails_helper'

RSpec.describe Departments: :Index do
  it 'shows each departments name and floor' do
    dept = Department.create(name: 'printing', floor: 5)
    empy1 = Employee.create(name: 'mike', level: 2, department_id: "#{dept.id}")
    empy3 = Employee.create(name: 'steve', level: 2, department_id: "#{dept.id}")
    empy2 = dept.employees.create(name: 'James', level: 2)

    visit '/departments'

    expect(page).to have_content('printing')
    expect(page).to have_content('steve')
    expect(page).to have_content('mike')
    expect(page).to have_content('James')
  end
end
