class SkiReport::Scraper

  def scrape_ots(state)
    Nokogiri::HTML(open("http://www.onthesnow.com/" + state_url_creator(state) + "/skireport.html?&ud=1&o=resort"))
  end

  def state_url_creator(state)
    state.gsub(/\s/, '-').downcase
  end

end