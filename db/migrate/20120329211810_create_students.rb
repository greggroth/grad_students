class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :year_entered
      t.integer :ms_year
      t.integer :phd_year
      t.string :ms_semester
      t.string :phd_semester
      t.integer :panther_id
      t.string :alt_research_1
      t.string :alt_research_2
      t.integer :year_left
      t.string :semester_left
      t.boolean :citi_online
      t.boolean :citi_discussion

      t.timestamps
    end
  end
end
