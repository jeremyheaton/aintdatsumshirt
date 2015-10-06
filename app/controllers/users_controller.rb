require 'digest/sha1'

class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def show

  end

  protected

  def set_user
    @user = User.find(params[:id])
  end

end