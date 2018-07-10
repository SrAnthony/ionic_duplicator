# frozen_string_literal: true

# == Schema Information
#
# Table name: platforms
#
#  id           :bigint(8)        not null, primary key
#  name         :string(255)
#  package_id   :string(255)
#  version      :string(255)
#  app_id       :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  version_code :integer
#


# Modelo Plataform
class Platform < ApplicationRecord
  belongs_to :app
  has_one_attached :icon
  has_one_attached :splash
  has_one_attached :logo
end
