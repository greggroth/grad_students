class AddStipendToStudents < ActiveRecord::Migration
  def change
    add_column :students, :stipend, :decimal

  end
end
