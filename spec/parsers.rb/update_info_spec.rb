# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateInfo do
  describe '.update' do
    let(:lap) { create(:lap) }
    let(:racer) { create(:racer) }

    context 'when already have a RaceInfo created' do
      context 'when time_best_lap is smaller then new lap' do
        let(:lap_racer) do
          create(:lap_racer,
                 lap: lap,
                 racer: racer,
                 lap_speed: 40.000,
                 lap_duration: 10.321)
        end

        let(:race_info) do
          create(:race_info, racer: racer,
                             best_lap: 1,
                             total_time: 8.345,
                             time_best_lap: 8.345,
                             avg_speed: 13.000)
        end

        it 'only updates number_laps, total_time and avg_speed' do
          UpdateInfo.update(race_info, lap_racer)

          expect(race_info.reload).to have_attributes(
            racer_id: racer.id,
            best_lap: 1,
            time_best_lap: 8.345,
            number_laps: lap.lap_number,
            total_time: (8.345 + lap_racer.lap_duration),
            avg_speed: (13.000 + 40.000) / 2
          )
        end
      end
    end
  end
end
