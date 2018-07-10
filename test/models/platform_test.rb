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

require 'test_helper'

class PlatformTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
