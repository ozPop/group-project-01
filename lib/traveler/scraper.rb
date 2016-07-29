class Scraper
  attr_accessor :get_page, :list_titles, :selected_post

  def self.get_page
    url = "http://jacquesmattheij.com/"
    result = open(url)
    page_doc = Nokogiri::HTML(result)
    headers = page_doc.css("div.blog-index header h2 a").text
    anchors = page_doc.css("#main article div.blog-index header h2 a").attribute("href").value

    result = []
    page_doc.css("div.blog-index header").each do |header|
      result << {
        :header => header.css("h2 a").text,
        :post_link => header.css("h2 a").attribute("href").value
      }
    end
    
    result
  end

  def self.format_page_result
    result = get_page
    counter = 0
    @list_titles = result.each do |hash|
      hash.each do |k, v|
        if k == :header
          counter += 1
          puts "#{counter}. #{v}"
        end
      end
    end
    @list_titles 
  end

  def self.select_post
    puts "Please enter the number of the blog post you would like to read: "
    answer = gets.chomp.to_i
    @selected_post = @list_titles[answer - 1][:post_link]
    # self.use_selected_url
  end
  
  def self.use_selected_url
    url = "http://jacquesmattheij.com/"
    result = open(@selected_post)
    page_doc = Nokogiri::HTML(result)
    header = page_doc.css("h2.entry-title").text
    body = page_doc.css("div.entry-content").text
    puts header
    puts body
    # binding.pry
  end
  # def self.get_page(url)
  #   result = open(url)
  #   page_doc = Nokogiri::HTML(result)
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

