# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user

  validates :name, :start_date, :end_date, presence: true
  scope :get_by_search_term, ->(search_term) { where(name: search_term) }
end
