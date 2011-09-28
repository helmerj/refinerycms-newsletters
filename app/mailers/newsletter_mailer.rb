class NewsletterMailer < ActionMailer::Base

  def newsletter_email(user, newsletter)

    mail(:from => newsletter.email_from, :to => user.subscriber_email, :subject => newsletter.title) do |format|
      format.html { render :text => newsletter.email_body }
    end

  end

end