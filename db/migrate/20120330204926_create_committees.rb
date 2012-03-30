class CreateCommittees < ActiveRecord::Migration
  def change
    create_table :committees do |t|
      t.integer :student_id
      t.integer :professor_id
      t.boolean :ms_chair
      t.boolean :phd_chair
      t.boolean :ms
      t.boolean :phd

      t.timestamps
    end
  end
end
