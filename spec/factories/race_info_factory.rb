# frozen_string_literal: true

FactoryBot.define do
  factory :race_info do
    total_time { '23:49:08' }
    best_lap { 1 }
    time_best_lap { '1:02' }
    number_laps { 4 }
    avg_speed { 44.275 }
  end
end
