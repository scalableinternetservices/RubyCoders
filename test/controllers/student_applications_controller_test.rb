require 'test_helper'

class StudentApplicationsControllerTest < ActionController::TestCase
  setup do
    @student_application = student_applications(:one)
  end

  test "should get index" do
    sign_in students(:user1)
    get :index
    assert_response :success
    assert_not_nil assigns(:student_applications)
  end

  test "should get new" do
    sign_in students(:user1)
    get :new
    assert_response :success
  end

  test "should create student_application" do
    sign_in students(:user1)
    assert_difference('StudentApplication.count') do
      post :create, student_application: { student_id: @student_application.student_id, email_id: 'abcd@ucla.edu', gpa: 3.0, name: 'abcd', phone: 9802957521, address:'Santa Clara, CA' }
    end

    assert_redirected_to student_application_path(assigns(:student_application))
  end

  test "should show student_application" do
    sign_in students(:user1)
    get :show, id: @student_application
    assert_response :success
  end


    test "should get edit" do
      sign_in students(:user1)
      get :edit, id: @student_application
      assert_response :success
    end

    test "should update student_application" do
      sign_in students(:user1)
      patch :update, id: @student_application, student_application: { student_id: @student_application.student_id, email_id: @student_application.email_id, gpa: @student_application.gpa, name: @student_application.name, phone: @student_application.phone }
      assert_redirected_to student_application_path(assigns(:student_application))
    end

    test "should destroy student_application" do
      sign_in students(:user1)
      assert_difference('StudentApplication.count', -1) do
        delete :destroy, id: @student_application
      end

      assert_redirected_to student_applications_path
    end

end
