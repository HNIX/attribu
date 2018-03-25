require 'test_helper'

class UserCampaignsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_campaign = user_campaigns(:one)
  end

  test "should get index" do
    get user_campaigns_url
    assert_response :success
  end

  test "should get new" do
    get new_user_campaign_url
    assert_response :success
  end

  test "should create user_campaign" do
    assert_difference('UserCampaign.count') do
      post user_campaigns_url, params: { user_campaign: { campaign_id: @user_campaign.campaign_id, user_id: @user_campaign.user_id } }
    end

    assert_redirected_to user_campaign_url(UserCampaign.last)
  end

  test "should show user_campaign" do
    get user_campaign_url(@user_campaign)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_campaign_url(@user_campaign)
    assert_response :success
  end

  test "should update user_campaign" do
    patch user_campaign_url(@user_campaign), params: { user_campaign: { campaign_id: @user_campaign.campaign_id, user_id: @user_campaign.user_id } }
    assert_redirected_to user_campaign_url(@user_campaign)
  end

  test "should destroy user_campaign" do
    assert_difference('UserCampaign.count', -1) do
      delete user_campaign_url(@user_campaign)
    end

    assert_redirected_to user_campaigns_url
  end
end
