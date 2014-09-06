# == Schema Information
#
# Table name: pages
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  body        :text
#  site_id     :integer
#  published   :boolean
#  permalink   :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  parent_id   :integer
#  order_index :integer
#

require File.expand_path('../../test_helper', __FILE__)

class PageTest < ActiveSupport::TestCase

  test "Our data is valid" do
    page = create_page
    assert page.valid?
    assert !page.new_record?
    assert_equal 'faq', page.permalink
  end
end
