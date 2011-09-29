class AddDraftToNewsletters < ActiveRecord::Migration
  def self.up
    add_column :newsletters, :draft, :boolean
    add_column :newsletters, :email_sent_on, :timestamp
  end

  def self.down
    remove_column :newsletters, :email_sent_on
    remove_column :newsletters, :draft
  end
end
