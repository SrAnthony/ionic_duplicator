# frozen_string_literal: true
# == Schema Information
#
# Table name: apps
#
#  id                :bigint(8)        not null, primary key
#  name              :string(255)      not null
#  color_primary     :string(255)      not null
#  color_secondary   :string(255)      not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  short_description :string(255)
#  long_description  :text(65535)
#

class App < ApplicationRecord
  has_many :platforms, dependent: :destroy
  validates :name, :color_primary, :color_secondary, presence: true

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

  def icon
    return ios.icon if ios&.icon&.attached?
    return android.icon if android&.icon&.attached?
    'default'
  end

  def updated?
    true
  end
end
