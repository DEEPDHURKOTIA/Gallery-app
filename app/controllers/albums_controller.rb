class AlbumsController < ApplicationController
  before_action :authenticate_user!
  def index
    @albums = current_user.albums
    @q=@albums.ransack(params[:q])
    @albums=@q.result
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = current_user.albums.new(album_params)

    if @album.save
      NewPublishMailer.publish_mail(current_user.email).deliver_now if @album.publish?
      redirect_to @album
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_to @album
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to root_path, status: :see_other
  end

  def purge
    album = Album.find_by(id: params[:album_id])
    attachment=ActiveStorage::Attachment.find(params[:attachment_id])
    attachment.purge
    redirect_to album_path(album) ,notice: "Images Deleted"
  end

  private
    def album_params
      params.require(:album).permit(:title, :desc, :all_tags ,:publish, :cover_image, images: [])
    end

end
