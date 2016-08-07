class ReviewsController < ApplicationController
  def index
  end

  def new
  end

  def create
    item = Item.find(params[:item_id])
    @review = item.reviews.new
    @review.title = params[:title]
    @review.content = params[:content]
    @review.star = params[:star]
    @review.like = 0
    @review.dislike = 0
    @review.user = current_user
    if @review.save
      flash[:notice] = "Review posted"
    else
      flash[:alert] = "Review posting failed. " + @review.errors.full_messages.join(", ")
    end
    redirect_to item_url(item)
  end

  def edit
  end
  
  def update
  end

  def show
  end

  def destroy
  end

  def like
    @review = Review.find(params[:id])
    @review.like += 1
    @review.save
    redirect_to(@review.item)
  end

  def dislike
    @review = Review.find(params[:id])
    @review.dislike += 1
    @review.save
    redirect_to(@review.item)
  end
end
