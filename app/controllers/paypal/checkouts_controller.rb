class Paypal::CheckoutsController < ApplicationController
  include PayPal::SDK::REST

  def create
    payment = Payment.new({
      intent: 'sale',
      payer: {
        payment_method: 'paypal'
      },
      redirect_urls: {
        return_url: complete_paypal_checkouts_url,
        cancel_url: home_car_url
      },
      transactions:  [
        {
          amount: {
            total: (@shopping_cart.total/100),
            currency: 'USD',
          },
          description: 'Pago De Productos',
          item_list: {
            items: @shopping_cart.items
          }
        },
      ]
    })

    if payment.create
      redirect_url = payment.links.find{|v| v.rel == "approval_url" }.href

      redirect_to redirect_url
    else
      redirect_to home_car_path, alert: 'Problemas Con La Grabacion Por Favor Intentar Mas Tarde'
    end
  end

  def complete
    payment = Payment.find(params[:paymentId])
    if payment.execute(payer_id: params[:PayerID])  #return true or false
      cookies[:shopping_cart_id] = nill
      redirect_to root_path, notice: 'Thanks for purchasing!'
    else
      redirect_to home_car_path, alert: 'Problemas Con La Grabacion Por Favor Intentar Mas Tarde'
    end
  end
end
