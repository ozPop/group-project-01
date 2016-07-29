class Scraper
  attr_accessor :get_page

  def self.get_page(url)
    result = open(url)
    page_doc = Nokogiri::HTML(result)
    binding.pry
  end

  def self.get_page_part(page_doc, part)
    get_page(page_doc).css(part)
  end

  def get_destinations
    destinations = []

    binding.pry
    
  end


end

