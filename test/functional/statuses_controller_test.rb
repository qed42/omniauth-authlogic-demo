require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Status.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Status.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to statuses_url
  end
  
  def test_index
    get :index
    assert_template 'index'
  end
end
