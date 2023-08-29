class PaymentsController < ApplicationController
  # def create
  #   token = params[:stripeToken]
  #   payment_intent = Stripe::PaymentIntent.create(
  #     amount: 1000, # Amount in cents
  #     currency: 'usd',
  #     payment_method_types: ['card']
  #   )
  #   Stripe::PaymentIntent.confirm(payment_intent.id, payment_method: token)
  #   rescue Stripe::CardError => e
  #     flash[:error] = e.message
  #     redirect_to new_payment_path
  #   else
  #     flash[:success] = "Payment successful!"
  #     redirect_to root_path
  # end
  def new
    @stripe_publishable_key = Rails.configuration.stripe[:publishable_key]
  end
  
  def create
    customer = Stripe::Customer.create(
      name: current_user.full_name,
      email: current_user.email,
      description: "Customer id: #{current_user.id}",
    )
  
    session = Stripe::Checkout::Session.create( 
      customer: customer, 
      payment_method_types: [‘card’],
      line_items: [{
        price: 'price_1234', 
        quantity: 1,
      }],
      mode: 'subscription',
      success_url:  payments_success_url,
      cancel_url: payments_cancel_url
     )
     redirect_to session.url
    end
  
	  def success
	    redirect_to root_url, notice: "Purchase Successful"
	  end
	  
	  def cancel
	    redirect_to root_url, notice: "Purchase Unsuccessful"
	  end
end
