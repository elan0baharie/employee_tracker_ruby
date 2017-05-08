class CreateProjectsTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:projects) do |t|
      t.column(:division,:string)
      t.column(:name,:string)

      t.timestamps()
  end
end
end
