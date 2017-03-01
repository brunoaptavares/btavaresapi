class MostMentionsController < ApplicationController
    attr_reader :tweets
    
    def index
        
        Rails.logger.debug("MostMentionsController>index - Iniciando Busca de Twitts mais mencionados")

        apiController = ApiController.new
        responsedJson = apiController.getTweeps
        @tweets = apiController.parse_most_mentions(responsedJson)

        Rails.logger.debug("MostMentionsController>index - Finalizando Busca de Twitts mais mencionados")
        respond_to do |format|
            format.html
            format.json { render json: @tweets.to_json }
        end    
    end
end
