require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
      set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  get '/failure' do
    erb :failure
  end


  helpers do #convention is to store these methods in application controller 
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end

