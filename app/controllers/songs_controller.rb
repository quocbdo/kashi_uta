class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        @song = Song.find(params[:id])
    end

    def new
        @song = Song.new
    end
    
    def create
        @song = Song.new(song_params)
        @song.user = current_user
        #need to save

        if @song.save
            redirect_to songs_path
        else
            render :new
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

        if @song.update_attributes(params.require(:song).permit(:artist, :genre, :lyrics))
            redirect_to songs_path
        else
            render :edit
        end
    end

private
    def song_params
        params.require(:song).permit(:song, :artist, :genre, :lyrics)
    end

end
