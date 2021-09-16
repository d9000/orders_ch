class LineItem < ApplicationRecord
  belongs_to :order

  # calculations can be done on the fly, using virtual attributes,
  # but it was requested to recreate the structure given in the requirements.
  after_create :do_calculations

  validates :quantity, :amount, presence: :true

  private

  def do_calculations
    self.subtotal = amount * quantity
    self.tax = (subtotal * 8) / 100
    self.total = subtotal + tax

    save
  end
end
