require "cielo/api30/request/cielo_request"

module Cielo
  module API30
    module Request
      class CreateCardTokenRequest < CieloRequest
        attr_accessor :environment
        private :environment

        def initialize(merchant, environment)
          super(merchant)
          @environment = environment
        end

        def execute(card)
          uri = URI.parse([@environment.api, "1", "card"].join("/"))
          Cielo::API30::CreditCard.from_json(send_request("POST", uri, card))
        end
      end
    end
  end
end
