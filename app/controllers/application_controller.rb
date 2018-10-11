require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }
  get '/' do
    erb :super_hero
  end
  
    get '/super_hero' do
    erb :"/views/super_hero"
  end
  
  post '/team' do
    @team = Team.new({name: params[:team][:name], motto: params[:team][:motto]})

    params[:team][:heroes].each {|hero| Superhero.new(hero)}
        @heroes=Superhero.all

    erb :team
  end

end
