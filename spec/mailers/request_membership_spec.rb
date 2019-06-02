require "rails_helper"

RSpec.describe RequestMembershipMailer, type: :mailer do
  describe "membership" do
    let(:mail) { RequestMembershipMailer.membership }

    #it "renders the headers" do
    #  expect(mail.subject).to include("Squadsnap:")
    #  #expect(mail.to).to eq(["to@example.org"])
    #  expect(mail.from).to eq(["weteamsteve@gmail.com"])
    #end

    #it "renders the body" do
    #  expect(mail.body.encoded).to include("Your membership for")
    #end
  end

end
