class Scraper
  attr_accessor :get_page

  def self.get_page
    url = "http://jacquesmattheij.com/"
    result = open(url)
    page_doc = Nokogiri::HTML(result)
    part = "#main article div.blog-index header h2"
    headers = page_doc.css("div.blog-index header h2 a").text
    anchors = page_doc.css("#main article div.blog-index header h2 a").attribute("href").value

    result = []
    page_doc.css("div.blog-index header").each do |header|
      result << {
        :header => header.css("h2 a").text,
        :post_link => header.css("h2 a").attribute("href").value
      }
    end
    binding.pry
    result
  end

  def format_page_result
    
  end

  # def self.get_page(url)
  #   result = open(url)
  #   page_doc = Nokogiri::HTML(result)
  #   binding.pry
  # end

  # def self.get_page_part(page_doc, part)
  #   get_page(page_doc).css(part).text
  #   # binding.pry
  #   # get_page(page_doc).css(part)
  # end

  # def self.get_post_headers(url)
  #   continents = []
  #   headers = get_page_part(url, "#main article div.blog-index header h2")
  #   binding.pry
  #   # get_page_part(url, "div.menu-custom-container li#menu-item-2191").each do |destination|
  #   #   binding.pry
  #   #   continents << destination#destinations
  #   # end
  # end


end

