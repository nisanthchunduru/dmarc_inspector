require 'resolv'
require 'dmarc_inspector/dmarc/record'

class DMARCInspector
  def initialize(domain)
    @domain = domain
  end

  def receiver_policy
    dmarc_subdomain = "_dmarc.#{@domain}"
    dns = Resolv::DNS.new
    dns_resource_data = dns.getresource(dmarc_subdomain, Resolv::DNS::Resource::IN::TXT).data

    record = DMARC::Record.parse(dns_resource_data)
    record[:p]
  rescue
    :none
  end
end
