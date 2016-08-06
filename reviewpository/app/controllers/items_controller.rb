class ItemsController < ApplicationController
  skip_before_action :require_login, :only => [:index, :search, :show]

  def index
    @items = Item.all.page(params[:page]).per(5)
  end

  def create
    Item.transaction do
      @item = current_user.items.new
      if @item.update(item_params)
        stakeholders = item_params[:stakeholder].split(",")
        stakeholders.each do |s|
          @stakeholder = @item.stakeholders.new
          @stakeholder.name = s
          if !@stakeholder.save
            flash.now[:alert] = "Create stakeholder failed"
            render :new
            return
          end
        end
        flash[:notice] = "Item created"
        redirect_to user_items_url
      else
        flash.now[:alert] = "Create item failed"
        render :new
      end
    end
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
    session[:back_url] = request.referer
    @item = Item.find(params[:id])
  end

  def update
    Item.transaction do
      @item = Item.find(params[:id])
      if @item.update(item_params)
        Stakeholder.where(item_id: @item.id).delete_all
        stakeholders = item_params[:stakeholder].split(",")
        stakeholders.each do |s|
          @stakeholder = @item.stakeholders.new
          @stakeholder.name = s
          if !@stakeholder.save
            flash.now[:alert] = "Update stakeholder failed"
            render :edit
            return
          end
        end
        flash[:notice] = "Item updated"
        redirect_to item_url(@item)
      else
        flash.now[:alert] = "Update item failed"
        render :edit
      end
    end
  end

  def destroy
  end

  def search
  end

  def query
    keyword = params[:q]
    @items = Item.joins(:stakeholders).where('lower(items.name) like lower(?) or lower(items.description) like lower(?) or lower(stakeholders.name) like lower(?)', '%'+keyword+'%', '%'+keyword+'%', '%'+keyword+'%').distinct.page(params[:page]).per(5)
    session[:back_url] = request.referer
    session[:prev_search] = params[:q]
    render :index
  end

  def user_items
    @items = Item.where(:user_id => current_user.id).page(params[:page]).per(5)
  end

  def reset
    session[:back_url] = ""
    session[:prev_search] = ""
    redirect_to items_listing_path
  end

  private

  def item_params
    params.require(:item).permit(:category, :name, :description, :stakeholder, :image)
  end
end
