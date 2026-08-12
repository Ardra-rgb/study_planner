class TopicsController < ApplicationController

  def new
    @topic = Topic.new
    @subject = Subject.find(params[:subject_id])
  end

  def create
    @subject = Subject.find(params[:subject_id])
    @topic = @subject.topics.build(topic_params)

    if @topic.save
      redirect_to subject_path(@subject)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:name)
  end

end