class Api::V1::AdapterController < ApplicationController
    skip_before_action :authorized, only: %i[fetch_bills]


    def fetch_bills
      bill_api_url = 'https://api.propublica.org/congress/v1/bills/upcoming/house.json'

        header =  {
            "X-API-Key": "zSbuRGW96UaVnIyWENZoHMaFq5lsTJgctPo7952M",
            "Content-Type": "application/json",
            "Access-Control-Allow-Origin": "*"
        }
        # TODO: adding content-type and accept to fix bug: SyntaxError: JSON.parse: unexpected character at line 1 column 1 of the JSON data
        bill_get_response =  RestClient.get(bill_api_url, header)

        parsed_bill = JSON.parse(bill_get_response.body)
        parsed_bill["results"][0]["bills"].each do |bill|

            Bill.find_or_create_by( chamber: bill["chamber"],
                                    bill_number:bill["bill_number"], 
                                    legislative_day: bill["legislative_day"], 
                                    description: bill["description"],
                                    bill_url: bill["bill_url"]
                                  )
                                  
        end
        render json: parsed_bill
    end

    
end
