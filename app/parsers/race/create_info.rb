# frozen_string_literal: true

module Race
  class CreateInfo
    def self.create(racer, lap_racer)
      RaceInfo.create(racer: racer,
                      best_lap: lap_racer.lap.lap_number,
                      time_best_lap: lap_racer.lap_duration,
                      number_laps: lap_racer.lap.lap_number,
                      total_time: lap_racer.lap_duration,
                      avg_speed: lap_racer.lap_speed)
    end
  end
end
