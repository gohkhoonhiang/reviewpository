class ReviewsController < ApplicationController
  def index
  end

  def new
  end

  def create
    item = Item.find(params[:item_id])
    review = item.reviews.new
    review.title = params[:title]
    review.content = params[:content]
    review.star = params[:star]
    review.user = current_user
    review.save
    redirect_to item_path(item)
  end

  def edit
  end
  
  def update
  end

  def show
  end

  def destroy
  end
end
