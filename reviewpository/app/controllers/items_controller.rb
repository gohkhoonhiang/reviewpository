class ItemsController < ApplicationController
  skip_before_action :require_login, :only => [:index, :search, :show]

  def index
    @items = Item.all.page(params[:page]).per(5)
  end

  def create
    item = current_user.items.new
    item.category = params[:category]
    item.name = params[:name]
    item.description = params[:description]
    item.save
    stakeholders = params[:stakeholder].split(",")
    stakeholders.each do |s|
      stakeholder = Stakeholder.new
      stakeholder.name = s
      stakeholder.item = item
      stakeholder.save
    end
    redirect_to "/items/listing"
  end

  def new
  end

  def edit
  end

  def show
    session[:back_url] = request.referer
    @item = Item.find(params[:id])
  end

  def update
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
    @my_items = Item.where(:user_id => current_user.id).page(params[:page]).per(5)
  end

  def reset
    session[:back_url] = ""
    session[:prev_search] = ""
    redirect_to items_listing_path
  end
end
