require 'test_helper'

class SourceLinksetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @source_linkset = source_linksets(:one)
  end

  test "should get index" do
    get source_linksets_url
    assert_response :success
  end

  test "should get new" do
    get new_source_linkset_url
    assert_response :success
  end

  test "should create source_linkset" do
    assert_difference('SourceLinkset.count') do
      post source_linksets_url, params: { source_linkset: { linkset_id: @source_linkset.linkset_id, source_id: @source_linkset.source_id } }
    end

    assert_redirected_to source_linkset_url(SourceLinkset.last)
  end

  test "should show source_linkset" do
    get source_linkset_url(@source_linkset)
    assert_response :success
  end

  test "should get edit" do
    get edit_source_linkset_url(@source_linkset)
    assert_response :success
  end

  test "should update source_linkset" do
    patch source_linkset_url(@source_linkset), params: { source_linkset: { linkset_id: @source_linkset.linkset_id, source_id: @source_linkset.source_id } }
    assert_redirected_to source_linkset_url(@source_linkset)
  end

  test "should destroy source_linkset" do
    assert_difference('SourceLinkset.count', -1) do
      delete source_linkset_url(@source_linkset)
    end

    assert_redirected_to source_linksets_url
  end
end
