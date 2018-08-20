class Rating < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :product
    
    validates :description, presence: true
    validates :rate, presence: true

end
