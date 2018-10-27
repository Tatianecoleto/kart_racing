# frozen_string_literal: true

class LapRacer < ApplicationRecord
  belongs_to :racer
  belongs_to :lap

  validates_presence_of :number_lap
  validates_presence_of :lap_time
  validates_presence_of :avg_speed
end
