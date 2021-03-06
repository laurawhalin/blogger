class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    flash.notice = "The '#{@tag.name}' tag was deleted."

    redirect_to tags_path
  end

  before_filter :require_login, only: [:destroy]
end
