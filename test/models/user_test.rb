# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new(email: 'test@gmail.com', password: 'abc')
    assert user.valid?
  end

  test 'invalid without password' do
   user = User.new(email: 'test@gmail.com')
   refute user.valid?, 'user is valid without a password'
   assert_not_nil user.errors[:password], 'no validation error for password present'
 end

 test 'invalid without email' do
   user = User.new(password: 'abc')
   refute user.valid?
   assert_not_nil user.errors[:email]
 end
end
