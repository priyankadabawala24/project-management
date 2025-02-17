class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_project, except: [:index]

  def index
    @projects = Project.all
    # Delete records with IDs 1, 2, and 3
    Project.where(id: [7,8]).destroy_all

  end

  def show
    @project_histories = @project.project_histories.order(created_at: :desc).includes(:user)
  end

  def update_status
    if current_user == @project.user || current_user.admin?
      if @project.change_status(params[:project][:status], current_user)
        flash[:notice] = "#{@project&.name} Status Updated"
      else
        flash[:alert] = "#{@project&.name} Status Failed."
      end
    else
      flash[:alert] = "Access Denied"
    end
    redirect_to project_url (@project)
  end

  def add_comment
    if @project.add_comment(params[:context], current_user)
      flash[:notice] = "#{@project&.name} Comment Added"
    else
      flash[:alert] = "#{@project&.name} Failed Comment"
    end
    redirect_to project_url(@project)
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end
end
