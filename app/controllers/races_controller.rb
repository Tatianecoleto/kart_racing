# frozen_string_literal: true

require 'csv'

class RacesController < ApplicationController
  def index
    @races = Race.all
  end

  def create
    @race = Race.new(race_params)

    ActiveRecord::Base.transaction do
      CsvFile.import(params[:file])
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

  def race_params
    params.require(:race).permit(:name)
  end
end
