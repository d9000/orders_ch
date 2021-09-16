class OrdersController < ApplicationController
  def create
    order = Order.create!(permitted_params)

    # could be batter to user serializer to format returned object but it is out of scope.
    render json: order.to_json, status: 200
  rescue
    render json: { errors: { message: Order.errors.full_messages.to_sentence } }, status: unprocessable_entity
  end

  private

  def permmitted_params
    params.
      require(:order).
      permit(
        line_item_attributes:[
          :quantity, :amount
        ]
      )
  end
end
