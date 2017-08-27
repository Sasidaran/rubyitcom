class UsersController < ApplicationController
  load_and_authorize_resource
  
  # GET /users
  # GET /users.json
  def index
    

    @users = User.paginate(:page => params[:page], :per_page => 2)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def make_as_admin
    if params[:type].present?
      @user.roles.delete(Role.find_by_name('admin'))
    else
      @user.roles << Role.find_by_name('admin') 
    end
    @user.save
  end

  def logout
    reset_session
    @current_user = nil
    redirect_to new_user_session_path
  end

  def import
    User.import(params[:import_users][:file_upload])
    redirect_to users_path, notice: "Users are added"
  end

end
