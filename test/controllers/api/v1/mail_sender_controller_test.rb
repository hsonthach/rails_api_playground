require "test_helper"

class Api::V1::MailSenderControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_mail_sender_create_url
    assert_response :success
  end
end
