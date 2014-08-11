class Product < ActiveRecord::Base
  extend CsvFormatter
  include Search

  attr_accessible :name, :factory_id, :img_src

  validates :name, uniqueness: { scope: :factory_id }
  validates :name, presence: true

  belongs_to :factory

  delegate :company, to: :factory
end
