# it used instead callbacks
class RecordingsTrainingService

  def self.update(recordings_training, params)
    # save article with new attributes
    recordings_training.assign_attributes(params)
    recordings_training.save!

    # send mail to article's author
    # UserMailer.status_article_notification(article.id).deliver_later unless article.approved.nil?
    # send mails to subscribers of article's categories
    if recordings_training.approved?
      UserMailer.status_recording_notification(recordings_training).deliver_now
    end
  end
end
