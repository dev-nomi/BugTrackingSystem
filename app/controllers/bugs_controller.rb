class BugsController < ApplicationController
  load_and_authorize_resource

  def index
    @bugs=Bug.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def new
    @project=Project.find(params[:id])
    session[:project]=@project
  end

  def show
  end

  def edit
  end

  def create 
    @project=session[:project]
    session[:project]=nil
    @bug.project_id = @project['id']
    @bug.users << current_user
    if @bug.save
      flash[:notice]="Bug created sucessfully"
      redirect_to bugs_path
    else
      render 'new'
    end
  end

  def update
    if @bug.update(bug_params)
      flash[:notice]="Bug updated successfully"
      redirect_to bugs_path
    else
      render "edit"
    end
  end

  def destroy
    @bug.destroy
    flash[:notice]="Bug deleted successfully."
    redirect_to bugs_path
  end

  private

  def bug_params
    params.require(:bug).permit(:title,:description,:screenshot,:bug_type,:status,:deadline,user_ids: [])
  end
  

end