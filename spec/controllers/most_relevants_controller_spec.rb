require 'rails_helper'

RSpec.describe MostRelevantsController, type: :controller do
	it '200 status code' do
	    get :index
	    expect(response.status).to eq(200)
	end
end