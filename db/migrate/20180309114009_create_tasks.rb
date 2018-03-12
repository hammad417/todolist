class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.text :body
      t.references :list, foreign_key: true
      t.integer :state_cd, default: 0

      t.timestamps
    end
  end
end
