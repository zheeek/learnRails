class Recipe < ActiveRecord::Base
    belongs_to :chef
    validates :chef_id, presence: true 
    validates :name, presence: true , length:{minimum:4 , maximum:100}
    validates :summery, presence: true , length:{minimum:10 , maximum:150}
   validates :description, presence: true , length:{minimum:20 , maximum:200}

end