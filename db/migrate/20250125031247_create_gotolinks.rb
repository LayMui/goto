class CreateGotolinks < ActiveRecord::Migration[7.1]
  def change
    create_table :gotolinks do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.string :slug, null: false

      t.index :slug, unique: true
      t.timestamps
    end
  end
end
