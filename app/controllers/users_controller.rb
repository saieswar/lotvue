require 'carrierwave/orm/activerecord'
require "mini_magick"
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
   # @users = User.all
   
  end

  def user_ajax
    @users = User.all

#raise @users.inspect
     if params[:role].present? 
       @users = Role.find_by(id: params[:role]).users   
    end
     if params[:order].present? 
       @users = params[:order] == "DESC" ? @users.order(created_at: :desc) : @users
     end
    @users = @users.paginate(:page => params[:page], :per_page => 5)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
      format.js
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new

  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create

    @user = User.new(first_name: params[:user][:first_name], last_name: params[:user][:last_name], email: params[:user][:email])

    respond_to do |format|
      if @user.save
        params[:avatars].each do|file|
          # image = MiniMagick::Image.open(file)
           @user.images.create(avatar: file)
        end
        params[:roles].each do|role|
          @user.user_roles.create(role_id: Role.find_by(id: role.to_i).id)
        end
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def user_params
    #   params.fetch(:user, {})
    # end
end
