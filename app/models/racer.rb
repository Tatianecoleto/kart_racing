# frozen_string_literal: true

class Racer < ApplicationRecord
  has_many :lap_racers
  has_many :laps, through: :lap_racers

  validates_presence_of :name
  validates_presence_of :code
end
