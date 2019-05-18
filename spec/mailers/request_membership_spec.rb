require "rails_helper"

RSpec.describe RequestMembershipMailer, type: :mailer do
  describe "membership" do
    let(:mail) { RequestMembershipMailer.membership }

    it "renders the headers" do
      expect(mail.subject).to eq("Membership")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
