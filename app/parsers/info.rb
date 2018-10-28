# frozen_string_literal: true

class Info
  def self.call(racer, lap_racer)
    racer_info = RaceInfo.find_by(racer: racer)

    if racer_info
      UpdateInfo.update(racer_info, lap_racer)
    else
      CreateInfo.create(racer, lap_racer)
    end
  end
end
