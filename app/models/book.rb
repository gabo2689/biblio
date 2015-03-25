class Book < ActiveRecord::Base
  belongs_to :author
  has_many :orders
  validates_presence_of :title, :description, :price
  validates_numericality_of :price, greater_than: 0
  validates :description, length: { maximum: 200 }


  def self.book_options
      ["AVENTURA", "ROMANCE","INFANTIL","EDUCATIVO","MOTIVACIONAL"]
    end

  def decorate
    "Lps #{price}"
  end




end
