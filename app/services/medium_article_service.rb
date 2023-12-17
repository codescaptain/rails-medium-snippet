class MediumArticleService
  require 'base64'
  require 'open-uri'

  attr_accessor :username, :url, :index

  def initialize(username, index = 0)
    @username = username
    @index = index.nil? ? 0 : index
    @url = URI("https://api.rss2json.com/v1/api.json?rss_url=https://medium.com/feed/#{@username}")
    @articles = get_medium_articles
    @article_item = @articles['items'][index.to_i]
    @article_categories = @article_item['categories']
  end

  def call
    make_svg
  end

  private

  def make_svg
    <<-SVG
<svg fill='none' width='100%' height='100%' xmlns='http://www.w3.org/2000/svg'>
	<foreignObject width='100%' height='100%'>
    #{style}
		<div xmlns='http://www.w3.org/1999/xhtml'>
      <div class="container">
        <div class="flex-container" style="padding: 20px">
          <div class="pub-date">
               <span style="">#{@article_item['pubDate']}</span>
          </div>
          <div class="">
            <img src='data:image/jpeg;base64,#{base64_image}' alt='' />
          </div>
          <div class="flex-col">
            <h2>#{@article_item['title']}</h2>
            <p>#{description}...</p>
            #{categories_html}
          </div>
        </div>

      </div>
    </div>
  </foreignObject>
</svg>
    SVG
  end

  def base64_image
    image_url = src_link(@article_item['description'])
    image_data = URI.open(image_url) { |f| f.read }
    Base64.encode64(image_data).gsub("\n", '')
  end

  def src_link(text)
    text.match(/src=\"(.*?)\"/)&.captures&.first
  end

  def description
    @article_item['description'].gsub(/<\/?[^>]+(>|$)/, "").split('.').first
  end

  def categories_html
    categories_html= "<div class='category-container'>"
    @article_categories.each do |category|
      categories_html += "<span class = 'the-category'>#{category}</span>"
    end
    categories_html += "</div>"
  end

  def get_medium_articles
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)

    JSON.parse(response.read_body)
  end

  def style
    <<-CSS
      <style>
      @media (max-width: 480px) {
        .flex-container {
          display: flex;
          flex-direction: column;
          background-color: white;
          align-items: center;
          margin-top: 5px;
        }
        h2 {
          margin-bottom: 10px;
          text-align: center;
        }
      
        p {
          text-align: center;
         }
         
        .category-container{
            display: flex;
            align-items: center;
            justify-content: center;
        }
      }
  
        img {
          max-width: 150px;
          border-radius: 10px;
          margin-top: 20px;
        }
  
        .flex-container {
          display: flex;
          background-color: white;
          align-items: center;
          -webkit-box-shadow: 9px 10px 28px -7px rgba(128,112,128,0.71);
          -moz-box-shadow: 9px 10px 28px -7px rgba(128,112,128,0.71);
          box-shadow: 9px 10px 28px -7px rgba(128,112,128,0.71);
          border-radius:20px;
          max-width: 700px;
          position: relative;
        }
  
        .flex-col {
          flex-direction: column;
          display: flex;
          margin-left: 1rem;
        }
      
        h2 {
          margin-bottom: 0px;
        }
        
        .pub-date{
        left:25px;
        top:10px;
        position: absolute;
        font-weight: 900;
        }
    
        .category-container{
        display: flex;
        }
        
        .the-category{
          margin-left: 5px;
          padding-top: 2px;
          padding-bottom: 2px;
          padding-right: 5px;
          padding-left: 5px;
          border: solid 1px gray;
          border-radius: 3px;
          -webkit-box-shadow: 9px 10px 28px -7px rgba(128,112,128,0.71);
          -moz-box-shadow: 9px 10px 28px -7px rgba(128,112,128,0.71);
          box-shadow: 9px 10px 28px -7px rgba(128,112,128,0.71);
        }
      </style>
    CSS
  end
end