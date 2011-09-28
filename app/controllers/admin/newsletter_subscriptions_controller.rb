module Admin
  class NewsletterSubscriptionsController < Admin::BaseController
    crudify :newsletter_subscription,
            :title_attribute => 'subscriber_email', :xhr_paging => true, :sortable => false


    protected
    def find_all_newsletter_subscriptions
      @newsletter_subscriptions = NewsletterSubscription.where("subscribed != ?", "").where(:unsubscribed => nil).order("created_at DESC")
    end

  end
end