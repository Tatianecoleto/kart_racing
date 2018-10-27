# frozen_string_literal: true

class Race < ApplicationRecord
  validates_presence_of :name
end
