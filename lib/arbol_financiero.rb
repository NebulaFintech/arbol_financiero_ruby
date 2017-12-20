require "arbol_financiero/version"
require "arbol_financiero/mixins/find"
require "arbol_financiero/links"
require "arbol_financiero/list"
require "arbol_financiero/resource"
require "arbol_financiero/folio"
require "arbol_financiero/utils"
require "arbol_financiero/requestor"

module ArbolFinanciero
  require 'active_support'
  require 'active_support/core_ext'
  require "faraday"
  @api_base = 'https://solicitud.laudex.mx/api'
  @api_version = 'v1'
  @connection = Faraday.new
  @api_key = nil

  def self.api_base
    @api_base
  end

  def self.api_base=(api_base)
    @api_base = api_base
  end

  def self.api_version
    @api_version
  end

  def self.api_version=(api_version)
    @api_version = api_version
  end

  def self.api_key
    @api_key
  end

  def self.api_key=(api_key)
    @api_key = api_key
  end

  def self.connection
    @connection
  end
end