# it used instead callbacks
class ArticleService

  def self.update(article, params)
    # save article with new attributes
    article.assign_attributes(params)
    article.save!

    # send mail to article's author
    # UserMailer.status_article_notification(article.id).deliver_later unless article.approved.nil?
    # send mails to subscribers of article's categories
    if article.approved?
      UserMailer.status_article_notification(article).deliver_now
      article.user.followers.each do |subscriber|
        UserMailer.subscriber_notification(article, subscriber).deliver_now
      end
    end
  end
end
