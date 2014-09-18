# == Schema Information
#
# Table name: organizations
#
#  id                              :integer          not null, primary key
#  name                            :string(255)
#  description                     :text
#  budget                          :float
#  website                         :string(255)
#  national_staff                  :integer
#  twitter                         :string(255)
#  facebook                        :string(255)
#  hq_address                      :string(255)
#  contact_email                   :string(255)
#  contact_phone_number            :string(255)
#  donation_address                :string(255)
#  zip_code                        :string(255)
#  city                            :string(255)
#  state                           :string(255)
#  donation_phone_number           :string(255)
#  donation_website                :string(255)
#  site_specific_information       :text
#  created_at                      :datetime
#  updated_at                      :datetime
#  logo_file_name                  :string(255)
#  logo_content_type               :string(255)
#  logo_file_size                  :integer
#  logo_updated_at                 :datetime
#  international_staff             :string(255)
#  contact_name                    :string(255)
#  contact_position                :string(255)
#  contact_zip                     :string(255)
#  contact_city                    :string(255)
#  contact_state                   :string(255)
#  contact_country                 :string(255)
#  donation_country                :string(255)
#  estimated_people_reached        :integer
#  private_funding                 :float
#  usg_funding                     :float
#  other_funding                   :float
#  private_funding_spent           :float
#  usg_funding_spent               :float
#  other_funding_spent             :float
#  spent_funding_on_relief         :float
#  spent_funding_on_reconstruction :float
#  percen_relief                   :integer
#  percen_reconstruction           :integer
#  media_contact_name              :string(255)
#  media_contact_position          :string(255)
#  media_contact_phone_number      :string(255)
#  media_contact_email             :string(255)
#  main_data_contact_name          :string(255)
#  main_data_contact_position      :string(255)
#  main_data_contact_phone_number  :string(255)
#  main_data_contact_email         :string(255)
#  main_data_contact_zip           :string(255)
#  main_data_contact_city          :string(255)
#  main_data_contact_state         :string(255)
#  main_data_contact_country       :string(255)
#  organization_id                 :string(255)
#

require File.expand_path('../../test_helper', __FILE__)

