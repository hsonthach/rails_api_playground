require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test 'welcome_email' do
    mail = UserMailer.welcome_email
    assert_equal 'Welcome to My Awesome Site', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
