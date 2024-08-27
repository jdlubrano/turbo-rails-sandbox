class CreateInboxes < ActiveRecord::Migration[7.2]
  def change
    create_table :inboxes do |t|
      t.string :name, index: { unique: true }

      t.timestamps
    end
  end
end
