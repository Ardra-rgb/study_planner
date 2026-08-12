class SubjectsController < ApplicationController

  def index

    if params[:search].present?

      @subjects =
        Subject.where(
          "name LIKE ?",
          "%#{params[:search]}%"
        )

    else

      @subjects = Subject.all

    end

  end

  def new
    @subject = Subject.new
  end
   

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      redirect_to subjects_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
  @subject = Subject.find(params[:id])

  if @subject.update(subject_params)
    redirect_to subjects_path
  else
    render :edit, status: :unprocessable_entity
  end
end 

 def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy

    redirect_to subjects_path
  end

  def show
    @subject = Subject.find(params[:id])
    @tasks = @subject.tasks

    @completed_tasks = @tasks.where(completed: true).count
    @progress =
      @tasks.count > 0 ? ((@completed_tasks.to_f / @tasks.count) * 100).round : 0
  end

  private

  def subject_params
    params.require(:subject).permit(
      :name,
      :description,
      :target_hours,
      :exam_date
    )
  end
 

end