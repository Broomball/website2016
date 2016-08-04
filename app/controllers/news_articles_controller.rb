class NewsArticlesController < ApplicationController

  # GET /news_articles/1
  # GET /news_articles/1.json
  def show
    #TODO: Make lambda in model to make this quicker 
    @news_articles = NewsArticle.newslist
  end

  # GET /news_articles/new
  def new
    #@news_article = news_article.new
  end

  # GET /news_articles/1/edit
  def edit
  end

  # POST /news_articles
  # POST /news_articles.json
  def create
    @news_article = NewsArticle.new(news_article_params)

    respond_to do |format|
      if @news_article.save
        format.html { redirect_to @news_article, notice: 'news_article was successfully created.' }
        format.json { render :show, status: :created, location: @news_article }
      else
        format.html { render :new }
        format.json { render json: @news_article.errors, status: :unprocessable_entity }
      end
    end
    #TODO: Create photo folder for article in assets and set 
    #@news_article's picture_path attribute
  end

  # PATCH/PUT /news_articles/1
  # PATCH/PUT /news_articles/1.json
  def update
    respond_to do |format|
      if @news_article.update(news_article_params)
        format.html { redirect_to @news_article, notice: 'news_article was successfully updated.' }
        format.json { render :show, status: :ok, location: @news_article }
      else
        format.html { render :edit }
        format.json { render json: @news_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news_articles/1
  # DELETE /news_articles/1.json
  def destroy
    @news_article.destroy
    respond_to do |format|
      format.html { redirect_to news_articles_url, notice: 'news_article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news_article
      @news_article = news_article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_article_params
      params.require(:news_article).permit(:title, :short_description, :news_body)
    end
end
