class AddPositionToProfessors < ActiveRecord::Migration
  def change
    add_column :professors, :graduate_advisor, :boolean

    add_column :professors, :undergraduate_advisor, :boolean

    add_column :professors, :department_chair, :boolean

  end
end
