class SearchController < ApplicationController
  def index
    @stores = CloseStore.all(params[:query])
    @total = CloseStore.total(params[:query])
  end

end
