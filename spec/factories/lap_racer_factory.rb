# frozen_string_literal: true

FactoryBot.define do
  factory :racer_lap do
    number_lap { 4 }
    lap_time { '2:00:00' }
    avg_speed { 44.275 }
  end
end
