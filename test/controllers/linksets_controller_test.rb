require 'test_helper'

class LinksetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @linkset = linksets(:one)
  end

  test "should get index" do
    get linksets_url
    assert_response :success
  end

  test "should get new" do
    get new_linkset_url
    assert_response :success
  end

  test "should create linkset" do
    assert_difference('Linkset.count') do
      post linksets_url, params: { linkset: { campaign_id: @linkset.campaign_id, name: @linkset.name } }
    end

    assert_redirected_to linkset_url(Linkset.last)
  end

  test "should show linkset" do
    get linkset_url(@linkset)
    assert_response :success
  end

  test "should get edit" do
    get edit_linkset_url(@linkset)
    assert_response :success
  end

  test "should update linkset" do
    patch linkset_url(@linkset), params: { linkset: { campaign_id: @linkset.campaign_id, name: @linkset.name } }
    assert_redirected_to linkset_url(@linkset)
  end

  test "should destroy linkset" do
    assert_difference('Linkset.count', -1) do
      delete linkset_url(@linkset)
    end

    assert_redirected_to linksets_url
  end
end
