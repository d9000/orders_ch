require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'calculations' do
    subject { described_class.new() }
      it 'do calculations' do
        subject.line_items.build(quantity:5, amount: 20)
        subject.save

        expect(subject.subtotal).to eq(100)
        expect(subject.tax).to eq(subject.line_items.sum(:tax))
        expect(subject.total).to eq(subject.line_items.sum(:total))
      end
  end
end
