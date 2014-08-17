class CreateSubboards < ActiveRecord::Migration
  def change
    create_table :subboards do |t|
      t.string :name, index: true, unique: true, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
