class MostRelevantsController < ApplicationController
    attr_reader :tweets
    
    def index
        
        Rails.logger.debug("MostRelevantsController>index - Iniciando Busca de Twitts mais relevantes")
        
        apiController = ApiController.new
        responsedJson = apiController.getTweeps
        @tweets = apiController.parse_most_relevants(responsedJson)

        Rails.logger.debug("MostRelevantsController>index - Finalizando Busca de Twitts mais relevantes")
        respond_to do |format|
            format.html
            format.json { render json: @tweets.to_json }
        end    
    end
end
