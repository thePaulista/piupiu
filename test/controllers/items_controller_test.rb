require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  test '#index' do
   # Item.create(name: 'Trump', description: "My hair is huge"  )
    get :index, format: :json #can specify which format, and override html

    items = JSON.parse(response.body)
    first_item = items.first #first b/c it's a collection)

    assert_response :success
    assert_equal "Kimchi", first_item["name"]
    assert_equal "Korean food", first_item["description"]
  end

    test "#show" do
    get :show, format: :json, id: Item.first.id

    item = JSON.parse(response.body) #not a collection, just one item
    assert_response :success
    assert_equal "Kimchi", item["name"]
    assert_equal "Korean food", item["description"]
  end
end
