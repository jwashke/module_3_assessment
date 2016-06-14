class Api::V1::ItemsController < Api::V1::ApiController
  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    respond_with(@item, status: 204)
  end
end
