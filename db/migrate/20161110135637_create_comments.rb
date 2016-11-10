class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :poster
      t.references :target
      t.text :body

      t.timestamps
    end
  end
end
