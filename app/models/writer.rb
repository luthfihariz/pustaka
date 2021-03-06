class Writer < ActiveRecord::Base
  has_many :writings
  has_many :literatures, :through => :writings
   
  validates :name, :presence => true, :uniqueness => :true
  validates :about, :presence => true  
  
  accepts_nested_attributes_for :writings
  def self.find_all
    order(:created_at)
  end
  
  def self.find_id(id)
    find(id)
  end
end
