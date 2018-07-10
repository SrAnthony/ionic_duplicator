module ApplicationHelper
  def current_class?(path)
    request.path.include?(path) ? 'active' : ''
  end
end
