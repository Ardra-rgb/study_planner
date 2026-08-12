class ProgressController < ApplicationController

  def index
    @subjects = Subject.includes(:tasks)
  end

end