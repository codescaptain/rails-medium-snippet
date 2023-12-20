class Api::ArticlesController < ApplicationController
  def generate
    svg = begin
            if params[:source] == "medium"
              Rails.cache.fetch("medium_article_#{params[:username]}_#{params[:index]}", expires_in: 1.hour) do
                MediumArticleService.new(params[:username], params[:index]).call
              end
            else
              DevToArticleService.new(params[:username], params[:index]).call
            end
          rescue StandardError => e
            Rails.logger.error("Error generating SVG: #{e.message}")
            nil
          end

    respond_to do |format|
      if svg
        format.svg { render inline: svg }
      else
        format.svg { render plain: "Error generating SVG", status: :internal_server_error }
      end
    end
  end
end
