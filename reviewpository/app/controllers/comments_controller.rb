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
    comment.like = 0
    comment.dislike = 0
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

  def like
    @comment = Comment.find(params[:id])
    @comment.like += 1
    @comment.save
    redirect_to(@comment.review.item)
  end

  def dislike
    @comment = Comment.find(params[:id])
    @comment.dislike += 1
    @comment.save
    redirect_to(@comment.review.item)
  end
end
