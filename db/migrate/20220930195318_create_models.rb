class CreateModels < ActiveRecord::Migration[7.0]
  def change
    create_table :models do |t|
      t.string :name
      t.float :average_price
      t.belongs_to :brand

      t.timestamps
    end
  end
end
