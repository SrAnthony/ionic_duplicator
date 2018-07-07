class AppsController < ApplicationController
  before_action :set_app, only: [:show, :edit, :update, :destroy, :create_app]

  def index
    @apps = App.all
  end

  def show
  end

  def new
    @app = App.new
  end

  def edit
  end

  def create
    @app = App.new(app_params)

    respond_to do |format|
      if @app.save
        format.html { redirect_to @app, notice: 'App was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @app.update(app_params)
        format.html { redirect_to @app, notice: 'App was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @app.destroy
    respond_to do |format|
      format.html { redirect_to apps_url, notice: 'App was successfully destroyed.' }
    end
  end

  def app_gsub!(text)
    text.gsub!('<<app_version>>', @app.version)
        .gsub!('<<app_name>>', @app.name)
    text.gsub!('<<app_id>>', @app.id_android) if @platform == 'android'
    text.gsub!('<<app_id>>', @app.id_ios)     if @platform == 'ios'
    text
  end

  def create_app
    @platform = params['platform'] # android || ios
    recipe_path = 'ionic/recipe/'
    app_path = "ionic/#{@platform}/#{@app.name}/"
    file_names = [app_path + 'config.xml']

    # Copia app receita para android/app.name
    FileUtils.copy_entry recipe_path, app_path

    file_names.each do |file_name|
      replace = app_gsub!(File.read(file_name))

      # Escreve as mudanças no arquivo
      File.open(file_name, "w") {|file| file.puts replace }
    end

    @result = "App #{@app.name} for #{@platform} created successfully!"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app
      @app = App.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_params
      params.require(:app).permit(:name, :id_android, :id_ios, :version, :color_primary, :color_secondary)
    end
end
