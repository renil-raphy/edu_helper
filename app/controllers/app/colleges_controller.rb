class App::CollegesController < App::ApplicationController
  before_action :set_university, :set_filters, :set_district, only: [:index]
  before_action :set_college, only: [:show]

  def index

    if @university.present?
      colleges = @university.colleges.includes(:district, college_courses: :course).where(id: @district_college_ids)
    else
      colleges = College.includes(:district, :university, college_courses: :course).where(id: @district_college_ids)
    end

    @colleges = colleges.paginate(:page => page_number, :per_page => 25)
  end

  def show
  end

  private

  def set_university
    @university = University.where(slug: params["university_id"]).first
  end

  def set_filters
    @district_filter_hash = {}
    district_ids = @university.present? ? @university.colleges.pluck(:district_id) : District.ids
    District.where(id: district_ids).each {|district| (@district_filter_hash[district.slug] = district.name) }
  end

  def set_district
    @district = District.where(slug: params["district"]).first
    @district_college_ids = @district.present? ? @district.college_ids : College.ids
  end

end
