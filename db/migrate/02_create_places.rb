# frozen_string_literal: true

class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |place|
      place.string :continent
      place.string :country
      place.string :state
      place.string :city
      place.text :notes
    end
  end
end
