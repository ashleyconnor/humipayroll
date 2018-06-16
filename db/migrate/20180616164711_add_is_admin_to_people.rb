class AddIsAdminToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :is_admin, :boolean, default: false
  end
end
