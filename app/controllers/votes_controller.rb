class VotesController < ApplicationController
  before_filter :authenticate_user!, only: [:create]
  def create

    @photo = Photo.find(params[:vote][:photo_id])
    @vote = @photo.votes.new(photo_params)
    @vote.user = current_user
    @voted = Vote.where(:user_id=>@vote.user.id).where(:photo_id=>params[:vote][:photo_id])
    if  @voted.empty?
      if @vote.save
        respond_to do |format|
          format.json { render json: @vote, status: :created}
        end
      else
        respond_to do |format|
          format.json { render  json: @vote, status: :created}
        end
      end
    else
      @voted[0].destroy
      respond_to do |format|
        format.json { render  json: @vote, status: :created}
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
 

  private

  # Use callbacks to share common setup or constraints between actions.

  # Never trust parameters from the scary internet, only allow the white list through.
  def photo_params
    params.require(:vote).permit(:photo_id)
  end
end