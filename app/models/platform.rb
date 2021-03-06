# frozen_string_literal: true
# == Schema Information
#
# Table name: platforms
#
#  id           :bigint(8)        not null, primary key
#  name         :string(255)      not null
#  package_id   :string(255)      not null
#  version      :string(255)      not null
#  app_id       :bigint(8)        not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  version_code :integer          not null
#

# Modelo Plataform
class Platform < ApplicationRecord
  belongs_to :app
  has_one_attached :icon
  has_one_attached :splash
  has_one_attached :logo
  validates :name, :package_id, :version, :app_id, :version_code, presence: true

  def icon_or_default
    icon.attached? ? icon : 'default.png'
  end

  def splash_or_default
    splash.attached? ? splash : 'default.png'
  end

  def logo_or_default
    logo.attached? ? logo : 'default.png'
  end

  def updated?
    true
  end

  def beauty_name
    name == 'android' ? 'Android' : 'iOS'
  end

  # Para usar como ícones do semantic
  def name_icon
    name == 'android' ? 'android' : 'apple'
  end
end
