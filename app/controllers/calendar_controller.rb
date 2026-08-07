class CalendarController < ApplicationController

  def index
    @subjects = Subject.where.not(exam_date: nil).order(:exam_date)
  end

end