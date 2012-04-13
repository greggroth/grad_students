class AddExternalSupportToStudents < ActiveRecord::Migration
  def change
    add_column :students, :externally_supported, :boolean

  end
end
