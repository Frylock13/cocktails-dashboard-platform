module Imagable
  # This module helps to find and set image for object before it will be created
  extend ActiveSupport::Concern

  attr_reader :results

  def get_and_set_image
    # stop executing if image passes in params 
    return if image.present?

    response = get_api_response
    @results = get_filtered_array_of_results(response.body)
    self.image = try_to_upload_image
  end

  private

  def get_api_response
    encoded_url = URI.encode("http://api.ababeen.com/api/images.php?q=#{name} cocktail&count=100")
    response = HTTParty.get(encoded_url)
    response
  end

  def get_filtered_array_of_results(response_body)
    hash_results = eval(response_body)
    # filter by image format, to allow only .png
    filtered_array_results = hash_results.map { |x| x[:url] if x[:url].match(/.png/i) }.compact
    filtered_array_results
  end

  def try_to_upload_image(current_index=0)
    begin
      image = open(results[current_index])
    rescue
      # write to missed.log id of object which has an error(with an image probably)
      write_debug_info_to_log
    end

    image
  end

  def write_debug_info_to_log
    class_name = self.class.name
    object_id = self.class.last.id + 1

    file_path = Rails.root.join('log', 'missed.log')
    open(file_path, 'a') do |f|
      f.puts "#{class_name} - #{object_id}"
    end
  end
end