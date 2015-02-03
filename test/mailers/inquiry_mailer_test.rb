require 'test_helper'

class InquiryMailerTest < ActionMailer::TestCase
  test "sendmail_confirm" do
    mail = InquiryMailer.sendmail_confirm
    assert_equal "Sendmail confirm", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
