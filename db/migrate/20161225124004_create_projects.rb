class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :reference
      t.datetime :due_date
      t.integer :workshop_id

      t.timestamps
    end
  end
end
