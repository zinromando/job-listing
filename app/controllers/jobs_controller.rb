class JobsController < ApplicationController
  before_filter :authntication_user!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @jobs = Job.all
  end

  def new
    @job = job.new
  end

  def show
    @job = job.find(params[:id])
  end

  def edit
    @job = job.find(params[:id])
  end

  def create
    @job = job.new(job_params)
    if @group.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to jobs_path, notice: 'Update Sucess'
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to jobs_path, alert: 'Job deleted'
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end
end
