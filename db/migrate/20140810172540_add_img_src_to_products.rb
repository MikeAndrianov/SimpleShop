class AddImgSrcToProducts < ActiveRecord::Migration
  def change
    add_column :products, :img_src, :string
  end
end
