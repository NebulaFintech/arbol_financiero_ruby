module ArbolFinanciero
  class Signature
    attr_reader :signature, :fallback_signature

    def initialize(api_key, secret_key)
      @signature = generate_signature(api_key, secret_key)
      @fallback_signature = generate_signature(api_key, secret_key, offset: 1)
    end

    def ==(raw_signature)
      signature == raw_signature || fallback_signature == raw_signature
    end

    private

      def generate_signature(api_key, secret_key, offset: 0)
        digest = OpenSSL::Digest.new "sha1"

        timestamp = Time.now.to_i
        timestamp = timestamp.to_s.slice 0, 9
        timestamp = timestamp.to_i - offset
        raw_signature = "#{api_key}#{timestamp}"

        OpenSSL::HMAC.hexdigest digest, secret_key, raw_signature
      end
  end
end