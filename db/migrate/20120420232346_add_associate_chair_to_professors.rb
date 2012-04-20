class AddAssociateChairToProfessors < ActiveRecord::Migration
  def change
    add_column :professors, :associate_chair, :boolean

  end
end
