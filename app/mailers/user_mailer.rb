# :nodoc:
class UserMailer < ApplicationMailer
  def status_article_notification(article)
    @article = article
    @user = @article.user
    mail(to: @user.email, subject: 'Публикация статьи')
  end

  def subscriber_notification(article, subscriber)
    @subscriber = subscriber
    @article = article
    @user = @article.user
    mail(to: @subscriber.email, subject: 'Новость от автора из подписок')
  end

  def status_recording_notification(recordings_training)
    @recordings_training = recordings_training
    @user = @recordings_training.user
    mail(to: @user.email, subject: 'Подтверждение тренировки')
  end
end
