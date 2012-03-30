class AddEmailAndPhoneToStudents < ActiveRecord::Migration
  def change
    add_column :students, :email_1, :string

    add_column :students, :email_2, :string

    add_column :students, :phone, :integer

  end
end
