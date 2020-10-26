class SongsController < ApplicationController
    def index
        @songs = Song.all
        render json: @songs
    
    end

    def show
        @song = Song.find_by(id: params[:id])

        if @song.file.attached?
            render html: @song.get_blob_url
        elsif @song
            render json: @song
        end
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(name: params[:name], author: params[:author], file: params[:file])
        if params[:file]
            @song.file.attach(params[:file])
            @song.location = url_for(@song.file)
            @song.save
        end
        render json: @song
    end

    def edit
        @song = Song.find_by(id: params[:id])
    end

    def update
        @song = Song.update(song_params)
    end

    def destroy
        @song = Song.find_by(id: params[:id])
        @song.destroy!
        render json: @song
    end
        
    private

    def song_params
        params.require(:song).permit(:name, :author, :file, :location)
    end
    
end
