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
    raise AppErrorService.new(@account.errors, :unprocessable_entity) unless @account.save

    render :show, status: :created, location: @account
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    raise AppErrorService.new(@account.errors, :unprocessable_entity) unless @account.update(account_params)

    render :show, status: :ok, location: @account
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find_by!(id: params[:id], user_id: @current_user.id)
  rescue ActiveRecord::RecordNotFound => e
    raise AppErrorService.new(e.message, :not_found)
  end

  # Only allow a list of trusted parameters through.
  def account_params
    params.require(:account).permit(:name, :initial_value, :active)
  end
end
