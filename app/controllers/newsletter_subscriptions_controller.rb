class NewsletterSubscriptionsController < ApplicationController

  def thank_you
    @page = Page.find_by_link_url("/newsletter_subscription/thank_you", :include => [:parts, :slugs])
  end

  def been_subscribed
    @page = Page.find_by_link_url("/newsletter_subscription/been_subscribed", :include => [:parts, :slugs])
  end

 
  def new
    @newsletter_subscription = NewsletterSubscription.new
  end

  def create
    @newsletter_subscription = NewsletterSubscription.new(params[:newsletter_subscription])

    if @newsletter_subscription.save
        #if @newsletter_subscription.ham?
          NewsletterSubscriptionMailer.welcome_email(@newsletter_subscription).deliver
        #end
        redirect_to thank_you_newsletter_subscriptions_url
      else
        render :action => 'new'
      end
    end

  def activate_subscription
    @newsletter_subscription = NewsletterSubscription.find_by_token(params[:id]) || []
    if @newsletter_subscription.present?
      @newsletter_subscription.update_attributes(:subscribed => Time.now)
      redirect_to been_subscribed_newsletter_subscriptions_url
    end
  end

  def unsubscribe
    @newsletter_subscription = NewsletterSubscription.find_by_token(params[:id]) || []
    if @newsletter_subscription.present? && @newsletter_subscription.subscribed != nil
      @newsletter_subscription.update_attributes(:unsubscribed => Time.now)
      redirect_to root_url
    end
  end

  end
