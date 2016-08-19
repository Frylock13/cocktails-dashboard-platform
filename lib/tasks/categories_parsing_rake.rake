namespace :parsing do
  desc "Import movie list"
  task categories: :environment do

    agent = Mechanize.new
    base_url = "http://www.socialandcocktail.co.uk/alcohol/"
    page = agent.get(base_url)

    Style.all.where('id > ?', 2).delete_all
    
    page.links.each do |link|
      link_string = link.uri.to_s
      next unless link_string.match(/\/alcohol\//) # if link doesn't contain 'alcohol'
      next if link_string.match(/\/page\//) # if link contains 'page'
      next if link_string.match(/other-base/) # if link contains 'Other Base'

      name = link.text
      slug = link.uri.to_s.split('/').last
      Style.create(name: name, slug: slug)

      puts "#{name}".green
      #sleep 0.05
    end
  end
end
