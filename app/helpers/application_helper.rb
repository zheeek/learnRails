module ApplicationHelper
    def gravatar_for (chef , options = {size: 90 })
        gravatar_id = Digest::MD5::hexdigest(chef.email.downcase)
        size = options[:size]
        gravatar_url ="http://s.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url , alt: chef.name , class:"gravatar")
    end
end
