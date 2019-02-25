  class ArticlesController < ApplicationController
   before_action :find_article, only: [:show, :edit, :update, :destroy, :a1, :a2, :a3, :a4, :a5]


  def index
    if params[:category].blank?
    @articles = Article.all.order("created_at DESC")

  else
    @category_id = Category.find_by(name: params[:category]).id
    @articles = Article.where(:category_id => @category_id).order("created_at DESC")

  end
  end

  def new
    @article = Article.new
  end

  def show
   @article  = Article.find_by(id:params[:id])
   @article1 = Article.find_by(id:params[:id])
   @article2 = Article.find_by(id:params[:id])
   @article3 = Article.find_by(id:params[:id])
   @article4 = Article.find_by(id:params[:id])
   @article5 = Article.find_by(id:params[:id])
  end

  def a1
    json1 = File.read('app/assets/javascripts/article1.json')
    @article1 = JSON.parse(json1)
  end

  def a2
    json2 = File.read('app/assets/javascripts/article2.json')
    @article2 = JSON.parse(json2)
  end

  def a3
    json3 = File.read('app/assets/javascripts/article3.json')
    @article3 = JSON.parse(json3)
  end

  def a4
    json4 = File.read('app/assets/javascripts/article4.json')
    @article4 = JSON.parse(json4)
  end

  def a5
    json5 = File.read('app/assets/javascripts/article5.json')
    @article5 = JSON.parse(json5)
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      redirect_to root_path
    else
      render 'new'
  end
end

def edit

end


  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to root_path
    else
      render 'new'
  end
end



def edit
end

def update
  if @article.update(article_params)
    redirect_to article_path(@article)
  else
    render 'edit'
  end
end

def destroy
  @article.destroy
  redirect_to root_path
end

  private
      def article_params
        params.require(:article).permit(:title, :description, :writer)
      end

      def find_article
        @article = Article.find_by(id:params[:id])
      end
  end
