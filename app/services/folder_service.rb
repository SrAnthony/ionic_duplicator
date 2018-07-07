class FolderService
  def initialize(platform)
    @platform = platform
    @app = platform.app
  end

  def app_gsub!(text)
    text.gsub!('<<app_version>>', @platform.version)
        .gsub!('<<app_name>>', @app.name)
        .gsub!('<<app_id>>', @platform.package_id)
    text
  end

  def create_app_folder
    recipe_path = 'ionic/recipe/'
    app_path = "ionic/#{@platform.name}/#{@app.name}/"
    file_names = [app_path + 'config.xml']

    # Copia app receita para android/app.name
    FileUtils.copy_entry recipe_path, app_path

    file_names.each do |file_name|
      replace = app_gsub!(File.read(file_name))

      # Escreve as mudanças no arquivo
      File.open(file_name, "w") {|file| file.puts replace }
    end

    @result = "App #{@app.name} for #{@platform.name} created successfully!"
  end
end
