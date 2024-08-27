class CreateMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :messages do |t|
      t.references :inbox, foreign_key: true, index: true

      t.string :title
      t.text :body
      t.timestamp :read_at

      t.timestamps
    end
  end
end
