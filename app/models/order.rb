class Order < ActiveRecord::Base
  belongs_to :book

  validates_presence_of :quality
  validates_numericality_of :quality, greater_than: 0


end
