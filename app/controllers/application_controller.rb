class ApplicationController < ActionController::Base


  if ENV['BASIC_AUTH']
    user, pass = ENV['BASIC_AUTH'].split(':')
    http_basic_authenticate_with name: user, password: pass
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Devise, require authenticate by default
  before_filter :authenticate_user!

  before_action :set_root_meta
  # CanCan, check authorization unless authorizing with devise
  check_authorization unless: :skip_check_authorization?

  # Special handling for ajax requests.
  # Must appear before other rescue_from statements.
  rescue_from Exception, with: :handle_uncaught_exception

  include CommonHelper
  include ErrorReportingConcern
  include AuthorizationErrorsConcern

  def set_root_meta
    set_meta_tags title: 'MVMT - A curated list of studios and schools for people who move - Movement, Gymnastics, Circus, Parkour, Free Running, Dance, Crossfit'
    set_meta_tags canonical: url_for()
    set_meta_tags description: 'Discover yourself through movement.'
    set_meta_tags keywords: ['London Movement', 'London Gymnastics', 'London Circus', 'London Parkour', 'London Free Running', 'London Dance', 'London Crossfit']

    set_meta_tags og: {
                      title:    'MVMT - A curated list of studios and schools for people who move - Movement, Gymnastics, Circus, Parkour, Free Running, Dance, Crossfit',
                      description: 'Discover yourself through movement.',
                      locale: 'en_GB',
                      type: 'website',
                      url: url_for(),
                      image: root_url + 'mvmt-logo.png',
                  }

  end

  protected



  def skip_check_authorization?
    devise_controller? || is_a?(RailsAdmin::ApplicationController)
  end

  # Reset response so redirect or render can be called again.
  # This is an undocumented hack but it works.
  def reset_response
    self.instance_variable_set(:@_response_body, nil)
  end

  # Respond to uncaught exceptions with friendly error message during ajax requets
  def handle_uncaught_exception(exception)
    if request.format == :js
      report_error(exception)
      flash.now[:error] = Rails.env.development? ? exception.message : I18n.t('errors.unknown')
      render 'layouts/uncaught_error.js'
    else
      raise
    end
  end
end
