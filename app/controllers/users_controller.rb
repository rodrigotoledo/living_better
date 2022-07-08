# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update]
  before_action :set_users

  # GET /users or /users.json
  def index
    @user = User.new
    @user.build_address
    @users = @users.search(params[:term]) if params[:term].present?
  end

  # GET /users/1/edit
  def edit
    render :index
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_url, notice: I18n.t('flash.success')
    else
      flash.now[:alert] = I18n.t('flash.alert')
      render :index, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user.update(user_params)
      redirect_to users_url, notice: I18n.t('flash.success')
    else
      flash.now[:alert] = I18n.t('flash.alert')
      render :index, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def set_users
    @users = User.order(created_at: :desc)
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :document, :cns, :email,
                                 :birthday_at, :phone, :status, :photo,
                                 address_attributes: %i[id zipcode street street_complement neighborhood city state ibge])
  end
end
