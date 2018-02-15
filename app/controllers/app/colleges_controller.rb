class App::CollegesController < App::ApplicationController
  before_action :set_university, :set_filters, :set_district, :set_course, only: [:index]
  before_action :set_college, only: [:show]

  def index
    filtered_college_ids = @district_college_ids & @course_college_ids

    if @university.present?
      colleges = @university.colleges.includes(:district, college_courses: :course).where(id: filtered_college_ids)
    else
      colleges = College.includes(:district, :university, college_courses: :course).where(id: filtered_college_ids)
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

  def set_course
    query_string = params[:query].to_s.strip
    query_string.gsub!(".","")

    if query_string.present?
      @course_ids = Course.where("lower(name) like ? ", "%#{query_string.downcase}%").ids
      @course_college_ids = CollegeCourse.where(course_id: @course_ids).pluck(:college_id).uniq
    else
      @course_ids = []
      @course_college_ids = College.ids
    end
  end

end
