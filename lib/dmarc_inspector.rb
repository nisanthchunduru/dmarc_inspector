$: << File.dirname(__FILE__) unless $:.include?(File.expand_path(File.dirname(__FILE__)))

require "dmarc_inspector/version"

class DMARCInspector
  def receiver_policy
    :none
  end
end
