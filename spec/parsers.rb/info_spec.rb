# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Info do
  describe '.call' do
    let(:lap) { create(:lap) }
    let(:racer) { create(:racer) }
    let(:lap_racer) { create(:lap_racer, lap: lap, racer: racer) }
    let(:race_info) { create(:race_info, racer: racer) }

    context 'check if exists race info' do
      before { allow(RaceInfo).to receive(:find_by).and_return(race_info) }

      context 'when create' do
        before { allow(CreateInfo).to receive(:create).and_return(race_info) }

        it { expect(RaceInfo.count).to eq(1) }
      end

      context 'when update' do
        before { allow(UpdateInfo).to receive(:update).and_return(race_info) }

        it do
          expect { described_class.call(racer, lap_racer) }.
            to change { RaceInfo.count }.by(0)
        end
      end
    end
  end
end
