class AddLegacyIdToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :legacy_id, :integer

  end
end
