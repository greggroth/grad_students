class ChangeColumnsPhonsAndLabPhonsToString < ActiveRecord::Migration
  def up
    change_column :students, :phone, :string, :limit => 10
    change_column :students, :lab_phone, :string, :limit => 10
  end

  def down
  end
end
