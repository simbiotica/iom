# == Schema Information
#
# Table name: media_resources
#
#  id                       :integer          not null, primary key
#  position                 :integer          default(0)
#  element_id               :integer
#  element_type             :integer
#  picture_file_name        :string(255)
#  picture_content_type     :string(255)
#  picture_filesize         :integer
#  picture_updated_at       :datetime
#  video_url                :string(255)
#  video_embed_html         :text
#  created_at               :datetime
#  updated_at               :datetime
#  caption                  :string(255)
#  video_thumb_file_name    :string(255)
#  video_thumb_content_type :string(255)
#  video_thumb_file_size    :integer
#  video_thumb_updated_at   :datetime
#

require File.expand_path('../../test_helper', __FILE__)

class MediaResourceTest < ActiveSupport::TestCase

  test "Our data is valid" do
    resource1 = create_media_resource :food_picture
    assert resource1.valid?
    assert !resource1.new_record?
    assert_not_nil resource1.project

    resource2 = new_media_resource :food_video
    resource2.element = create_organization
    resource2.save
    assert resource2.valid?
    assert !resource2.new_record?
    assert_not_nil resource2.organization
  end

  test "A resource is set to the last position when created" do
    resource1 = create_media_resource :food_picture
    assert_equal 0, resource1.position
    resource2 = new_media_resource :food_video
    resource2.element = resource1.project
    resource2.save
    assert_equal 1, resource2.position
  end

  test "A thumbnail is generated when saving a video video" do
    video_resource = new_media_resource :food_video
    assert video_resource.video_url
    assert video_resource.video_embed_html
    assert video_resource.video_thumb_file_name?
    assert_not_equal video_resource.video_thumb.url(:medium), '/video_thumbs/medium/missing.png'
    assert video_resource.video_thumb.size > 0
  end

end
