class SongsController < ApplicationController
    before_action :authorize, except: [:index, :show]

    def index
        if params[:artist]
            @artist = params[:artist]
            @songs = Song.where(artist: @artist)
        else
            @artist = nil
            @songs = Song.all
        end
    end

    def show
        @song = Song.find(params[:id])
    end

    def new
        @song = Song.new
    end
    
    def create
        @song = Song.new(song_params)
        @song.user_id = current_user.id

        if @song.save
            redirect_to songs_path
        else
            render :root
        end
    end

    def destroy
        @song = Song.find(params[:id])
        @song.destroy
        redirect_to songs_path
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])

        if @song.update_attributes(song_params)
            redirect_to songs_path
        else
            render :edit
        end
    end

    def artists
        @artists = Song.distinct(:artist).pluck(:artist)
    end

private

    def song_params
        params.require(:song).permit(:title, :artist, :genre, :lyrics)
    end

end
