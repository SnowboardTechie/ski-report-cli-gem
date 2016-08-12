class SkiReport::Scraper

  def scrape_state(state)
    Nokogiri::HTML(open("http://www.onthesnow.com/" + state_url_creator(state) + "/skireport.html?&ud=1&o=resort"))
  end

  def state_url_creator(state)
    state.gsub(/\s/, '-').downcase
  end

  def scrape_resort(resort_url)
    Nokogiri::HTML(open("http://onthesnow.com" + resort_url))
  end

end