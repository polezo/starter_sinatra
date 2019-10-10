require "pry"
class RiderController < Sinatra::Base

    set :views, "app/views/rider"
    set :method_override, true

    get '/riders' do
        @rider = Rider.all

        erb :index
    end

    get '/riders/new' do 
        @colors = Bike.all.map {|bike| bike.color}.uniq
        erb :new
    end

    post '/riders' do
        binding.pry
        @name = params[:name]
        params[:has_membership] == "yes" ? @has_membership = true : @has_membership = false
        
        rider = Rider.create(name: @name, has_membership: @has_membership)

        redirect "/riders/#{rider.id}"

    end
    
    get '/riders/:id' do 
        @rider = Rider.find(params[:id])
        erb :show
    end

    patch '/riders/:id' do
        editee = Rider.find(params[:id])
       
        params[:has_membership] == "yes" ? @has_membership = !editee.has_membership : @has_membership = editee.has_membership

        editee.update(name: params[:name], has_membership: @has_membership)

        redirect "/riders/#{editee.id}"

    end

    get '/riders/edit/:id' do
        @rider = Rider.find(params[:id])

        erb :edit

    end

    delete '/riders/:id' do

        @rider = Rider.find(params[:id])
        @rider.destroy
        redirect "/riders"
    end
end
