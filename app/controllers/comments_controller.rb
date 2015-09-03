class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:create]
  respond_to :js, :json, :html
  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.new(comment_params)
    @comment.user = current_user

   
      if @comment.save
        render :partial => "comments/comment",  :comment => @comment , :layout => false, :status => :created
  
      # format.js
      # format.html { redirect_to @photo, notice: 'Comment was successfully created.' }
      # format.json { render json: @comment, status: :created, location: @comment }

      else
        format.html { render action: "new" }
       

    
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:link_id, :body, :user_id)
  end
end