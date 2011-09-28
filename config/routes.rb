Refinery::Application.routes.draw do
  resources :newsletters, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :newsletters, :except => :show do
      collection do
        post :update_positions
      end
    end
  end

  # define newsletter_subscriptions
  get '/newsletter_subscription', :to => 'newsletter_subscriptions#new', :as => 'new_subscription'
  resources :newsletter_subscriptions,
            :only => [:create,:edit,:update],
            :as => :newsletter_subscriptions,
            :controller => 'newsletter_subscriptions' do
    collection do
      get :thank_you
      get :been_subscribed
    end
    member do
        get :activate_subscription
        get :unsubscribe
    end
  end

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :newsletter_subscriptions, :only => [:index, :show, :destroy] do
      collection do
        get :spam
        post :update_positions
      end
      member do
        get :toggle_spam
      end
    end
  end
end
