ActiveAdmin.register Article do
  actions :all, :except => [:new, :create]
  menu label: "Статьи"

  permit_params :header, :announce, :body, :approved, :user_id

  controller do

    def update
      article = Article.find(params[:id])
      ArticleService.update(article, article_params)
      redirect_to admin_articles_url
    end

    def article_params
      params.require(:article).permit!
    end
  end
end
