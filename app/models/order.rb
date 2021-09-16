class Order < ApplicationRecord
  has_many :line_items

  accepts_nested_attributes_for :line_items

  # calculations are saved in database to avoid 1+n problem when quering each order

  after_create :do_calculations

  private

  def do_calculations
    self.total = line_items.sum(:total)
    self.subtotal = line_items.sum(:subtotal)
    self.tax = line_items.sum(:tax)
    save
  end
end
