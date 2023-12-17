class Api::ArticlesController < ApplicationController
  def generate
    svg = Rails.cache.fetch("medium_article_#{params[:username]}_#{params[:index]}", expires_in: 1.hour) do
      MediumArticleService.new(params[:username], params[:index]).call
    end

    respond_to do |format|
      format.svg { render inline: svg }
    end
  end
end