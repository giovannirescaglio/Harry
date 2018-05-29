require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new({
      first_name: 'Happy',
      last_name: 'The Team',
      email: 'hi@harry.team',
      password: 'harry2018',
    })
  end

  test 'Should persist user with valid parameters' do
    assert @user.save
  end

  test 'Should find persisted user in DB' do
    @user.save
    @persisted_user = User.find(@user.id)
    assert_equal @user.email, @persisted_user.email
  end

  test 'User password and password confirmation should be the same' do
    @user.password_confirmation = 'harry2081'
    assert_not @user.valid?
  end
end
