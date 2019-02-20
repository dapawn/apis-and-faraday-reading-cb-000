class SearchesController < ApplicationController
  def search
  end

  def foursquare
    client_id = 'UZOHTHBW13S0BTZN4NX3YGV30YE2M3A0WNGHQFOJVPZK4XC1';
    client_secret = 'EHNL1LQ5Z52YMZTPCPDYMPREAIAJOUP0QFJB5WYPN1N1K00E';
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    body_hash = JSON.parse(@resp.body)
    @venues = body_hash["response"]["venues"]

    render 'search'

  end
end
