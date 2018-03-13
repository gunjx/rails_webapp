class PaymentsController < ApplicationController

  def create
    token = params[:stripeToken]
    @product = Product.find(params[:product_id])
    byebug
    if user_signed_in?
      @user = current_user
    else
      redirect_to new_user_registration_path
    end

    begin
      charge = Stripe::Charge.create(
        amount: (@product.price * 100).to_i,
        currency: 'eur',
        source: token,
        description: params[:stripeEmail],
        receipt_email: @user.email
      )

      if charge.paid
        Order.create(
          product_id: @product.id,
          user_id: @user.id,
          total: @product.price
        )
        flash[:success] = 'Your payment was processed successfully'
      end

    rescue Stripe::CardError => e
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end

    redirect_to product_path(@product)
  end
end
