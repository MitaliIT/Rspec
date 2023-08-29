class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @products = Product.all
  end

  def show
    @products = Product.find(params[:id])
  end

  def checkout
    product_id = params[:product_id]
    product = Product.find(product_id)
    payment_intent = Stripe::PaymentIntent.create(
      amount: (product.price * 100).to_i, # Amount in cents
      currency: 'usd',
      payment_method_types: ['card']
    )
    render 'confirm_payment', locals: { product: product, payment_intent_id: payment_intent.id }
  end

  def add_to_cart
    product = Product.find(params[:id])
    token = params[:stripeToken]
    product.update(quantity: product.quantity - 1)
    redirect_to products_path, notice: 'Product added to cart successfully!'
  rescue Stripe::CardError => e
    redirect_to products_path, alert: e.message
  end
end
