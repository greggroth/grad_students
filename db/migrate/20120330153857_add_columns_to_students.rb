class AddColumnsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :left_program_early, :boolean

    add_column :students, :graduated, :boolean

    add_column :students, :lab_phone, :integer

    add_column :students, :thesis_ms, :boolean

  end
end
