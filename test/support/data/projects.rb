module Iom
  module Data

    DEFAULT_PROJECT = :food_conservation

    def attributes_for_project(attributes_or_fixture = {})
      if attributes_or_fixture.is_a?(Hash)
        attributes = attributes_or_fixture
        fixture = DEFAULT_PROJECT
      else
        attributes = {}
        fixture = attributes_or_fixture
      end

      default_attributes = case fixture
        when :food_conservation
          organization = create_organization
          {
            :name => "Food Conservation",
            :description => "Food Conservation is a projet.....",
            :primary_organization => organization,
            :implementing_organization => organization.try(:name),
            :cross_cutting_issues => 'Issues defined',
            :start_date => Date.today.yesterday,
            :end_date => Date.today + 1.month,
            :budget => 250000,
            :target => 'Farmers',
            :stimated_people_reached => 12312,
            :contact_person => 'The Farmer',
            :contact_email => 'food_conservation@example.com',
            :contact_phone_number => '0031 345 03 23',
            :the_geom => MultiPoint.from_points([Point.from_lon_lat(-3.726489543914795, 40.453423411115494),  Point.from_lon_lat(-3.7259557843208313, 40.45303562320312), Point.from_lon_lat(3.726789951324463, 40.44353412028846)])
          }
        else
          raise "Invalid fixture name"
      end
      default_attributes.merge(attributes)
    end

    def new_project(attributes_or_fixture = {})
      Project.new(attributes_for_project(attributes_or_fixture))
    end

    def create_project(attributes_or_fixture = {})
      p = new_project(attributes_or_fixture)
      p.save
      p.reload
    end

  end
end