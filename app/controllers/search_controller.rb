class SearchController < ApplicationController
  def index
    @total, @stores = Store.get_stores(params["search"])
  end
end
