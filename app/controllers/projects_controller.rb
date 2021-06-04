class ProjectsController < ApplicationController
  load_and_authorize_resource
  # before_action :authenticate_user! , except: [:index,:show]


  def index 
    @projects=Project.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def new
  end

  def create
    @project.users << current_user
    if @project.save
      flash[:notice]="Project created successfully"
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def edit 

  end

  def update
    if @project.update(project_params)
      flash[:notice]="Project updated successfully"
      redirect_to project_path
    else
      render "edit"
    end 
  end

  def destroy
    @project.destroy
    flash[:notice]="Project deleted successfully."
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name,:description,user_ids: [])
  end


end