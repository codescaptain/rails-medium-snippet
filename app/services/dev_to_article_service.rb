class DevToArticleService < BaseService
  attr_accessor :username, :url, :index

  def initialize(username, index = 0)
    @username = username.split('@')[1]
    @index = index.nil? ? 0 : index
    @url = URI("https://api.rss2json.com/v1/api.json?rss_url=https://dev.to/feed/#{@username}")
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
    image_data = if image_url.present?
                   URI.open(image_url) { |f| f.read }
                 else
                   URI.open('https://dev-to-uploads.s3.amazonaws.com/uploads/logos/resized_logo_UQww2soKuUsjaOGNB38o.png') { |f| f.read }
                 end
    Base64.encode64(image_data).gsub("\n", '')

  end


  def categories_html
    categories_html = "<div class='category-container'>"
    @article_categories.each do |category|
      categories_html += "<span class = 'the-category'>#{category}</span>"
    end
    categories_html += "</div>"
  end

  def description
    @article_item['content'].gsub(/<\/?[^>]+(>|$)/, "").split('.').first
  end
end