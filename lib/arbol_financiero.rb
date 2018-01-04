require "arbol_financiero/version"
require "arbol_financiero/mixins/find"
require "arbol_financiero/links"
require "arbol_financiero/list"
require "arbol_financiero/resource"
require "arbol_financiero/folio"
require "arbol_financiero/credit_reports"
require "arbol_financiero/utils"
require "arbol_financiero/requestor"

module ArbolFinanciero
  require 'active_support'
  require 'active_support/core_ext'

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    require "faraday"
    attr_accessor :api_base, :api_version, :connection, :api_key, :secret_key

    def initialize
      @api_base = 'https://solicitud.laudex.mx/api'
      @api_version = 'v1'
      @connection = Faraday.new
      @api_key = nil
      @secret_key = nil
    end
  end
end