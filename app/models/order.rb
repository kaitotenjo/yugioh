class Order < ApplicationRecord
  has_many :orderitems
  belongs_to :user
  before_save :set_subtotal
  enum status: [ :check , :checking, :checked, :finish ]

  def subtotal
    orderitems.collect { |orderitem| orderitem.valid? ? orderitem.set_price.to_f * orderitem.quantity : 0 }.sum
  end

  private

  def set_subtotal
    self.subtotal = subtotal.round(4)
  end
end
