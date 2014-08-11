class Company < ActiveRecord::Base
  extend CsvFormatter
  include Search
  
  attr_accessible :name

  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :factories
end
