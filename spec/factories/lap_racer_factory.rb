# frozen_string_literal: true

FactoryBot.define do
  factory :lap_racer do
    lap_time { '23:49:08' }
    lap_duration { '1:02' }
    lap_speed { 44.275 }
  end
end
