require 'rubygems'
require 'open-uri'
require 'json'

#Classe que possui os métodos que vão manipular as informações retornadas da API do Twitter
class ApiController < ApplicationController
    
    # Contrutor
    def initialize
    	Rails.logger.debug("ApiController>initialize - Inicializando classe ApiController")
    	
    	@id_locaweb = 42
        @url = 'http://tweeps.locaweb.com.br/tweeps'
        @username = 'btavares@outlook.com'
    end
 
    # Método que busca as informações dos twitts na API do Twitter
    def getTweeps
    	Rails.logger.debug("ApiController>getTweeps - Buscando dados na API")
    	
		result_service = open(@url, "Username" => @username).read
		result = JSON.parse(result_service)['statuses']
		
		Rails.logger.debug("ApiController>getTweeps - Total de registros buscados: #{result.size}")
		return formatResult(result)
    end

	#Método responsável por favor o Parse dos twitts mais relevantes em um Objeto Tweet
	def parse_most_relevants(tweets_json)
		Rails.logger.debug("ApiController>parse_most_relevants - Iniciando Parse 'Mais Relevantes'")
		users_tweets = Array.new 

		tweets_json.each do |array_tweets|
			tweet_params = Hash.new
			tweet_params[:user]	     = array_tweets['user']['screen_name']
			tweet_params[:url]	     = "https://twitter.com/#{array_tweets['user']['screen_name']}/status/#{array_tweets['id']}" 
			tweet_params[:followers] = array_tweets['user']['followers_count']
			tweet_params[:retweets]  = array_tweets['retweet_count']
			tweet_params[:likes]	 = array_tweets['user']['favourites_count']
			tweet_params[:text]	     = array_tweets['text']
			tweet_params[:date]	     = array_tweets['created_at']

			tweet_obj = Tweet.new(tweet_params)
			users_tweets << tweet_obj
		end

		Rails.logger.debug("ApiController>parse_most_relevants - Total de registros parseados: #{users_tweets.size}")
		users_tweets
	end    
	
	#Método responsável por favor o Parse dos twitts mais mencionados em um Objeto Usuário do Twitter e seus Tweets
	def parse_most_mentions(tweets_json)
		Rails.logger.debug("ApiController>parse_most_mentions - Iniciando Parse 'Mais Mencionados'")
		tweets_json = tweets_json.group_by { |tw| tw['user']['id_str']}
		users_tweets = Array.new 

		tweets_json.each do |array_tweets|
			user_json = array_tweets[1][0]['user']
			user_tweets = Array.new
			
			usr_params = Hash.new
			usr_params[:id] 	   = user_json['id']
			usr_params[:name]      = user_json['screen_name']
			usr_params[:followers] = user_json['followers_count']			
			usr_params[:url]	   = "https://twitter.com/#{usr_params[:name]}" 
			
			array_tweets[1].each do |tw|
				tweet_params = Hash.new
				tweet_params[:user]      = usr_params[:name]
				tweet_params[:followers] = usr_params[:followers]
				tweet_params[:url]	     = "https://twitter.com/#{tw['user']['screen_name']}/status/#{tw['id']}" 
				tweet_params[:retweets]  = tw['retweet_count']
				tweet_params[:likes]	 = tw['user']['favourites_count']
				tweet_params[:text]	     = tw['text']
				tweet_params[:date]	     = tw['created_at']

				tweet = Tweet.new(tweet_params)
				user_tweets << tweet
			end
			
			usr_params[:tweets] = user_tweets
			user = UserTwitter.new(usr_params)
			users_tweets << user
		end
	
		Rails.logger.debug("ApiController>parse_most_mentions - Total de registros parseados: #{users_tweets.size}")
		users_tweets		
	end
	
	#Método responsável por filtrar os twitts que não mencionam e que não são próprios da LocaWeb e ordená-los.
	def formatResult(tweets_json)
		Rails.logger.debug("ApiController>formatResult - Iniciando Filtro e Ordenação")
		result = tweets_json.select do |tw|
			tw['in_reply_to_user_id'] != @id_locaweb and mentioned_user?(tw)
		end
		
		result = result.sort_by { |tw| [-tw['user']['followers_count'], -tw['retweet_count'], -tw['user']['favourites_count']]}
		return result
	end

	#Método que giltra os twitts da própria LocaWeb.
	def mentioned_user?(tw)	
		result = tw["entities"]["user_mentions"].select do |mt|
			mt["id"] == @id_locaweb
		end
		
		not result.empty?
	end
end