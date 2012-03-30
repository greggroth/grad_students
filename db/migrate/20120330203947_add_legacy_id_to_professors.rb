class AddLegacyIdToProfessors < ActiveRecord::Migration
  def change
    add_column :professors, :legacy_id, :integer

  end
end
