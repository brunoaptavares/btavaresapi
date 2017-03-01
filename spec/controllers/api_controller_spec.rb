require 'rails_helper'

RSpec.describe ApiController, type: :controller do
    it 'get json from api' do
        expect(@controller.send(:getTweeps)).to be_truthy
    end
    
    it 'most mantions rules' do
        apiController = ApiController.new
        responsedJson = apiController.getTweeps

        tweets = apiController.parse_most_mentions(responsedJson)
        expect(tweets).to be_truthy
    end
    
    it 'most relevants rules' do
        apiController = ApiController.new
        responsedJson = apiController.getTweeps
        tweets = apiController.parse_most_relevants(responsedJson)
        
        expect(tweets).to be_truthy
    end    
end