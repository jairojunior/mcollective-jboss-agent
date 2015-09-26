module MCollective
  module Agent
    class Jboss < RPC::Agent
      activate_when do
        begin
          require 'mcollective/util/jboss/cli'
          require 'mcollective/util/nexus'

          true
        rescue LoadError => error
          Log.warn('Cannot load Jboss_agent plugin.')
          false
        end
      end

      action 'deploy' do
        cli = Util::Jboss::Cli.new(request[:host], request[:port], request[:username], request[:password], 240)

        nexus = Util::Nexus.new

        should = nexus.sha1sum(request[:nexus_url], request[:group_id], request[:artifact_id], request[:version], request[:repository], request[:packaging], request[:classifier], request[:extension])
        is = deployment_checksum(request[:name], cli)

        source = nexus.retrieve(request[:name], request[:nexus_url], request[:group_id], request[:artifact_id], request[:version], request[:repository], request[:packaging], request[:classifier], request[:extension])

        if is.nil?
          reply[:message] = cli.deploy(request[:name], source, request[:server_group])
        elsif should != is
          reply[:message] = cli.update_deploy(request[:name], source, request[:server_group])
        end
      end

      action 'cli' do
        cli = Util::Jboss::Cli.new(request[:host], request[:port], request[:username], request[:password], 240)

        reply[:message] = cli.exec(request[:command])
      end

      def deployment_checksum(name, cli)
        response = cli.read("/deployment=#{name}")
        bytes_value = response['content'].first['hash']['BYTES_VALUE']
        decoded = Base64.decode64(bytes_value)

        decoded.unpack('H*').first

      rescue
        nil
      end
    end
  end
end
