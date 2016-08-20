module Api
  class ImagesSearch

    attr_reader :object_name

    def initialize(object_name)
      @object_name = object_name
    end

    def call
      response = get_response
      results = get_filtered_array_of_results(response.body)
    end

    def get_response
      encoded_url = URI.encode("http://api.ababeen.com/api/images.php?q=#{object_name} cocktail&count=100")
      response = HTTParty.get(encoded_url)
      response
    end

    def get_filtered_array_of_results(response_body)
      hash_results = eval(response_body)
      # filter by image format, to allow only .png
      filtered_array_results = hash_results.map { |x| x[:url] if x[:url].match(/.png/i) }.compact
      filtered_array_results
    end
  end
end