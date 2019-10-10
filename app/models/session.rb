class Session < ActiveRecord::Base
    belongs_to :rider
    belongs_to :bike
end
