class Factory < ActiveRecord::Base
  extend CsvFormatter
  include Search
  
  attr_accessible :address, :name, :company_id

  validates :name, :address, :company_id, presence: true
  validates :name, :address, uniqueness: true

  belongs_to :company
  # has_many :product_factories
  # has_many :products, through: :product_factories
  has_many :products
end
