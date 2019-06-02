class RequestMembershipMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_membership_mailer.membership.subject
  #

  # will pass in member so we know the user, squad and member data. amazing.
  def membership(member)

    @membership = member.membership
    @subject = "#{@member.user.name}'s membership for #{@member.squad.name} has been #{@membership}."
    @body = "#{@member.user.name}'s membership for #{@member.squad.name} has been updated to #{@membership}."

    mail to: member.user.email,
         subject: @subject
  end
end
