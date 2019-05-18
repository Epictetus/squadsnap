# Preview all emails at http://localhost:3000/rails/mailers/request_membership
class RequestMembershipPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/request_membership/membership
  def membership
    RequestMembershipMailer.membership
  end

end
