class Rider < ActiveRecord::Base
    has_many :sessions
    has_many :bikes, through: :sessions
end
