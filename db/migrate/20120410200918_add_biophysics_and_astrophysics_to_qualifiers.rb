class AddBiophysicsAndAstrophysicsToQualifiers < ActiveRecord::Migration
  def change
    add_column :qualifiers, :biophysics, :boolean

    add_column :qualifiers, :astrophysics, :boolean

  end
end
