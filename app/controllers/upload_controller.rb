class UploadController < ApplicationController
    def upload
        file = params[:pic]
        uploader = AvatarUploader.new
        uploader.store!(file)
        redirect_to '/'
    end
end
