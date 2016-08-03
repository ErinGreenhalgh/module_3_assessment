class SearchController < ApplicationController
  def index
    @stores = CloseStore.all(params[:query])
  end

end
