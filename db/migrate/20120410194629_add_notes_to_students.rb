class AddNotesToStudents < ActiveRecord::Migration
  def change
    add_column :students, :notes, :text

  end
end
