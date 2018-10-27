# frozen_string_literal: true

class Lap < ApplicationRecord
  validates_presence_of :lap_number

  belongs_to :race, optional: true
end
