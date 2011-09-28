class NewsletterSubscription < ActiveRecord::Base

  acts_as_indexed :fields => [:subscriber_email]
  
  before_create :initialize_token
    
  validates :subscriber_email, :presence => true
  validates :subscriber_email, :uniqueness => { :message => I18n.t('.email_uniqueness_error') }
  validates :subscriber_email, :format=> { :with =>  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  
  
  def initialize_token
    self.token ||= Guid.new.hexdigest
  end
  
  
  
end
