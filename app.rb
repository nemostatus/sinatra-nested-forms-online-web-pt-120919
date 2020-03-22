require './environment'

module FormsLab
  class App < Sinatra::Base

    get "/" do 
      erb :root 
    end 
    
    get "/new" do 
      erb :'pirates/new'
    end 
    
    post "/pirates" do 
         params["pirate"]["ships"].each do |ship|
        Ship.new(ship["name"], ship["type"], ship["booty"])
      end 
      @pirate = Pirate.new(params["pirate"]["name"],params["pirate"]["weight"],params["pirate"]["height"])
      @ships = Ship.all
 erb :'pirates/show'
    
end
  end
end
