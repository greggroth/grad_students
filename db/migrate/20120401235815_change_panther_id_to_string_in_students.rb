class ChangePantherIdToStringInStudents < ActiveRecord::Migration
  def up
    change_column :students, :panther_id, :string
  end

  def down
    change_column :students, :panther_id, :integer
  end
end
