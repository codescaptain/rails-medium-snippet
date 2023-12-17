class MediumArticleService
  require 'base64'
  require 'open-uri'

  attr_accessor :username, :url, :index

  def initialize(username, index = 0)
    @username = username
    @index = index
    @url = URI("https://api.rss2json.com/v1/api.json?rss_url=https://medium.com/feed/#{@username}")
    @articles = get_medium_articles
  end

  def call
    make_svg
  end

  private

  def make_svg
    image_url = "https://cdn.pixabay.com/photo/2017/03/15/20/40/nature-2147400_1280.jpg"
    image_data =  URI.open(image_url) { |f| f.read }
    base64_image = Base64.encode64(image_data).gsub("\n", '')

    <<-SVG
<svg fill='none' width='600' height='250' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 600 250'>
	<foreignObject width='100%' height='100%'>
    #{style}
		<div xmlns='http://www.w3.org/1999/xhtml'>
      <div class="container">
        <div class="flex-container" style="padding: 5px">
          <div class="">
            <img src='data:image/jpeg;base64,#{base64_image}' alt='' />
          </div>
          <div class="flex-col">
            <h2>#{@articles['items'][0]['title']}</h2>
            <p>#{@articles['items'][0]['description'].gsub(/<\/?[^>]+(>|$)/, "").split('.').first}...</p>
          </div>
        </div>
      </div>
    </div>
  </foreignObject>
</svg>
    SVG
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
  }
  h2 {
    margin-bottom: 10px;
    text-align: center;
  }

  p {
    text-align: center;
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
}

.flex-col {
  flex-direction: column;
  display: flex;
  margin-left: 1rem;
}

h2 {
  margin-bottom: 0px;
}

    </style>
    CSS
  end
end