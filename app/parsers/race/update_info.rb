# frozen_string_literal: true

module Race
  class UpdateInfo
    def self.update(racer_info, lap_racer)
      if racer_info.time_best_lap > lap_racer.lap_duration
        racer_info.best_lap = lap_racer.lap.lap_number
        racer_info.time_best_lap = lap_racer.lap_duration
      end

      save_info(racer_info, lap_racer)
    end

    def self.save_info(racer_info, lap_racer)
      racer_info.number_laps = lap_racer.lap.lap_number
      racer_info.total_time += lap_racer.lap_duration
      racer_info.avg_speed = (racer_info.avg_speed + lap_racer.lap_speed) / 2
      racer_info.save!
    end
  end
end
