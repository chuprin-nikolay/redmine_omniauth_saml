require 'redmine'

# Plugin generic informations
Redmine::Plugin.register :redmine_omniauth_cas do
  name 'Redmine Omniauth plugin'
  description 'This plugin adds Omniauth support to Redmine'
  author 'Jean-Baptiste BARTH'
  author_url 'mailto:jeanbaptiste.barth@gmail.com'
  url 'http://github.com/jbbarth/redmine_omniauth_cas'
  version '0.0.1'
end

# Hooks
require 'redmine_omniauth_cas/hooks'

# OmniAuth basics
require 'omniauth/core'
require 'omniauth/oauth'

# Patches to existing classes/modules
config.to_prepare do
  require_dependency 'redmine_omniauth_cas/account_controller_patch'
end

# PROVIDERS

# Sample CAS provider
require 'omniauth/enterprise'
config.middleware.use OmniAuth::Strategies::CAS, :cas_server => 'http://localhost:9292'
