require 'test_helper'

class CarouselPicturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @carousel_picture = carousel_pictures(:one)
  end

  test "should get index" do
    get carousel_pictures_url
    assert_response :success
  end

  test "should get new" do
    get new_carousel_picture_url
    assert_response :success
  end

  test "should create carousel_picture" do
    assert_difference('CarouselPicture.count') do
      post carousel_pictures_url, params: { carousel_picture: { description: @carousel_picture.description, picture: @carousel_picture.picture, title: @carousel_picture.title } }
    end

    assert_redirected_to carousel_picture_url(CarouselPicture.last)
  end

  test "should show carousel_picture" do
    get carousel_picture_url(@carousel_picture)
    assert_response :success
  end

  test "should get edit" do
    get edit_carousel_picture_url(@carousel_picture)
    assert_response :success
  end

  test "should update carousel_picture" do
    patch carousel_picture_url(@carousel_picture), params: { carousel_picture: { description: @carousel_picture.description, picture: @carousel_picture.picture, title: @carousel_picture.title } }
    assert_redirected_to carousel_picture_url(@carousel_picture)
  end

  test "should destroy carousel_picture" do
    assert_difference('CarouselPicture.count', -1) do
      delete carousel_picture_url(@carousel_picture)
    end

    assert_redirected_to carousel_pictures_url
  end
end
