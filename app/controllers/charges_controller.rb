class ChargesController < ApplicationController

def create
    @product = Product.find(params[:product_id]) # Retrieve the product
    token = params[:stripeToken] # Token generated by Stripe.js
    
    charge = Stripe::Charge.create({
      amount: (@product.price * 100).to_i, # Stripe requires amount in cents
      currency: 'usd',
      description: 'Product Purchase',
      source: token,
    })

    # Handle successful payment (e.g., update order status, send email, etc.)

    redirect_to product_path(@product), notice: 'Payment successful!'
  rescue Stripe::CardError => e
    # Handle card errors (e.g., display an error message)
    redirect_to product_path(@product), alert: e.message
  end
end
