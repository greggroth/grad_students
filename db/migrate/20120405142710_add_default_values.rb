class AddDefaultValues < ActiveRecord::Migration
  def up
    # change_column_default(table_name, column_name, default)
    change_column :students, :degree, :string, default: "PhD"
    change_column :students, :status, :string, default: "Current student"
    remove_column :students, :graduated
    remove_column :students, :left_program_early
    
    change_column :qualifiers, :em,  :boolean, default: false, null: false
    change_column :qualifiers, :quantum, :boolean, default: false, null: false
    change_column :qualifiers, :stat_mech, :boolean, default: false, null: false
    change_column :qualifiers, :class_mech, :boolean, default: false, null: false
    change_column :qualifiers, :attempts, :integer, default: 1
  end

  def down
  end
end
