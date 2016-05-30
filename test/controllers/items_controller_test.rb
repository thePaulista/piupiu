require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  test '#index' do
   # Item.create(name: 'Trump', description: "My hair is huge"  ), using fixture instead
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

  test "#create" do
    assert_difference("Item.count", 1) do
      post :create, format: :json, item: { name: "Kimchi", description: "Fermented cabbage" }
    end

    item = JSON.parse(response.body)

    assert_response :success
    assert_equal "Kimchi", item["name"]
    assert_equal "Fermented cabbage", item["description"]
  end

  test "#update" do
    old_item = Item.create(name: "Mackerel", description: "Cold water fish")

    put :update, format: :json, id: old_item.id, item: { name: "Cod", description: "Meaty cold water fish" }

    updated_item = Item.find(old_item.id)

    assert_response :success
    assert_equal "Cod", updated_item.name
    assert_equal "Meaty cold water fish", updated_item.description
  end
end
