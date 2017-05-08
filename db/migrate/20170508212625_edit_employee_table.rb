class EditEmployeeTable < ActiveRecord::Migration[5.1]
  def change
    remove_column(:employees, :division_name)
    add_column(:employees, :division_id, :integer)
  end
end
