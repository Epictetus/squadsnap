class RequestMembershipMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_membership_mailer.membership.subject
  #
  def membership
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
