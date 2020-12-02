class PagarViajeController < ApplicationController
    def main
      require 'active_merchant'

      # Use the TrustCommerce test servers
      ActiveMerchant::Billing::Base.mode = :test

      gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
                  :login => 'TestMerchant',
                  :password => 'password')


        # ActiveMerchant accepts all amounts as Integer values in cents
        amount = 1000  # $10.00

        # The card verification value is also known as CVV2, CVC2, or CID
      credit_card = ActiveMerchant::Billing::CreditCard.new(
        :first_name         => 'Steve',
        :last_name          => 'Smith',
        :month              => '9',
        :year               => '2022',
        :brand              => 'visa',
        :number             => '4242424242424242',
        :verification_value => '424')

        # Validating the card automatically detects the card type

        


    end


end
