require 'securerandom'
class CartsController < ApplicationController


  before_action :authenticate_user!

  before_action do
    @cart = @current_user.carts.find_by completed: false
    if @cart.blank?
      @cart = Cart.new
      @cart.user = @current_user
      @cart.name = [@current_user.username, SecureRandom.hex].join("-")
      @cart.permalink = SecureRandom.hex
      @cart.price = 0
      @cart.save
    end
  end

  def receipt

    @sale = Payola::Sale.find_by guid: params[:sale_guid]
    @cart = @sale.product
  end

  def add
    #identify the hat to be added to cart
    @hat = Hat.find params[:hat_id]
    #sets the hat to cart_item
    cart_item = @cart.cart_items.find_by hat_id: @hat.id

    if cart_item.present?
      #if the hat is already present in the cart, increase quantity by 1
      cart_item.quantity += 1
      cart_item.save
    else
      #creates new CartItem with given attributes
      CartItem.create cart: @cart, hat: @hat, price: @hat.price
    end
    @cart.price = @cart.cart_items.map{|cart_item| cart_item.price_in_cents * cart_item.quantity}.sum
    @cart.save
    redirect_to shopping_cart_path
  end

  def remove
    @hat = Hat.find params[:hat_id]

    cart_item = @cart.cart_items.find_by(hat_id: @hat.id)
    cart_item.destroy
    @cart.price = @cart.cart_items.map{|cart_item| cart_item.price_in_cents * cart_item.quantity}.sum
    @cart.save
    redirect_to shopping_cart_path
  end

  def show
  end
end
