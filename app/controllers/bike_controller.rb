class BikeController < Sinatra::Base
    set :views, "app/views/bike"
    set :method_override, true

    get '/bikes' do 
        @bikes = Bike.all
        erb :index
    end

    get '/bikes/new' do
        @colors = Bike.all.map {|bike| bike.color}.uniq
        erb :new
    end

    post '/bikes' do
        @color = params[:color]
        @miles = params[:miles]

        @bike = Bike.create(
            color: @color,
            date_introduced: Time.now,miles: @miles 
        )

        redirect "/bikes/#{@bike.id}"
    end

    get '/bikes/:id' do 
        @bike = Bike.find(params[:id])
        erb :show
    end

    


    
end
