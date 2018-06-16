require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  test "valid employee" do
    employee = Employee.new(employees(:valid_employee)
      .attributes.merge({social_insurance_number: "987-654-321"}))
    assert employee.valid?
  end

  test "invalid with > 255 first name" do
    employee = Employee.new(employees(:valid_employee)
      .attributes.merge({social_insurance_number: "987-654-321", first_name: "name" * 75}))
    refute employee.valid?
    assert_equal employee.errors.full_messages, ["First name is too long (maximum is 255 characters)"]
  end

  test "invalid with > 255 last name" do
    employee = Employee.new(employees(:valid_employee)
      .attributes.merge({social_insurance_number: "987-654-321", last_name: "name" * 75}))
    refute employee.valid?
    assert_equal employee.errors.full_messages, ["Last name is too long (maximum is 255 characters)"]
  end

  test "invalid with unknown marital status" do
    employee = Employee.new(employees(:valid_employee)
      .attributes.merge({social_insurance_number: "987-654-321", marital_status: "unknown"}))
    refute employee.valid?
    assert_equal employee.errors.full_messages, ["Marital status unknown is not a valid marital status"]
  end

  test "invalid with invalid SIN" do
    employee = Employee.new(employees(:valid_employee)
      .attributes.merge({social_insurance_number: "987321"}))
    refute employee.valid?
    assert_equal employee.errors.full_messages, ["Social insurance number Invalid SIN format"]
  end

  test "invalid with DOB under 18" do
    employee = Employee.new(employees(:valid_employee)
      .attributes.merge({social_insurance_number: "987-654-321", date_of_birth: 16.years.ago.to_date}))
    refute employee.valid?
    assert_equal employee.errors.full_messages, ["Date of birth must be at least 18 years old"]
  end
end
