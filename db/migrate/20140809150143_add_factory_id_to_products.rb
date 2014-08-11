class AddFactoryIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :factory_id, :integer
  end
end
