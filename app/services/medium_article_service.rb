class MediumArticleService < BaseService
  attr_accessor :username, :url, :index

  def initialize(username, index = 0)
    @username = username
    @index = index.nil? ? 0 : index
    @url = URI("https://api.rss2json.com/v1/api.json?rss_url=https://medium.com/feed/#{@username}")
    @articles = get_medium_articles(@url)
    @article_item = @articles['items'][index.to_i]
    @article_categories = @article_item['categories']
  end

  def call
    make_svg
  end

  private

  def make_svg
    make_svg_service = MakeSvgService.new(base64_image,
                                          @article_item['pubDate'],
                                          @article_item['title'],
                                          description,
                                          categories_html,
                                          style)
    make_svg_service.call
  end

  def base64_image
    image_url = src_link(@article_item['description'])
    if image_url.present?
      image_data = URI.open(image_url) { |f| f.read }
      Base64.encode64(image_data).gsub("\n", '')
    end
  end

  def description
    @article_item['description'].gsub(/<\/?[^>]+(>|$)/, "").split('.').first
  end

  def categories_html
    categories_html = "<div class='category-container'>"
    @article_categories.each do |category|
      categories_html += "<span class = 'the-category'>#{category}</span>"
    end
    categories_html += "</div>"
  end
end