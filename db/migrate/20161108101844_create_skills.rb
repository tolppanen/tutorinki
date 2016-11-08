class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.references :subject, index: true
      t.references :user, index: true
      t.text :description

      t.timestamps
    end
  end
end
