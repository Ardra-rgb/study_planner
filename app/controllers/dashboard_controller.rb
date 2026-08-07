class DashboardController < ApplicationController

  def index
    @subjects = Subject.count
    @tasks = Task.count

    @completed = Task.where(completed: true).count
    @pending = Task.where(completed: false).count

    @upcoming = Subject.order(:exam_date).limit(5)
  end

end