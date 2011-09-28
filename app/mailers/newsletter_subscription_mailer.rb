class NewsletterSubscriptionMailer < ActionMailer::Base
  default :from => "\"#{RefinerySetting[:site_name]}\" <support@web-now.de>"

  #def confirmation(subscriber)
  #  subject     t('confirmation_subject')
  #  recipients  subscriber.subscriber_email
  #  sent_on     Time.now
  #  content_type "text/html"
  #  @subscriber =  subscriber
  #end

  def welcome_email(subscriber)
    @subscriber = subscriber
    mail(:to => subscriber.subscriber_email, :subject => t('confirmation_subject'))
  end

end