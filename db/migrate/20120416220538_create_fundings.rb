class CreateFundings < ActiveRecord::Migration
  def change
    create_table :fundings do |t|
      t.string :source
      t.decimal :amount

      t.timestamps
    end
  end
end
