module Admin
  class NewslettersController < Admin::BaseController
    crudify :newsletter, :sortable => false

    def index
      search_all_newsletters if searching?
      paginate_all_newsletters

      render :partial => 'newsletters' if request.xhr?
    end


    def create
      @newsletter = Newsletter.create(params[:newsletter])

      unless params[:insert]
        if @newsletter
          unless @newsletter.draft?
            if @newsletter.valid?
              number_of_sent_email = 0
              users = NewsletterSubscription.where("subscribed != ?", "").where(:unsubscribed => nil)
              users.each do |user|
                NewsletterMailer.newsletter_email(user,@newsletter).deliver
                number_of_sent_email += 1
                n = Newsletter.find(@newsletter)
                n.update_attributes(:emails_sent => number_of_sent_email)
              end

            else
              return render :action => 'new'
            end
          end
          flash.notice = t('created', :scope => 'refinery.crudify', :what => "#{@newsletter.title}")
          unless from_dialog?
            redirect_to :action => 'index'
          else
            render :text => "<script>parent.window.location = '#{admin_newsletters_url}';</script>"
          end
        else
          self.new # important for dialogs
          render :action => 'new'
        end
      else
        if @newsletter
          @newsletter_id = @newsletter.detect(&:persisted?).id
          @newsletter = nil
        end

        insert
      end
    end

    def update
      if @newsletter.update_attributes(params[:newsletter])
        (request.xhr? ? flash.now : flash).notice = t(
          'refinery.crudify.updated',
          :what => "'#{@newsletter.title}'"
        )
        unless @newsletter.draft?
          if @newsletter.email_sent_on == nil
            @newsletter.update_attributes(:email_sent_on => Time.now)
            number_of_sent_email = 0
            users = NewsletterSubscription.where("subscribed != ?", "").where(:unsubscribed => nil)
            users.each do |user|
              NewsletterMailer.newsletter_email(user,@newsletter).deliver
              number_of_sent_email += 1
              n = Newsletter.find(@newsletter)
              n.update_attributes(:emails_sent => number_of_sent_email)
            end
          end
        end

        unless from_dialog?
          unless params[:continue_editing] =~ /true|on|1/
            redirect_back_or_default(admin_newsletters_url)
          else
            unless request.xhr?
              redirect_to :back
            else
              render :partial => "/shared/message"
            end
          end
        else
          render :text => "<script>parent.window.location = '#{admin_newsletters_url}';</script>"
        end
      else
        unless request.xhr?
          render :action => 'edit'
        else
          render :partial => "/shared/admin/error_messages",
                 :locals => {
                   :object => @newsletter,
                   :include_object_name => true
                 }
        end
      end
    end


    protected
    def find_all_newsletters
      @newsletters = Newsletter.order("created_at DESC")
    end

  end
end