require 'test_helper'

class HotelsControllerTest < ActionController::TestCase
  setup do
    @hotel = hotels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hotels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hotel" do
    assert_difference('Hotel.count') do
      post :create, hotel: { address: @hotel.address, city: @hotel.city, email: @hotel.email, free_breakfast: @hotel.free_breakfast, gym: @hotel.gym, hot_tub: @hotel.hot_tub, name: @hotel.name, phone: @hotel.phone, pool: @hotel.pool, state: @hotel.state, website: @hotel.website }
    end

    assert_redirected_to hotel_path(assigns(:hotel))
  end

  test "should show hotel" do
    get :show, id: @hotel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hotel
    assert_response :success
  end

  test "should update hotel" do
    put :update, id: @hotel, hotel: { address: @hotel.address, city: @hotel.city, email: @hotel.email, free_breakfast: @hotel.free_breakfast, gym: @hotel.gym, hot_tub: @hotel.hot_tub, name: @hotel.name, phone: @hotel.phone, pool: @hotel.pool, state: @hotel.state, website: @hotel.website }
    assert_redirected_to hotel_path(assigns(:hotel))
  end

  test "should destroy hotel" do
    assert_difference('Hotel.count', -1) do
      delete :destroy, id: @hotel
    end

    assert_redirected_to hotels_path
  end
end
