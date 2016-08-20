module Imagable
  # This module helps to set image for object before it will be saved
  extend ActiveSupport::Concern

  included do
    before_create :set_image
  end

  def set_image
    response = HTTParty.get(URI.encode("http://api.ababeen.com/api/images.php?q=#{name} cocktail"))
    results = eval(response.body)
    self.image = open(results.first[:url])
  end
end