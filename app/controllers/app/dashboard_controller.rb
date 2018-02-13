class App::DashboardController < App::ApplicationController
  before_action :set_universities, only: [:index]

  def index
  end

  private

  def set_universities
    @universities = University.all
  end
end
