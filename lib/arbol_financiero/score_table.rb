# frozen_string_literal: true

module ArbolFinanciero
  class ScoreTable
    attr_reader :final_score, :final_score_text, :alerts, :variables,
                :variable_metadata

    def initialize(options = {})
      @final_score = options.fetch(:final_score)
      @final_score_text = options.fetch(:final_score_text)
      @alerts = options.fetch(:alerts)
      @variables = options.fetch(:variables)
      @variable_metadata = options.fetch(:variable_metadata)
      validate_params
    end

    def to_hash
      {
        data: {
          final_score: final_score,
          final_score_text: final_score_text,
          alerts: alerts,
          variables: variables,
          variable_metadata: variable_metadata
        }
      }
    end

    def to_json
      to_hash.to_json
    end

    private

    def validate_params
      raise ArgumentError, "final score should be a Integer" unless final_score.is_a?(Integer)
      raise ArgumentError, "final score text should be a String" unless final_score_text.is_a?(String)
      raise ArgumentError, "alerts should be a String" unless alerts.is_a?(Array)
      raise ArgumentError, "variables should be a String" unless variables.is_a?(Hash)
      raise ArgumentError, "variable_metadata should be a String" unless variable_metadata.is_a?(Array)
    end
  end
end
