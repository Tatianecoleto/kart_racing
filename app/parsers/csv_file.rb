# frozen_string_literal: true

require 'time'

class CsvFile
  class << self
    def import(file)
      CSV.foreach(file.path, headers: true) do |row|
        Info.call(find_racer(row), create_lap_racer(row))
      end
    end

    private

    def create_lap_racer(row)
      LapRacer.create(racer: find_racer(row),
                      lap: find_lap(row),
                      lap_time: Time.parse(row[0]),
                      lap_duration: parse_lap_duration(row[4]),
                      lap_speed: row[5].tr(',', '.'))
    end

    def find_racer(row)
      Racer.where(name: row[2], code: row[1]).first_or_create
    end

    def find_lap(row)
      Lap.where(lap_number: row[3]).first_or_create
    end

    def parse_lap_duration(duration)
      minutes, seconds = duration.split(':')

      (minutes.to_f * 60) + seconds.to_f
    end
  end
end
