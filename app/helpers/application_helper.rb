module ApplicationHelper
  include Pagy::Frontend

    def alert_for(flash_type)
        { success: 'alert-success alert-dismissible fade show',
          error: 'alert-danger alert-dismissible fade show',
          alert: 'alert-warning alert-dismissible fade show',
          notice: 'alert-info alert-dismissible fade show'
        }[flash_type.to_sym] || flash_type.to_s
      end

    def form_image_select(post)
      if post.image.present?
         image_tag post.image, id: 'image-preview', class: 'img-responsive', width: '100%' 
      else
        image_tag 'kombi.jpg', id: 'image-preview', class: 'img-responsive', width: '100%' 
      end
      end

      def profile_avatar_select(user)
        if user.avatar.present?
         image_tag user.avatar, id: 'image-preview', class: 'img-responsive img-circle profile-image rounded-circle', width: '100%'  
        else
         image_tag 'hacker.png', id: 'image-preview', class: 'img-responsive img-circle profile-image rounded-circle', width: '100%' 
      end
    end
end
