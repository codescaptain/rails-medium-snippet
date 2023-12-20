class MakeSvgService
  attr_accessor :base64_image, :style, :description, :title, :article_item, :published_date, :categories_html
  def initialize(base64_image, published_date, title, description, categories_html, style )
    @base64_image = base64_image
    @published_date = published_date
    @title = title
    @description = description
    @categories_html = categories_html
    @style = style
  end

  def call
    make_svg
  end

  private

  def make_svg
    <<-SVG
  <svg fill="none" width="350" height="450" xmlns="http://www.w3.org/2000/svg">
	<foreignObject width='100%' height='100%'>
    #{style}
		<div xmlns='http://www.w3.org/1999/xhtml'>
      <div class="container">
        <div class="flex-container" style="padding: 10px">
          <div class="">
            <img src='data:image/jpeg;base64,#{base64_image}' alt='' />
          <div class="pub-date">
               <span style="">#{published_date}</span>
          </div>
          </div>
          <div class="flex-col">
            <h2>#{title}</h2>
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
end