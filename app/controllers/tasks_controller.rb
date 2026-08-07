class TasksController < ApplicationController

  def new
    @task = Task.new(subject_id: params[:subject_id])
    @subjects = Subject.all
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to subjects_path
    else
      @subjects = Subject.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
    @subjects = Subject.all
  end
  def update
    @task = Task.find(params[:id])

      if @task.update(task_params)
        redirect_to subject_path(@task.subject)
      else
        @subjects = Subject.all
        render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])

    subject = @task.subject

    @task.destroy

    redirect_to subject_path(subject)
  end

  def toggle
    @task = Task.find(params[:id])

    @task.update(completed: !@task.completed)

    redirect_to subject_path(@task.subject)
  end

  private

  def task_params
    params.require(:task).permit(
      :title,
      :completed,
      :subject_id
    )
  end

end