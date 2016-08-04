class CommentsController < ApplicationController
  def index
  end

  def new
  end

  def create
    review = Review.find(params[:review_id])
    item = review.item
    comment = review.comments.new
    comment.content = params[:content]
    comment.user = current_user
    comment.save
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
