metadata :name        => 'JBoss',
         :description => 'JBoss Management Service for MCollective',
         :author      => 'Jairo Junior',
         :license     => 'GPLv2',
         :version     => '0.1',
         :url         => 'http://github.com/jairojunior/mcollective-jboss',
         :timeout     => 240
 
action 'deploy', :description => 'Deploys an artifact from Nexus to JBoss' do
     display :always

     input :name,
           :prompt      => 'Name',
           :description => 'Deployment name. (e.g. myapp.war, app.ear)',
           :type        => :string,
           :validation  => '.*',
           :optional    => false,
           :maxlength   => 512

     input :server_group,
           :prompt      => 'Server Group',
           :description => 'Target server group for deployment. (e.g. main-server-group, other-server-group)',
           :type        => :string,
           :validation  => '.*',
           :optional    => true,
           :maxlength   => 512

     input :username,
           :prompt      => 'Username',
           :description => 'JBoss Management User',
           :type        => :string,
           :validation  => '.*',
           :optional    => false,
           :maxlength   => 512

     input :password,
           :prompt      => 'Password',
           :description => 'JBoss Management User Passsword',
           :type        => :string,
           :validation  => '.*',
           :optional    => false,
           :maxlength   => 512

     input :host,
           :prompt      => 'Host name',
           :description => 'JBoss Management Interface Bind Address',
           :type        => :string,
           :validation  => '.*',
           :optional    => false,
           :maxlength   => 512

     input :port,
           :prompt      => 'Port',
           :description => 'JBoss Management Port',
           :type        => :integer,
           :optional    => false,
           :default     => 9990

     input :nexus_url,
           :prompt      => 'Nexus URL',
           :description => 'Nexus URL',
           :type        => :string,
           :validation  => '.*',
           :optional    => false,
           :maxlength   => 512

     input :group_id,
           :prompt      => 'Group ID',
           :description => 'Artifact Group ID',
           :type        => :string,
           :validation  => '.*',
           :optional    => false,
           :maxlength   => 512

     input :artifact_id,
           :prompt      => 'Artifact ID',
           :description => 'Artifact ID',
           :type        => :string,
           :validation  => '.*',
           :optional    => false,
           :maxlength   => 512

     input :version,
           :prompt      => 'Version',
           :description => 'Artifact Version',
           :type        => :string,
           :validation  => '.*',
           :optional    => false,
           :maxlength   => 512
	 
     input :repository,
           :prompt      => 'Repository',
           :description => 'Artifact Repository',
           :type        => :string,
           :validation  => '.*',
           :optional    => false,
           :maxlength   => 512

     input :packaging,
           :prompt      => 'Packaging',
           :description => 'Artifact Packaging (e.g. war, ear, jar)',
           :type        => :string,
           :validation  => '.*',
           :optional    => false,
           :maxlength   => 512

     input :classifier,
           :prompt      => 'Classifier',
           :description => 'Artifact Classifier',
           :type        => :string,
           :validation  => '.*',
           :optional    => true,
           :maxlength   => 512

     input :extension,
           :prompt      => 'Extension',
           :description => 'Artifact Extension',
           :type        => :string,
           :validation  => '.*',
           :optional    => true,
           :maxlength   => 512
 
     output :message,
            :description => 'Message',
            :display_as  => 'Response Message',
            :default     => 'Nothing to do...'
end

action 'cli', :description => 'Executes a JBoss-CLI command using JBoss HTTP API' do
     display :always

     input :command,
           :prompt      => 'Command',
           :description => 'JBoss-CLI compliant command',
           :type        => :string,
           :validation  => '.*',
           :optional    => false,
           :maxlength   => 512

     input :username,
           :prompt      => 'Username',
           :description => 'JBoss Management User',
           :type        => :string,
           :validation  => '.*',
           :optional    => false,
           :maxlength   => 512

     input :password,
           :prompt      => 'Password',
           :description => 'JBoss Management User Passsword',
           :type        => :string,
           :validation  => '.*',
           :optional    => false,
           :maxlength   => 512

     input :host,
           :prompt      => 'Host name',
           :description => 'JBoss Management Interface Bind Address',
           :type        => :string,
           :validation  => '.*',
           :optional    => false,
           :maxlength   => 512

     input :port,
           :prompt      => 'Port',
           :description => 'JBoss Management Port',
           :type        => :integer,
           :optional    => false,
           :default     => 9990

     output :message,
            :description => 'Message',
            :display_as  => 'Response Message',
            :default     => ''

end