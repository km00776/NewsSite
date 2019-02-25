class ReviewsController < ApplicationController
  before_action :find_article

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.article_id = @article.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  private

      def review_params
            params.require(:review).permit(:rating, :comment)
      end

      def find_article
        @article = Article.find(params[:article_id])
      end





end
