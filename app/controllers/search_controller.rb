class SearchController < ApplicationController
  def go
    object = params[:object]
    object_class = object.camelize.constantize
    @objects = object_class.search(params[:query])
  end
end
