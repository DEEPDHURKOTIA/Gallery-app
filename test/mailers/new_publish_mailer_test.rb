require "test_helper"

class NewPublishMailerTest < ActionMailer::TestCase
  test "publish_mail" do
    mail = NewPublishMailer.publish_mail
    assert_equal "Publish mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
