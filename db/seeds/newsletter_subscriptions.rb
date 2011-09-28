@page = Page.create(
  :title => 'Newsletter Subscriptions',
  :link_url => '/newsletter_subscription',
  :show_in_menu => false,
  :deletable => true,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => '^/newsletter_subscription(\/|\/.+?|)$'
)
Thread.current[:globalize_locale] = 'de'
@page.update_attribute(:title, "Newsletter Anmeldung")
Thread.current[:globalize_locale] = 'en'

thanks = Page.create(
  :title => 'Thank You',
  :parent_id => @page.id,
  :link_url => '/newsletter_subscription/thank_you',
  :show_in_menu => false,
  :deletable => true,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => '^/newsletter_subscription/thank_you(\/|\/.+?|)$'
)
Thread.current[:globalize_locale] = 'de'
thanks.update_attribute(:title, "Vielen Dank")
Thread.current[:globalize_locale] = 'en'


been_subscribed = Page.create(
  :title => 'You Have Successfully Been Subscribed.',
  :parent_id => @page.id,
  :link_url => '/newsletter_subscription/been_subscribed',
  :show_in_menu => false,
  :deletable => true,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => '^/newsletter_subscription/been_subscribed\/|\/.+?|)$'
)
Thread.current[:globalize_locale] = 'de'
been_subscribed.update_attribute(:title, "Sie haben sich erfolgreich angemeldet.")
Thread.current[:globalize_locale] = 'en'



Page.default_parts.each do |default_page_part|
  @page.parts.create(:title => default_page_part, :body => nil)
  thanks.parts.create(:title => default_page_part, :body => nil)
  been_subscribed.parts.create(:title => default_page_part, :body => nil)
end
