# :nodoc:
class UserMailer < ApplicationMailer
  def status_article_notification(article_id)
    @article = Article.find(article_id)
    @user = User.find(@article.user_id)
    mail(to: @user.email, subject: 'Article status')
  end

  def subscribers_notification(article_id, user_id)
    @article = Article.find(article_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: 'New Article!')
  end

  def test
    @text = 'kokoskadsd'
    mail(to: 'meisterofocode@gmail.com', subject: 'test!')
  end
end
