class FolderService
  include Rails.application.routes.url_helpers

  def initialize(platform, host)
    @host = host
    @platform = platform
    @app = platform.app
    @recipe_path = 'ionic/recipe/'
    @app_path = "ionic/#{@platform.name}/#{@app.name}/"

    create_app_folder
  end

  def app_gsub!(text)
    text.gsub!('<<app_version>>', @platform.version)
        .gsub!('<<app_name>>', @app.name)
        .gsub!('<<app_id>>', @platform.package_id)
    text
  end

  def create_app_folder
    file_names = [@app_path + 'config.xml']

    # Copia app receita para android/app.name
    FileUtils.copy_entry @recipe_path, @app_path

    file_names.each do |file_name|
      replace = app_gsub!(File.read(file_name))

      # Escreve as mudanças no arquivo
      File.open(file_name, "w") {|file| file.puts replace }
    end

  end

  def copy_images
    icon_url = @host + rails_blob_path(@platform.icon, only_path: true)
    splash_url = @host + rails_blob_path(@platform.splash, only_path: true)
    logo_url = @host + rails_blob_path(@platform.logo, only_path: true)

    puts '====================================='
    puts "FROM: #{icon_url}, TO: #{@app_path.gsub(' ', '\ ')}"
    puts '====================================='
    a = `wget #{icon_url} -P #{@app_path.gsub(' ', '\ ')}`
    a = `wget #{splash_url} -P #{@app_path.gsub(' ', '\ ')}`
    a = `wget #{logo_url} -P #{@app_path.gsub(' ', '\ ')}`
  end
end
