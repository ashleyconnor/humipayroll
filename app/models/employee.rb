class Employee < ApplicationRecord
  self.table_name = "people"

  validates :first_name, :last_name, :date_of_birth,
    :marital_status, :social_insurance_number, :hire_date, presence: true

  validates :first_name, :last_name, length: { in: 1..255 }

  validates :marital_status, inclusion: { in: %w(single married),
    message: "%{value} is not a valid marital status" }

  validates :social_insurance_number, uniqueness: true
  validates :social_insurance_number,
    format: { with: /\d{3}-\d{3}-\d{3}/, message: "Invalid SIN format" }

  validates_date :date_of_birth, :on_or_before => lambda { 18.years.ago },
    :on_or_before_message => "must be at least 18 years old"

  validates_date :hire_date, :on_or_before => lambda { Date.current },
    :on_or_before_message => "Hire date must be today or in the past"

  def full_name
    "#{first_name} #{last_name}"
  end
end
