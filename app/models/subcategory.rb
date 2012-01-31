class Subcategory < ActiveRecord::Base
  has_many :literatures
  
  validates :name, :presence => true, :uniqueness => :true
  
  def self.find_all
    order(:created_at)
  end
  
  def self.find_id(id)
    find(id)
  end
end
