# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Race, type: :model do
  describe 'validations' do
    context 'when creating' do
      it { should validate_presence_of(:name) }
    end
  end
end
