require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  test '#index' do
    get :index

    assert_response :success
  end
end
