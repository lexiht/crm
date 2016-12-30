class AddWorkshopToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :workshop, foreign_key: true
  end
end
