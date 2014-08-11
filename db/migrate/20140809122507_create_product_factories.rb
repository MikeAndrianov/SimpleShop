class CreateProductFactories < ActiveRecord::Migration
  def change
    create_table :product_factories do |t|
      t.integer :product_id
      t.integer :factory_id
    end

    add_index :product_factories, :product_id
    add_index :product_factories, :factory_id
  end
end
