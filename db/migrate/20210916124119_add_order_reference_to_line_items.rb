class AddOrderReferenceToLineItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :line_items, :order
  end
end
