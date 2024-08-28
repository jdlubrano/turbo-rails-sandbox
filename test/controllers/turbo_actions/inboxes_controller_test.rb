require "test_helper"

class TurboActions::InboxesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get turbo_actions_inboxes_index_url
    assert_response :success
  end

  test "should get show" do
    get turbo_actions_inboxes_show_url
    assert_response :success
  end

  test "should get edit" do
    get turbo_actions_inboxes_edit_url
    assert_response :success
  end

  test "should get update" do
    get turbo_actions_inboxes_update_url
    assert_response :success
  end
end
