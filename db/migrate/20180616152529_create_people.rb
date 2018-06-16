# People table
class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :marital_status
      t.string :social_insurance_number
      t.date :hire_date
      t.text :preferences

      t.timestamps
    end
  end
end
