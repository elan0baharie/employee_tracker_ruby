class CreateADivisionTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:divisions) do |t|
      t.column(:division_name, :string)
      t.column(:project_name, :string)
      t.timestamps()
    end
  end
end
