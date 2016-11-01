class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.integer :subject
      t.integer :level
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
