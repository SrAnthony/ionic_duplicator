# frozen_string_literal: true

# Modelo Plataform
class Platform < ApplicationRecord
  belongs_to :app
  has_one_attached :icon
  has_one_attached :splash
  has_one_attached :logo
end
