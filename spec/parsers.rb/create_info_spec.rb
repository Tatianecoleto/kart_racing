# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateInfo do
  describe '.create' do
    let(:lap) { create(:lap) }
    let(:racer) { create(:racer) }
    let(:lap_racer) { create(:lap_racer, lap: lap, racer: racer) }

    context 'when there is no Race info created' do
      it do
        expect { described_class.create(racer, lap_racer) }.
          to change { RaceInfo.count }.by(1)
      end
    end
  end
end
