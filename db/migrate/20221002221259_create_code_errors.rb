class CreateCodeErrors < ActiveRecord::Migration[7.0]
  def change
    create_table :code_errors do |t|
      t.string :name
      t.string :description
      t.string :value
      t.boolean :status

      t.timestamps
    end
  end
end
