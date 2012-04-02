class CreateQualifiers < ActiveRecord::Migration
  def change
    create_table :qualifiers do |t|
      t.boolean :class_mech
      t.boolean :stat_mech
      t.boolean :em
      t.boolean :quantum
      t.integer :attempts

      t.timestamps
    end
  end
end
