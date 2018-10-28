require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test 'login with invalid information' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: {
      session: {
        email: '',
        password: ''
      }
    }
    assert_template 'sessions/new'
    assert_select 'div.alert.alert-danger', 'Invalid email/password combination'
    get root_path
    assert_select 'div.alert.alert-danger', false, 'Invalid email/password combination'
  end
end
