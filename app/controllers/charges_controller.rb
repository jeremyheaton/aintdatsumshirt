class ChargesController < ApplicationController
  
  def charge
  
  end
  
  def new
    
  end

  def create
    @charge = Charge.new()
    @amount = 500

    customer = Stripe::Customer.create(
    :email => 'example@stripe.com',
    :card  => params[:stripeToken]
    )
    @charge.customer_charge_id = customer.id
    @charge.user_id = current_user.id
   if !@charge.save
      @error = @charge.errors.full_messages.join('. ')
   end
  
   
logger.debug customer
    charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd',
    )

 

  
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
     logger.debug e.message
    redirect_to charges_path
    end
   
end
