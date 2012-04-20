class AddUniqueStipendToStudents < ActiveRecord::Migration
  def change
    add_column :students, :unique_stipend, :boolean

  end
end
