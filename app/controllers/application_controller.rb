class ApplicationController < ActionController::API
  before_action :authorize!

  private

  def current_user
    user_id = JwtAuthenticationService.decode_token(request)
    @user = User.find_by(id: user_id)
  end

  def logged_in?
    # Archived users can't log in
    !!current_user && !current_user.archived
  end

  def authorize!
    return true if logged_in?
    render json: { message: current_user.archived ? I18n.t('errors.user.disabled') : I18n.t(:login) }, status: :unauthorized
  end

  def render_jsonapi_internal_server_error(exception)
    puts(exception)
    super(exception)
  end
end
