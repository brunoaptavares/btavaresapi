require 'rails_helper'

RSpec.describe UserTwitter do
    
    it 'new twitter user object' do
        usr_params = Hash.new
		usr_params[:id] = 1
		usr_params[:name] = "Bruno"
		usr_params[:followers] = 2
		usr_params[:tweets] = nil
		
        usr_twitter = UserTwitter.new(usr_params)

        expect(usr_twitter.id).to eq 1
        expect(usr_twitter.name).to eq "Bruno"
        expect(usr_twitter.followers).to eq 2
    end
end