# frozen_string_literal: true

class RaceInfo < ApplicationRecord
  validates_presence_of :best_lap
  validates_presence_of :time_best_lap
  validates_presence_of :number_laps
  validates_presence_of :total_time
  validates_presence_of :avg_speed

  belongs_to :racer
end
