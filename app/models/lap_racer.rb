# frozen_string_literal: true

class LapRacer < ApplicationRecord
  belongs_to :racer
  belongs_to :lap

  validates_presence_of :lap_duration
  validates_presence_of :lap_time
  validates_presence_of :lap_speed
end
