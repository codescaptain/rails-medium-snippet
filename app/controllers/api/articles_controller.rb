class Api::ArticlesController < ApplicationController
  def generate
    svg = MediumArticleService.new(params[:username]).call

    respond_to do |format|
      format.svg { render inline: svg }
    end
  end
end