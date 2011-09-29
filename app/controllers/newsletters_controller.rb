class NewslettersController < ApplicationController

  before_filter :find_all_newsletters
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @newsletter in the line below:
    present(@page)
  end

  def show
    @newsletter = Newsletter.find(params[:id])
    @all_newsletters = Newsletter.order("created_at DESC").limit(5)

    #render :text => @newsletter.email_body
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @newsletter in the line below:
    present(@page)
  end



protected

  def find_all_newsletters
    @newsletters = Newsletter.order("created_at DESC").where(:draft => false)
  end

  def find_page
    @page = Page.find_by_link_url("/newsletters")
  end

end
