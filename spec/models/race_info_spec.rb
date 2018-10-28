# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RaceInfo, type: :model do
  describe 'validations' do
    context 'when creating' do
      it { should validate_presence_of(:best_lap) }
      it { should validate_presence_of(:time_best_lap) }
      it { should validate_presence_of(:number_laps) }
      it { should validate_presence_of(:total_time) }
      it { should validate_presence_of(:avg_speed) }
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:racer) }
  end
end
