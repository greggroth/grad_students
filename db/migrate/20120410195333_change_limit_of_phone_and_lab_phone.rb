class ChangeLimitOfPhoneAndLabPhone < ActiveRecord::Migration
  def up
    change_column :students, :phone, :string, limit: nil
    change_column :students, :lab_phone, :string, limit: nil
  end
end
