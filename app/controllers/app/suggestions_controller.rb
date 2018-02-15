class App::SuggestionsController < App::ApplicationController
  before_action :set_university, :set_filters, :set_district, :set_courses, only: [:index]
  before_action :set_college, only: [:show]

  def index
    if current_user.user_categories.present?
      filtered_college_ids = @district_college_ids & @course_college_ids

      if @university.present?
        colleges = @university.colleges.includes(:district, college_courses: :course).where(id: filtered_college_ids)
      else
        colleges = College.includes(:district, :university, college_courses: :course).where(id: filtered_college_ids)
      end

      @colleges = colleges.paginate(:page => page_number, :per_page => 25)
    end
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

  def set_courses
    if current_user.user_categories.present?
      my_top_score = current_user.user_categories.maximum("total_weightage")
      puts 1111111111111111111111
      puts my_top_score
      my_category_ids = current_user.user_categories.where(total_weightage: my_top_score).pluck(:category_id)
      puts 2222222222222222222
      puts my_category_ids
      @course_ids = CourseCategory.where(category_id: my_category_ids).pluck(:course_id)
      @course_college_ids = CollegeCourse.where(course_id: @course_ids).pluck(:college_id).uniq
    end
  end
end
