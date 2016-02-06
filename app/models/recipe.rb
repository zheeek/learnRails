class Recipe < ActiveRecord::Base
    belongs_to :chef
    has_many :likes
    validates :chef_id, presence: true 
    validates :name, presence: true , length:{minimum:4 , maximum:100}
    validates :summery, presence: true , length:{minimum:10 , maximum:150}
   validates :description, presence: true , length:{minimum:20 , maximum:200}
    mount_uploader :picture , PictureUploader 
    validate :picture_size
    default_scope -> {order(updated_at: :desc)}
    
     def total_likes_thubms_up
        self.likes.where(like: true).size
     end
     def total_likes_thubms_down
        self.likes.where(like: false).size
     end
    private
        def picture_size
            if picture.size > 5.megabytes
                errors.add :picture ,'should be less than 5 megabytes'
            end
        end
end