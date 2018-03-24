require 'test_helper'

class DestinationLinksetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @destination_linkset = destination_linksets(:one)
  end

  test "should get index" do
    get destination_linksets_url
    assert_response :success
  end

  test "should get new" do
    get new_destination_linkset_url
    assert_response :success
  end

  test "should create destination_linkset" do
    assert_difference('DestinationLinkset.count') do
      post destination_linksets_url, params: { destination_linkset: { destination_id: @destination_linkset.destination_id, linkset_id: @destination_linkset.linkset_id } }
    end

    assert_redirected_to destination_linkset_url(DestinationLinkset.last)
  end

  test "should show destination_linkset" do
    get destination_linkset_url(@destination_linkset)
    assert_response :success
  end

  test "should get edit" do
    get edit_destination_linkset_url(@destination_linkset)
    assert_response :success
  end

  test "should update destination_linkset" do
    patch destination_linkset_url(@destination_linkset), params: { destination_linkset: { destination_id: @destination_linkset.destination_id, linkset_id: @destination_linkset.linkset_id } }
    assert_redirected_to destination_linkset_url(@destination_linkset)
  end

  test "should destroy destination_linkset" do
    assert_difference('DestinationLinkset.count', -1) do
      delete destination_linkset_url(@destination_linkset)
    end

    assert_redirected_to destination_linksets_url
  end
end
