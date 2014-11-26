module UsersHelper
  def image_for_admin_status(user)
    if user.is_admin
      image_tag('star.gif', :alt => 'Admin', :size => '16x16')
    end  
  end

  def get_image_profile(user)
    image_tag 'profile.gif', :alt => user.name, :class => 'profile'
  end
end
