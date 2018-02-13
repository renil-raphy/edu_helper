class App::CollegesController < App::ApplicationController
  before_action :set_university, only: [:index]
  before_action :set_college, only: [:show]

  def index
    college_ids = @university.present? ? @university.college_ids : College.ids
    @colleges = College.includes(:district).where(id: college_ids).paginate(:page => page_number, :per_page => 25)
  end

  def show
  end

  private

  def set_university
    @university = University.where(slug: params["university_id"]).first
  end

end
