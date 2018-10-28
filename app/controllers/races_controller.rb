# frozen_string_literal: true
require 'csv'

class RacesController < ApplicationController

  def index
    @races = Race.all
  end

  def create
    @race = Race.new(race_params)

    ActiveRecord::Base.transaction do
      csv_file(params[:file])
      @race.save!
    end

    redirect_to @race
  end

  def show
    @race = Race.find(params[:id])
    @race_infos = RaceInfo.order(:total_time)
    @best_lap = RaceInfo.order(:time_best_lap).first.time_best_lap
  end

  private

  def csv_file(file)
    CSV.foreach(file.path, headers:true) do |row|
      racer = Racer.where(name: row[2], code: row[1]).first_or_create
      lap = Lap.where(lap_number: row[3]).first_or_create

      racer_lap = LapRacer.create(racer: racer,
                                  lap: lap,
                                  lap_time: row[0].to_datetime,
                                  lap_duration: parse_lap_duration(row[4]),
                                  lap_speed: row[5].gsub(',','.'))
      info_racing(racer, racer_lap)
    end
  end

  def info_racing(racer, racer_lap)
    racer_info = RaceInfo.find_by(racer: racer)

    if racer_info
      race_infos(racer_info, racer_lap)
    else
      create_race_info
    end
  end

  def race_infos(infos, racer_lap)
    if infos.time_best_lap > racer_lap.lap_duration
      infos.best_lap = racer_lap.lap.lap_number
      infos.time_best_lap = racer_lap.lap_duration
    end
    infos.number_laps = racer_lap.lap.lap_number
    infos.total_time += racer_lap.lap_duration
    infos.avg_speed = (infos.avg_speed + racer_lap.lap_speed)/2
    infos.save!
  end

  def create_race_info
    RaceInfo.create(racer: racer,
                       best_lap: racer_lap.lap.lap_number,
                       time_best_lap: racer_lap.lap_duration,
                       number_laps: racer_lap.lap.lap_number,
                       total_time: racer_lap.lap_duration,
                       avg_speed: racer_lap.lap_speed)
    
  end

  def parse_lap_duration(duration)
    minutes, seconds = duration.split(':')

    (minutes.to_f * 60) + seconds.to_f
  end

  def race_params
    params.require(:race).permit(:name)
  end
end
