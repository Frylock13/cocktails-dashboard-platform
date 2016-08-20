class AbabeenApi
  include HTTParty
  base_uri 'api.ababeen.com/api/images.php?q='

  def initialize(service, page)
    @options = { query: {site: service, page: page} }
  end

  def questions
    self.class.get("/2.2/questions", @options)
  end

  def users
    self.class.get("/2.2/users", @options)
  end
end