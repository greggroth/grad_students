class AddStudentIdToQualifiers < ActiveRecord::Migration
  def change
    add_column :qualifiers, :student_id, :integer

  end
end
