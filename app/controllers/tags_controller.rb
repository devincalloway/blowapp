class TagsController < ApplicationController

  def show
    @page_title = "#{ t :records_with_tag } #{ params[:id] }"
    session[:admin] ? @posts = Post.tagged_with(params[:id]).by_date : @posts = Post.published.tagged_with(params[:id]).by_date
  end

end