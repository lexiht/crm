class CreateBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.string :name, null:false, default:""
      t.string :address
      t.string :email
      t.string :phone
      t.string :description

      t.timestamps
    end
  end
end
