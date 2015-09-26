module MCollective
  module Util
    class Nexus
      require 'uri'
      require 'net/http'

      SERVICE_RELATIVE_URL = 'service/local/artifact/maven/content'

      def retrieve(name, nexus_url, group_id, artifact_id, version, repository, packaging, classifier, extension)
        `wget '#{retrieve_url(nexus_url, group_id, artifact_id, version, repository, packaging, classifier, extension)}' -O /tmp/#{name}`
        "/tmp/#{name}"
      end

      def sha1sum(nexus_url, group_id, artifact_id, version, repository, packaging, classifier, extension)
        url = retrieve_url(nexus_url, group_id, artifact_id, version, repository, packaging, classifier, extension)

        checksum_uri = URI(url.gsub("p=#{packaging}", "p=#{packaging}.sha1"))
        Log.info("Nexus Download URL: #{checksum_uri}")
        Net::HTTP.get(checksum_uri)
      end

      def retrieve_url(nexus_url, group_id, artifact_id, version, repository, packaging, classifier, extension)
        params = {
          'g' => group_id,
          'a' => artifact_id,
          'v' => version,
          'r' => repository,
          'p' => packaging,
          'c' => classifier,
          'e' => extension
        }

        query_string = params.delete_if { |_k, v| v.nil? || v.empty? }.to_a.map { |x| "#{x[0]}=#{x[1]}" }.join('&')

        "#{nexus_url}/#{SERVICE_RELATIVE_URL}?#{query_string}"
      end
    end
  end
end
