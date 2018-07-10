# == Schema Information
#
# Table name: apps
#
#  id                :bigint(8)        not null, primary key
#  name              :string(255)
#  color_primary     :string(255)
#  color_secondary   :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  short_description :string(255)
#  long_description  :text(65535)
#

require 'test_helper'

class AppTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
