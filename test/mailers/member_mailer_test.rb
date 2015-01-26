require 'test_helper'

class MemberMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "pw_new" do
    member = Member.find(1)
    mail = MemberMailer.pw_new(member).deliver
    assert !ActionMailer::Base.deliveries.empty?
    assert_equal "パスワード再設定"
    assert_equal "nami-piano@nifty.com",mail.to[0]
    assert_equal "webmaster@wings.msn.to",mail.from[0]
    assert_equal read_fixture('pw_new').join,mail.body.to_s
  end
end
