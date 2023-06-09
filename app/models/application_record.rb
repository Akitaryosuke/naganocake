class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

def get_image(width,height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/noimage.png')
    image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
  end
  image.variant(resize_to_limit: [width, height]).processed
end

end
