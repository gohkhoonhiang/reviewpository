class ItemsController < ApplicationController
  skip_before_action :require_login, :only => [:index, :search, :show]

  def index
    @items = Item.all
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
  end

  def update
  end

  def destroy
  end

  def search
  end

  def query
  end

  def user_items
  end
end
