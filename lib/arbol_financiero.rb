require "arbol_financiero/version"
require "arbol_financiero/score_table"
require "arbol_financiero/mixins/find"
require "arbol_financiero/mixins/where"
require "arbol_financiero/mixins/update"
require "arbol_financiero/links"
require "arbol_financiero/list"
require "arbol_financiero/resource"
require "arbol_financiero/folio"
require "arbol_financiero/applicant"
require "arbol_financiero/credit_report"
require "arbol_financiero/address"
require "arbol_financiero/employment_record"
require "arbol_financiero/family_data"
require "arbol_financiero/financial_data"
require "arbol_financiero/personal_data"
require "arbol_financiero/personal_reference"
require "arbol_financiero/previous_studies"
require "arbol_financiero/user"
require "arbol_financiero/financier_user"
require "arbol_financiero/score"
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
      @api_base = 'http://www.arbolfinanciero.com/api'
      @api_version = 'v1'
      @connection = Faraday.new
      @api_key = nil
      @secret_key = nil
    end
  end
end
