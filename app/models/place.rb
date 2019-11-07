# frozen_string_literal: true

class Place < ActiveRecord::Base
  belongs_to :user
end
