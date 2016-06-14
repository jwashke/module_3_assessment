class StoresController < ApplicationController
  def show
    @store = Store.get_store(params[:id])
  end
end
