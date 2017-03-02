require 'date'

#Classe que representa um tweet de um usuário do Twitter
class Tweet
	attr_accessor :user, :url, :followers, :retweets, :likes, :text, :date

	def initialize(params)

		@user = params[:user]
		@url = params[:url]
		@followers = params[:followers]
		@retweets = params[:retweets]
		@likes = params[:likes]
		@text = params[:text]
		@date = params[:date]
	end
end