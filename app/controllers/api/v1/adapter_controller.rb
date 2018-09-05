class Api::V1::AdapterController < ApplicationController
    skip_before_action :authorized, only: %i[fetch_bills]


    def fetch_bills
      bill_api_url = 'https://api.propublica.org/congress/v1/bills/upcoming/house.json'

        header =  {
            'X-API-Key': 'zSbuRGW96UaVnIyWENZoHMaFq5lsTJgctPo7952M'
        }

        bill_get_response =  RestClient.get(bill_api_url, header)

        parsed_bill = JSON.parse(bill_get_response.body)
        # binding.pry

        # parsed_bill["results"][0]["bills"]

        # redirect_to 
    end

    
end
