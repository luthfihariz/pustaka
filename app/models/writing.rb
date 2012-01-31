class Writing < ActiveRecord::Base
  attr_accessible :literature_id, :writer_id  
  
  belongs_to :literature
  belongs_to :writer
  
  accepts_nested_attributes_for :writer
end
