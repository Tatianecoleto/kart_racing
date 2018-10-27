# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Racer, type: :model do
  describe 'validations' do
    context 'when creating' do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:code) }
    end
  end

  describe 'associations' do
    it { should have_many(:lap_racers) }
    it { should have_many(:laps).through(:lap_racers) }
  end
end
