class Bike < ActiveRecord::Base
    has_many :sessions
    has_many :riders, through: :sessions
end