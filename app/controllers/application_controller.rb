class ApplicationController < ActionController::Base
  before_action :apps

  # Cria lista de todos os apps para usar no input de pesquisa
  def apps
    apps_search = []
    App.all.each do |app|
      apps_search << {
        title: app.name,
        description: app.package_id,
        url: app_path(id: app.id)
      }
    end
    gon.apps = apps_search
  end
end
