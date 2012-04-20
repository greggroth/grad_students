class AddLabCoordinatorToProfessors < ActiveRecord::Migration
  def change
    add_column :professors, :lab_coordinator, :boolean

  end
end
