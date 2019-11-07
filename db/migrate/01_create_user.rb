# frozen_string_literal: true

class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |user|
      user.string :username
      user.string :email
      user.string :password_digest
    end
  end
end
