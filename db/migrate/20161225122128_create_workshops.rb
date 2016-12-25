class CreateWorkshops < ActiveRecord::Migration[5.0]
  def change
    create_table :workshops do |t|
      t.string :name
      t.string :description
      t.integer :capacity
      t.string :status
      t.integer :business_id

      t.timestamps
    end
  end
end