class OrganizationTest < ActiveSupport::TestCase

  test "Our data is valid" do
    organization = create_organization
    assert organization.valid?
    assert !organization.new_record?
  end

  test "Organization specific_information" do
    organization = create_organization
    site = create_site :project_context_organization_id => organization.id

    assert_equal({}, organization.attributes_for_site(site))

    atts = {:name => "Organization name fro site #{site.id}"}
    organization.attributes_for_site = {:organization_values => atts, :site_id => site.id}

    assert organization.valid?

    assert_equal "Organization name fro site #{site.id}", organization.attributes_for_site(site)[:name]
  end

  test "organization projects_clusters_sectors of a site navigated by clusters" do
    spain    = create_country :name => 'Spain'
    valencia = create_region :name => 'Valencia', :country => spain
    madrid   = create_region :name => 'Madrid', :country => spain

    c1 = create_cluster
    c2 = create_cluster
    c3 = create_cluster

    organization1 = create_organization
    organization2 = create_organization

    p1 = create_project :name => 'P1', :primary_organization => organization1
    p2 = create_project :name => 'P2', :primary_organization => organization2
    p3 = create_project :name => 'P3', :primary_organization => organization1

    p1.clusters << c1
    p2.clusters << c2
    p3.clusters << c3
    p3.clusters << c1

    site1 = create_site :name => 'Food for Haiti 1', :project_context_organization_id => organization1.id, :project_context_cluster_id => nil, :url => 'http://site1.com'
    site2 = create_site :name => 'Food for Haiti 2', :project_context_organization_id => organization2.id, :project_context_cluster_id => nil, :url => 'http://site2.com'

    site1.reload
    site2.reload
    p1.reload
    p2.reload
    p3.reload

    assert_equal 2, organization1.projects_clusters_sectors(site1).size
    assert organization1.projects_clusters_sectors(site1).flatten.include?(c1)
    assert organization1.projects_clusters_sectors(site1).flatten.include?(c3)

    assert_equal 0, organization2.projects_clusters_sectors(site1).size

    assert_equal 0, organization1.projects_clusters_sectors(site2).size

    assert_equal 1, organization2.projects_clusters_sectors(site2).size
    assert organization2.projects_clusters_sectors(site2).flatten.include?(c2)

    p2.update_attribute(:end_date, Date.today.yesterday)
    assert_equal 0, organization2.projects_clusters_sectors(site2).size
  end

  test "organization projects_clusters_sectors of a site navigated by sectors" do
    spain    = create_country :name => 'Spain'
    valencia = create_region :name => 'Valencia', :country => spain
    madrid   = create_region :name => 'Madrid', :country => spain

    s1 = create_sector
    s2 = create_sector
    s3 = create_sector

    organization1 = create_organization
    organization2 = create_organization

    p1 = create_project :name => 'P1', :primary_organization => organization1
    p2 = create_project :name => 'P2', :primary_organization => organization2
    p3 = create_project :name => 'P3', :primary_organization => organization1

    p1.sectors << s1
    p2.sectors << s2
    p3.sectors << s3
    p3.sectors << s1

    site1 = create_site :name => 'Food for Haiti 1', :project_context_organization_id => organization1.id,
                        :project_context_cluster_id => nil, :url => 'http://site1.com',
                        :project_classification => 1
    site2 = create_site :name => 'Food for Haiti 2', :project_context_organization_id => organization2.id,
                        :project_context_cluster_id => nil, :url => 'http://site2.com',
                        :project_classification => 1

    site1.reload
    site2.reload
    p1.reload
    p2.reload
    p3.reload

    assert_equal 2, organization1.projects_clusters_sectors(site1).size
    assert organization1.projects_clusters_sectors(site1).flatten.include?(s1)
    assert organization1.projects_clusters_sectors(site1).flatten.include?(s3)

    assert_equal 0, organization2.projects_clusters_sectors(site1).size

    assert_equal 0, organization1.projects_clusters_sectors(site2).size

    assert_equal 1, organization2.projects_clusters_sectors(site2).size
    assert organization2.projects_clusters_sectors(site2).flatten.include?(s2)

    p2.update_attribute(:end_date, Date.today.yesterday)
    assert_equal 0, organization2.projects_clusters_sectors(site2).size
  end

  test "organization projects_regions of a site" do
    spain    = create_country :name => 'Spain'
    germany  = create_country :name => 'Germany'

    valencia = create_region :name => 'Valencia', :country => spain, :level => 1
    madrid   = create_region :name => 'Madrid', :country => spain,   :level => 1
    lerida   = create_region :name => 'Lerida', :country => spain,   :level => 2

    berlin   = create_region :name => 'Berlin', :country => germany, :level => 1
    dresden  = create_region :name => 'Berlin', :country => germany, :level => 2

    organization1 = create_organization
    organization2 = create_organization

    p1 = create_project :name => 'P1', :primary_organization => organization1
    p2 = create_project :name => 'P2', :primary_organization => organization2
    p3 = create_project :name => 'P3', :primary_organization => organization1

    p1.regions << valencia
    p1.regions << madrid
    p2.regions << berlin
    p2.regions << dresden
    p3.regions << valencia

    site1 = create_site :name => 'Food for Haiti 1', :project_context_organization_id => organization1.id, :project_context_cluster_id => nil, :url => 'http://site1.com'
    site2 = create_site :name => 'Food for Haiti 2', :project_context_organization_id => organization2.id, :project_context_cluster_id => nil, :url => 'http://site2.com'

    site1.reload
    site2.reload
    p1.reload
    p2.reload
    p3.reload

    assert_equal 2, organization1.projects_regions(site1).size
    assert organization1.projects_regions(site1).flatten.include?(valencia)
    assert organization1.projects_regions(site1).flatten.include?(madrid)
    assert_equal 0, organization1.projects_regions(site2).size

    assert_equal 0, organization2.projects_regions(site1).size
    assert_equal 1, organization2.projects_regions(site2).size
    assert organization2.projects_regions(site2).flatten.include?(berlin)

    p1.update_attribute(:end_date, Date.today.yesterday)
    assert_equal 1, organization1.projects_regions(site1).size
    assert organization1.projects_regions(site1).flatten.include?(valencia)
  end

  test "organization projects_count of a site" do
    spain    = create_country :name => 'Spain'
    valencia = create_region :name => 'Valencia', :country => spain
    madrid   = create_region :name => 'Madrid', :country => spain

    organization1 = create_organization
    organization2 = create_organization

    p1 = create_project :name => 'P1', :primary_organization => organization1
    p2 = create_project :name => 'P2', :primary_organization => organization2
    p3 = create_project :name => 'P3', :primary_organization => organization1

    site1 = create_site :name => 'Food for Haiti 1', :project_context_organization_id => organization1.id, :project_context_cluster_id => nil, :url => 'http://site1.com'
    site2 = create_site :name => 'Food for Haiti 2', :project_context_organization_id => organization2.id, :project_context_cluster_id => nil, :url => 'http://site2.com'

    site1.reload
    site2.reload
    p1.reload
    p2.reload
    p3.reload

    assert_equal 2, organization1.projects_count(site1)
    assert_equal 0, organization1.projects_count(site2)
    assert_equal 0, organization2.projects_count(site1)
    assert_equal 1, organization2.projects_count(site2)

    p1.update_attribute(:end_date, Date.today.yesterday)
    assert_equal 1, organization1.projects_count(site1)
  end

  test "organization budget is calculated for each site" do
    organization = create_organization
    site1 = create_site :name => 'Food for Haiti 1', :project_context_organization_id => organization.id, :project_context_cluster_id => nil, :url => 'http://site1.com'
    
    organization.sites << site1
    organization.update_attribute(:site_specific_information,
                                  { site1.id.to_s => 
                                    {
                                      private_funding: 10,
                                      usg_funding: 20,
                                      other_funding: 5
                                    }
                                  })
    organization.save
    organization.reload
    assert_equal 35, organization.budget(site1)
  end

  test "remove fundings" do
    organization = create_organization
    site1 = create_site :name => 'Food for Haiti 1', :project_context_organization_id => organization.id, :project_context_cluster_id => nil, :url => 'http://site1.com'
    
    organization.sites << site1
    organization.update_attribute(:site_specific_information,
                                  { site1.id.to_s => 
                                    {
                                      private_funding: 10,
                                      usg_funding: 20,
                                      other_funding: 5
                                    }
                                  })
    organization.update_attribute(:site_specific_information,
                                  { site1.id.to_s => 
                                    {
                                      private_funding: 0,
                                      usg_funding: '',
                                      other_funding: nil
                                    }
                                  })

    assert_equal 0, organization.budget(organization.sites.first)
  end

end
