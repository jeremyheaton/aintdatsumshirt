require 'digest/sha1'
class PhotosController < ApplicationController
  before_action :set_photo, only: [:show]
  before_filter :authenticate_user!, except: [:index, :show]
  
  def index
    @photos = Photo.order("created_at desc")
  end

  def show
    
  end
  def new
    @photo = Photo.new()
  
    render view_for_new
  end

  def create
    logger.debug params
    @photo = Photo.new(params[:photo])
    @photo.user_id = current_user.id
    # In through-the-server mode, the image is first uploaded to the Rails server.
    # When @photo is saved, Carrierwave uploads the image to Cloudinary.
    # The upload metadata (e.g. image size) is then available in the
    # uploader object of the model (@photo.image).
    # In direct mode, the image is uploaded to Cloudinary by the browser,
    # and upload metadata is available in JavaScript (see new_direct.html.erb).
    if !@photo.save
      @error = @photo.errors.full_messages.join('. ')
      render view_for_new
      return
    end
  end

  protected
  
  def direct_upload_mode?
    params[:direct].present?
  end
  
  def unsigned_mode?
    params[:unsigned].present?
  end
  
  def view_for_new
   "new_direct"
  end
  def set_photo
      @photo = Photo.find(params[:id])
    end

end