class Stock < ApplicationRecord
    def self.new_lookup(stiker)
        client = IEX::Api::Client.new(
            publishable_token: Rails.application.credentials.iex[:pub_key],
            secret_token: Rails.application.credentials.iex[:sec_key],
            endpoint: 'https://sandbox.iexapis.com/v1'
        )
        client.price(stiker)
    end

end
