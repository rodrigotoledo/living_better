class UsersController < ApplicationController
  before_action :set_user, only: %i[ edit update ]
  before_action :set_users

  # GET /users or /users.json
  def index
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    render :index
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_users
      @users = User.all
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :document, :cns, :email, :birthday_at, :phone, :status, :photo)
    end
end
