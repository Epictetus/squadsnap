class RequestMembershipMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_membership_mailer.membership.subject
  #

  # will pass in member so we know the user, squad and member data. amazing.
  def membership(member)
    @member = member.fetch(:member)
    @user = User.find(member.fetch(:member).user_id)
    @squad = Squad.find(member.fetch(:member).squad_id)
    @membership = @member.membership



    @subject = "Squadsnap: #{@squad.name} membership updated!"
    @body = "Your membership for #{@squad.name} has been updated to #{@membership}."

    # if membership was rejected then output different body
    if @membership == 'request'
      @subject = "Squadsnap: #{@squad.name} membership updated."
      @body = "You request for membership to #{@squad.name} has been rejected."
    end

    mail to: @member.user.email,
         subject: @subject
  end
end
