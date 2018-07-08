# frozen_string_literal: true

# == Schema Information
#
# Table name: apps
#
#  id              :bigint(8)        not null, primary key
#  name            :string(255)
#  color_primary   :string(255)
#  color_secondary :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Modelo APP
class App < ApplicationRecord
  has_many :platforms, dependent: :destroy

  def android
    platforms.where(name: 'android').first
  end

  def ios
    platforms.where(name: 'ios').first
  end

  def package_id
    return android.package_id if android.present?
    return ios.package_id if ios.present?
    'No packages found'
  end
end
