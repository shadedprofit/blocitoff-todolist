class ItemsController < ApplicationController
  def index
  end

  def edit
  end

  def show
  end

  def update

  end

  def create
    @user = User.find(params[:user_id])
    @item = current_user.items.build( item_params )
    @item.user = @user
    @new_item = Item.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
