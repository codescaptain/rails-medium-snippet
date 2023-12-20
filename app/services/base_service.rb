require_relative 'shared_styles'

class BaseService
  require 'base64'
  require 'open-uri'
  require 'net/http'

  def get_medium_articles(url)
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    response = https.request(request)
    JSON.parse(response.read_body)
  end

  def style
    SharedStyles.css_style
  end

  def src_link(text)
    text.match(/src=\"(.*?)\"/)&.captures&.first
  end
end