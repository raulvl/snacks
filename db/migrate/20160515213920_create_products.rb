class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :desc
      t.string :brand
      t.string :category_id

      t.timestamps null: false
    end
  end
end
