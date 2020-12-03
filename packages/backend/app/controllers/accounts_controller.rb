# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :authenticate_request!
  before_action :set_account, only: %i[show update destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.where(user_id: @current_user.id)
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show; end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params.merge({ user_id: @current_user.id }))

    if @account.save
      render :show, status: :created, location: user_account_url(@current_user.id, @account)
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    if @account.update(account_params)
      render :show, status: :ok, location: user_account_url(@current_user.id, @account)
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find_by(id: params[:id], user_id: @current_user[:id]) if @current_user.present?
  end

  # Only allow a list of trusted parameters through.
  def account_params
    params.require(:account).permit(:name, :initial_value, :active)
  end
end
