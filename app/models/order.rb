class Order < ActiveRecord::Base
  belongs_to :book

  validates_presence_of :quality
  validates_numericality_of :quality, greater_than: 0
  default_scope :order => 'created_at DESC'
  before_create :set_total


  def set_total
    self.total = self.book.price * self.quality
  end

  def decorate_total
    "Lps #{total}"
  end


  def decorate_fecha
    created_at.strftime(" %d %b %Y %l:%M %p")
  end

  def decorate_client
    if self.client.present?
      self.client
    else
      "Anonimo"
    end
  end



end
