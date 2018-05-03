# :nodoc:
class UserMailer < ApplicationMailer
  def status_article_notification(article)
    @article = article
    @user = @article.user
    mail(to: @user.email, subject: 'Article status')
  end
end