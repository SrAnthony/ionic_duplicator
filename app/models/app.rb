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

class App < ApplicationRecord
  has_many :platforms, dependent: :destroy

  def android
    self.platforms.where(name: 'android').first
  end

  def ios
    self.platforms.where(name: 'ios').first
  end
end
