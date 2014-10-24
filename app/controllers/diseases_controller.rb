class DiseasesController < ApplicationController

  layout :sites_layout
  caches_action :show, :expires_in => 300, :cache_path => Proc.new { |c| c.params }

  def show
    if params[:location_id].present?
      case params[:location_id]
      when String
        @filter_by_location = params[:location_id].split('/')
      when Array
        @filter_by_location = params[:location_id]
      end
    end

    @carry_on_filters = {}
    @carry_on_filters[:location_id] = @filter_by_location if @filter_by_location.present?

    if params[:id].to_i <= 0
      render_404
      return
    end

    @data = Disease.find params[:id]

    projects_custom_find_options = {
      :disease      => @data.id,
      :per_page      => 10,
      :page          => params[:page],
      :order         => 'created_at DESC',
      :start_in_page => params[:start_in_page]
    }

    if @filter_by_location.present? && @site.navigate_by_regions? && @filter_by_location.size > 1
      projects_custom_find_options[:cluster_region_id] = @filter_by_location[1..-1].join(',').last
    elsif @filter_by_location.present? && @site.navigate_by_country? && @filter_by_location.size >= 1
      projects_custom_find_options[:cluster_country_id] = @filter_by_location.first
    end


    @projects = Project.custom_find @site, projects_custom_find_options

    @disease_project_count = @data.total_projects(@site, @filter_by_location)

    if @filter_by_location.present?
      @location_name = if @filter_by_location.size > 1
        region = Region.where(:id => @filter_by_location.last).first
        "#{region.country.name}/#{region.name}" rescue ''
      else
        "#{Country.where(:id => @filter_by_location.first).first.name}"
      end
      @filter_name = "#{@disease_project_count} projects in #{@location_name}"
    end

    respond_to do |format|
      format.html do
        
        carry_on_url = disease_path(@data, @carry_on_filters.merge(:location_id => ''))
        if @site.geographic_context_country_id
          location_filter = "where r.id = #{@filter_by_location.last}" if @filter_by_location

          # Get the data for the map depending on the region definition of the site (country or region)
          sql="select r.id,r.name,count(distinct pa.project_id) as count,r.center_lon as lon,r.center_lat as lat,r.name,
               CASE WHEN count(distinct pa.project_id) > 1 THEN
                 '#{carry_on_url}'||r.path
               ELSE
                 '/projects/'||array_to_string(array_agg(distinct pa.project_id),'')
               END as url,
               r.code,
              (select count(*) from data_denormalization where regions_ids && ('{'||r.id||'}')::integer[] and (end_date is null OR end_date > now()) and site_id=#{@site.id}) as total_in_region
              from regions as r
                inner join projects_regions as pr on r.id=pr.region_id and r.level=#{@site.level_for_region}
                inner join projects_sites as ps on pr.project_id=ps.project_id and ps.site_id=#{@site.id}
                inner join projects as p on ps.project_id=p.id and (p.end_date is null OR p.end_date > now())
                inner join diseases_projects as pa on pa.project_id=p.id and pa.disease_id=#{params[:id].sanitize_sql!.to_i}
                #{location_filter}
                group by r.id,r.name,lon,lat,r.name,r.code"
        elsif @filter_by_location.present? and @filter_by_location.size == 1
          sql = "select r.id,
                 count (distinct pa.project_id) as count,
                 r.name,
                 r.center_lon as lon,
                 r.center_lat as lat,
                 CASE WHEN count(distinct pa.project_id) > 1 THEN
                   '#{carry_on_url}'||r.path
                 ELSE
                   '/projects/'||(array_to_string(array_agg(distinct pa.project_id),''))
                 END AS url,
                 r.code,
                 (select count(*) from data_denormalization where regions_ids && ('{'||r.id||'}')::integer[] and (end_date is null OR end_date > now()) and site_id=#{@site.id}) as total_in_region
                 from projects_regions as pr
                 inner join projects_sites as ps on pr.project_id=ps.project_id and ps.site_id=#{@site.id}
                 inner join projects as p on pr.project_id=p.id and (p.end_date is NULL OR p.end_date > now())
                 inner join regions as r on pr.region_id=r.id and r.level=#{@site.levels_for_region.min} and r.country_id=#{@filter_by_location.first}
                 inner join diseases_projects as pa on pa.project_id=p.id and pa.disease_id=#{params[:id].sanitize_sql!.to_i}
                 group by r.id,r.name,lon,lat,r.code"   
        elsif @filter_by_location.present? and @filter_by_location.size > 1         
          sql = "select r.id,
                 count(distinct pa.project_id) as count,
                 r.name,
                 r.center_lon as lon,
                 r.center_lat as lat,
                 CASE WHEN count(distinct pa.project_id) > 1 THEN
                   '#{carry_on_url}'||r.path
                 ELSE
                   '/projects/'||(array_to_string(array_agg(distinct pa.project_id),''))
                 END AS url,
                 r.code
                 from projects_regions as pr
                 inner join projects_sites as ps on pr.project_id=ps.project_id and ps.site_id=#{@site.id}
                 inner join projects as p on pr.project_id=p.id and (p.end_date is NULL or p.end_date > now())
                 inner join regions as r on pr.region_id=r.id and r.level=#{@site.levels_for_region.min} and r.country_id=#{@filter_by_location.shift} and r.id in (#{@filter_by_location.join(',')})
                 inner join diseases_projects as pa on pa.project_id=p.id and pa.disease_id=#{params[:id].sanitize_sql!.to_i}
                 group by r.id,r.name,lon,lat,r.path,r.code"
        else
          location_filter = "where c.id = #{@filter_by_location.first}" if @filter_by_location
          sql="select c.id,c.name,count(distinct pa.project_id) as count,c.center_lon as lon,c.center_lat as lat,c.name,
                CASE WHEN count(distinct pa.project_id) > 1 THEN
                  '#{carry_on_url}'||c.id
                ELSE
                  '/projects/'||array_to_string(array_agg(distinct pa.project_id),'')
                END as url,
                c.code,
                (select count(*) from data_denormalization where countries_ids && ('{'||c.id||'}')::integer[] and (end_date is null OR end_date > now()) and site_id=#{@site.id}) as total_in_region
                from countries as c
                  inner join countries_projects as cp on c.id=cp.country_id
                  inner join projects_sites as ps on cp.project_id=ps.project_id and ps.site_id=#{@site.id}
                  inner join projects as p on ps.project_id=p.id and (p.end_date is null OR p.end_date > now())
                  inner join diseases_projects as pa on pa.project_id=p.id and pa.disease_id=#{params[:id].sanitize_sql!.to_i}
                  #{location_filter}
                  group by c.id,c.name,lon,lat,c.name"
        end



        result = ActiveRecord::Base.connection.execute(sql)

        @map_data = result.map do |r|
          uri = URI.parse(r['url'])
          params = Hash[uri.query.split('&').map{|p| p.split('=')}] rescue {}
          params['force_site_id'] = @site.id unless @site.published?
          uri.query = params.to_a.map{|p| p.join('=')}.join('&')
          r['url'] = uri.to_s
          r
        end.to_json
        @overview_map_chco = @site.theme.data[:overview_map_chco]
        @overview_map_chf = @site.theme.data[:overview_map_chf]
        @overview_map_marker_source = @site.theme.data[:overview_map_marker_source]

        areas= []
        data = []
        @map_data_max_count=0
        result.each do |c|
          areas << c["code"]
          data  << c["count"]
          if @map_data_max_count < c["count"].to_i
            @map_data_max_count = c["count"].to_i
          end
        end
        @chld = areas.join("|")
        # @chld = ""
        @chd  = "t:"+data.join(",")
        # @chd = ""
      end
      format.js do
        render :update do |page|
          page << "$('#projects_view_more').remove();"
          page << "$('#projects').html('#{escape_javascript(render(:partial => 'projects/projects'))}');"
          page << "IOM.ajax_pagination();"
          page << "resizeColumn();"
        end
      end
      format.csv do
        send_data Project.to_csv(@site, projects_custom_find_options),
          :type => 'text/plain; charset=utf-8; application/download',
          :disposition => "attachment; filename=#{@data.name.gsub(/[^0-9A-Za-z]/, '')}_projects.csv"

      end
      format.xls do
        send_data Project.to_excel(@site, projects_custom_find_options),
          :type        => 'application/vnd.ms-excel',
          :disposition => "attachment; filename=#{@data.name.gsub(/[^0-9A-Za-z]/, '')}_projects.xls"
      end
      format.kml do
        @projects_for_kml = Project.to_kml(@site, projects_custom_find_options)
      end
      format.json do
        render :json => Project.to_geojson(@site, projects_custom_find_options).map do |p|
          { projectName: p['project_name'],
            geoJSON: p['geojson']
          }
        end
      end

    end
  end

end
