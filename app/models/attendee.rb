# frozen_string_literal: true

class Attendee < ApplicationRecord
  belongs_to :event
  belongs_to :user
end
