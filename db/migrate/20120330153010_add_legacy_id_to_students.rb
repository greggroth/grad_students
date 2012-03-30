class AddLegacyIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :legacy_id, :integer

  end
end
