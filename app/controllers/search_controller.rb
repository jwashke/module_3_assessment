class SearchController < ApplicationController
  def index
    @stores, @total = Store.get_stores(params["search"])
  end
end
