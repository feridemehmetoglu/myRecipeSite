class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :ingredient
      t.text :description
      t.datetime :date
      t.integer :read_count
      t.boolean :confirmation
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
