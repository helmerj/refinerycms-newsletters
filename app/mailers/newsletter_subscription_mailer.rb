class NewsletterSubscriptionMailer < ActionMailer::Base
  default :from => "\"#{RefinerySetting[:site_name]}\" <support@web-now.de>"

  def welcome_email(subscriber)
    @subscriber = subscriber
    mail(:to => subscriber.subscriber_email, :subject => t('confirmation_subject'))
  end

end