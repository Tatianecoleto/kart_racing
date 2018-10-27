# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LapRacer, type: :model do
  describe 'validations' do
    context 'when creating' do
      it { should validate_presence_of(:lap_time) }
      it { should validate_presence_of(:number_lap) }
      it { should validate_presence_of(:avg_speed) }
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:racer) }
    it { is_expected.to belong_to(:lap) }
  end
end
