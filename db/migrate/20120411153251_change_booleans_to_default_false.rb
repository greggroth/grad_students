class ChangeBooleansToDefaultFalse < ActiveRecord::Migration
  def up
    change_column :professors, :department_chair, :boolean, default: false, null: false
    change_column :professors, :undergraduate_advisor, :boolean, default: false, null: false
    change_column :professors, :graduate_advisor, :boolean, default: false, null: false

  end

  def down
  end
end
