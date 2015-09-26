# mcollective-jboss-agent
MCollective JBoss Agent Plugin

Sometimes you want to perform specific actions on your JBoss installations that are not suitable for Puppet (i.e. you only want to execute it once or a task that can't be and/or is hard to be idempotent) OR you have a large cluster of standalone servers.

JBoss Agent plugin to the rescue! This agent allows you to restart, reload, deploy, read-resource in a group of standalone servers, :flush-all-connection-in-pool, gather information and almost anything you can do with JBoss-CLI, but in large scale and using awesome MCollective Architecture.

##Setting up JBoss Agent

This agent requires an operational (i.e. reachable) JBoss HTTP API (JBoss AS 7, JBoss EAP 6+, Wildfly 8/9/10) so makes sure that your host parameter points to jboss.bind.address.management

Alternatively you could add an entry to /etc/hosts that points to jboss.bind.address.management

##Agent Installation
Follow the basic [plugin install guide](http://projects.puppetlabs.com/projects/mcollective-plugins/wiki/InstalingPlugins)

TL;DR; Use `mco plugin package` to generate packages (RPM or DEB) specific for your platform.

##Usage
Check `jboss.ddl` for a richer description of the parameters.

###Deploy an artifact from Sonatype Nexus

`mco rpc jboss deploy name=hawtio.war username=jboss password=jboss host=127.0.0.1 port=9990 nexus_url=http://oss.sonatype.org group_id=io.hawt artifact_id=hawtio-web version=1.4.36 repository=releases packaging=war`

###Run a JBoss-CLI command

`mco rpc jboss cli command=:shutdown(restart=true) username=jboss password=jboss host=127.0.0.1 port=9990`

`mco rpc jboss cli command=:reload username=jboss password=jboss host=127.0.0.1 port=9990`

`mco rpc jboss cli command="/path=java.home:read-resource" username=jboss password=jboss host=127.0.0.1 port=9990`

`mco rpc jboss cli command="/subsystem=remoting:read-resource()" username=jboss password=jboss host=127.0.0.1 port=9990`

