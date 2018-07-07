class PlatformsController < ApplicationController
  before_action :set_platform, only: [:show, :edit, :update, :destroy]

  def index
    @platforms = Platform.all
  end

  def show
  end

  def new
    app = {
      name: params['name'] || '',
      app_id: params['app_id'] || ''
    }
    @platform = Platform.new(app)
  end

  def edit
  end

  def create
    @platform = Platform.new(platform_params)

    respond_to do |format|
      if @platform.save
        FolderService.new(@platform).create_app_folder
        format.html { redirect_to @platform.app, notice: 'Platform was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @platform.update(platform_params)
        format.html { redirect_to @platform, notice: 'Platform was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @platform.destroy
    respond_to do |format|
      format.html { redirect_to platforms_url, notice: 'Platform was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_platform
      @platform = Platform.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def platform_params
      params.require(:platform).permit(:name, :package_id, :version, :app_id)
    end
end
