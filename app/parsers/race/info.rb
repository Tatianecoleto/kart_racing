# frozen_string_literal: true

module Race
  class Info
    def self.call(racer, lap_racer)
      racer_info = RaceInfo.find_by(racer: racer)

      if racer_info
        Race::UpdateInfo.update(racer_info, lap_racer)
      else
        Race::CreateInfo.create(racer, lap_racer)
      end
    end
  end
end
