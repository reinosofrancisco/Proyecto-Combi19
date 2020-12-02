Rails.configuration.stripe = {

  :publishable_key => 'pk_test_TYooMQauvdEDq54NiTphI7jx',
  :secret_key      => 'sk_test_4eC39HqLyjWDarjtT1zdp7dc'

  #Mala practica poner estas variables aca, pero es para testeo
  #:publishable_key => ENV['PUBLISHABLE_KEY'],
  #:secret_key      => ENV['SECRET_KEY']
  #PUBLISHABLE_KEY=pk_test_TYooMQauvdEDq54NiTphI7jx SECRET_KEY=sk_test_4eC39HqLyjWDarjtT1zdp7dc
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
