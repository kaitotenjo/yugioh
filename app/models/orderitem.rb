class Orderitem < ApplicationRecord
  belongs_to :order
  before_save :s_price
  before_save :set_total

  def total
    set_price.to_f * quantity
  end

  private

  def s_price
    self[:set_price] = set_price
  end

  def set_total
    self.total = total
    # byebug
  end
end
