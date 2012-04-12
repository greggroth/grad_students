class AddSexToStudents < ActiveRecord::Migration
  def change
    add_column :students, :sex, :string

  end
end
