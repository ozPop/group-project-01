class Cli

  def call
    puts "hello word "
    page = Scraper.format_page_result
    Scraper.select_post
    Scraper.use_selected_url
  end

end