# == Schema Information
#
# Table name: resources
#
#  id                        :integer          not null, primary key
#  title                     :string(255)
#  url                       :string(255)
#  element_id                :integer
#  element_type              :integer
#  created_at                :datetime
#  updated_at                :datetime
#  site_specific_information :text
#

require File.expand_path('../../test_helper', __FILE__)

class ResourceTest < ActiveSupport::TestCase

  test "Our data is valid" do
    resource = create_resource
    assert resource.valid?
    assert !resource.new_record?
    assert_not_nil resource.project
  end
end
