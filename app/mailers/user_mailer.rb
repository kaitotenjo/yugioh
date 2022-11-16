class UserMailer < ApplicationMailer
    def post_created
        @user = params[:user]
        # @post = params[:post]
        @greeting = "Hi"
        # attachments['oracle.png'] = File.read('app/assets/images/oracle.png')
        mail(
          to: @user.email, 
          cc: User.all.pluck(:email), 
          bcc: "secret@corsego.com", 
          subject: "New post created"
        )
    end

    def ordersuccess
        @user = params[:user]
        @order = params[:order]
        mail(
            
            to: email_address_with_name(@user.email,@user.name),
            subject: "New order created"
        )
    end
end
