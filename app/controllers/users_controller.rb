class UsersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html
  # GET /users
  # GET /users.json
  def index
    if current_user && current_user.admin? 
      @users = User.all
      respond_with users_path
    else
      flash[:notice] = 'You do not have rights to see the list of users.'
      redirect_to home_index_path
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if current_user && current_user.admin? 
      @user = User.find(params[:id])
      respond_with user_path(@user)
    else
      flash[:notice] = 'You do not have Admin see users information'
      redirect_to :back
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    if current_user && current_user.admin? 
      @user = User.new
      respond_with(@user)  
    else
      flash[:notice] = 'You do not have Admin rights to create a user'
      redirect_to users_path
    end
  end

  # GET /users/1/edit
  def edit
    if current_user && current_user.admin? 
      @user = User.find(params[:id])
      respond_with edit_user_path(@user)
    else
      flash[:notice] = 'You do not have Admin rights to edit a user'
      redirect_to users_path
    end
  end

  # POST /users
  # POST /users.json
  def create
    if current_user && current_user.admin? 
      @user = User.new(params[:user])
      if @user.save
        flash[:notice] = 'User was successfully created.'
        redirect_to user_path(@user)
      else
        respond_with(@user.errors, :status => :unprocessable_entity) do |format|
                format.html { render :action => :new }
        end
      end
    else
      flash[:notice] = 'You do not have Admin rights to create a user'
      redirect_to :back
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    if current_user && current_user.admin? 
      @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully created.'
        redirect_to user_path(@user)
      else
        respond_with(@user.errors, :status => :unprocessable_entity) do |format|
                format.html { render :action => :new }
        end
      end
    else
      flash[:notice] = 'You do not have Admin rights to update a user'
      redirect_to users_path
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if current_user && current_user.admin? 
      @user = User.find(params[:id])
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url }
        format.json { head :no_content }
      end
   else
     flash[:notice] = 'You do not have Admin rights to update a user'
     redirect_to home_index_path
   end
  end  
end
