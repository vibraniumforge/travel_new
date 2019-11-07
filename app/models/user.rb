# frozen_string_literal: true

class User < ActiveRecord::Base
  has_many :places
  has_secure_password
end
