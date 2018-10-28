# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CsvFile do
  describe '.import' do
    let(:race) { create(:race) }
    let(:csv_file) do
      File.new('spec/fixtures/import_kart_racing.csv')
    end

    before { allow(CSV).to receive(:foreach).and_return(race) }

    subject { described_class.import(csv_file) }

    it 'Race should be 1' do
      expect(Race.count).to eq(1)
    end
  end
end
