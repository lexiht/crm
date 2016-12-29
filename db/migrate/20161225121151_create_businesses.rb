class CreateBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.string :company_name, null: false, default:"", unique: true
      t.string :address
      t.string :website
      t.string :phone
      t.string :description

      t.timestamps
    end
  end
end
