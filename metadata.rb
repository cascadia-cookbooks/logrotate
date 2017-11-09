name 'cas_logrotate'
maintainer 'Cascadia Cookbooks'
maintainer_email 'null'
license 'GPL-3.0'
description 'Manges logrotate daemon and configuration'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

source_url 'https://github.com/cascadia-cookbooks/logrotate'
issues_url 'https://github.com/cascadia-cookbooks/logrotate/issues'

supports 'ubuntu', '>=16.04'
supports 'rhel', '>=7'
supports 'centos', '>=7'
supports 'debian', '>=8'
