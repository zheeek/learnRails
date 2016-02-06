class Chef < ActiveRecord::Base
    has_many :recipes
    has_many :likes
    before_save {self.email = email.downcase} 
   validates :name, presence: true , length:{minimum:4 , maximum:100}
   VALID_EMAIL_REGEX  = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :email , presence: true , length:{minimum:10 , maximum:150} ,
                        uniqueness: {case_sensitive:false} , format:{with:VALID_EMAIL_REGEX}

end
