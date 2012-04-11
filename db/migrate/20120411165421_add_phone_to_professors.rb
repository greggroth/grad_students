class AddPhoneToProfessors < ActiveRecord::Migration
  def change
    add_column :professors, :phone, :string

  end
end
