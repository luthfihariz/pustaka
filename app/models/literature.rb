class Literature < ActiveRecord::Base
  attr_accessible :name, :published_year, :quantity, :publisher_id, :category_id, :subcategory_id, :writings_attributes, :writer_id
  has_many :writings
  has_many :writers, :through => :writings
  
  belongs_to :publisher
  belongs_to :category
  belongs_to :subcategory
  
  accepts_nested_attributes_for :writings
  
  def self.find_all
    all
  end
  
  def self.find_id(id)
    find(id)
  end
  
end
