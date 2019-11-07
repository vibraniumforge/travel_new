# frozen_string_literal: true

class AddPlaceToUser < ActiveRecord::Migration
  def change
    add_column :places, :user_id, :integer
  end
end
