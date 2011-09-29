class CreateNewsletterSubscriptions < ActiveRecord::Migration

  def self.up
    create_table :newsletter_subscriptions do |t|
      t.string :subscriber_email
      t.string :token
      t.boolean :subscribed
      t.integer :position

      t.timestamps
    end

    add_index :newsletter_subscriptions, :id

    load(Rails.root.join('db', 'seeds', 'newsletter_subscriptions.rb'))
  end

  def self.down
    drop_table :newsletter_subscriptions
  end

end
