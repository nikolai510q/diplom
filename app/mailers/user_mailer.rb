# :nodoc:
class UserMailer < ApplicationMailer
  def status_article_notification(article)
    @article = article
    @user = @article.user
    mail(to: @user.email, subject: 'Article status')
  end

  def subscriber_notification(article, subscriber)
    @subscriber = subscriber
    @article = article
    @user = @article.user
    mail(to: @subscriber.email, subject: 'Новость от автора из подписок')
  end
end
