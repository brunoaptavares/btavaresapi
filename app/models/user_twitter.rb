#Classe que representa um usuário do Twitter
class UserTwitter
	attr_reader :id, :name, :followers, :url, :tweets

	def initialize(params)
		@id = params[:id]
		@name = params[:name]
		@followers = params[:followers]
		@url = params[:url]
		@tweets = params[:tweets]

	end
end