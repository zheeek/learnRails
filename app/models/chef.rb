class Chef < ActiveRecord::Base
   validates :name, presence: true
end
