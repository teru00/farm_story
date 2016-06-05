class AddOwnerToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :owner, index: true, foreign_key: true
    add_index :products, [:owner_id, :created_at]
  end
end
