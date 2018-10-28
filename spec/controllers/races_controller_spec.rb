# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RacesController, type: :controller do
  describe 'GET' do
    describe '#index' do
      before { get :index }

      it { assert_response 200 }
    end
  end
end
