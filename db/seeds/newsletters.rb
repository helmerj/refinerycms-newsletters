User.find(:all).each do |user|
  if user.plugins.find_by_name('newsletters').nil?
    user.plugins.create(:name => 'newsletters',
                        :position => (user.plugins.maximum(:position) || -1) +1)
  end
end

page = Page.create(
  :title => 'Newsletters',
  :link_url => '/newsletters',
  :show_in_menu => true,
  :deletable => false,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => '^/newsletters(\/|\/.+?|)$'
)
Thread.current[:globalize_locale] = 'de'
page.update_attribute(:title, "Newsletter")
Thread.current[:globalize_locale] = 'en'

Page.default_parts.each do |default_page_part|
  page.parts.create(:title => default_page_part, :body => nil)
end
