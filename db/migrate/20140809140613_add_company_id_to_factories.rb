class AddCompanyIdToFactories < ActiveRecord::Migration
  def change
    add_column :factories, :company_id, :integer
  end
end
