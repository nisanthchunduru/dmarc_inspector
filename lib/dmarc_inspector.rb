$: << File.dirname(__FILE__) unless $:.include?(File.expand_path(File.dirname(__FILE__)))

require "dmarc_inspector/version"
require 'resolv'
require 'dmarc_inspector/dmarc/parser'

class DMARCInspector
  def initialize(domain)
    @domain = domain
  end

  def receiver_policy
    dmarc_subdomain = "_dmarc.#{@domain}"
    dns = Resolv::DNS.new
    dns_resource_data = dns.getresource(dmarc_subdomain, Resolv::DNS::Resource::IN::TXT).data

    record = DMARC::Parser.parse(dns_resource_data)
    record[:p]
  end
end
