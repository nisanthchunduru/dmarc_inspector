require 'hashie'

class DMARCInspector
  module DMARC
    class Record < Hash
      include Hashie::Extensions::IndifferentAccess
    end
  end
end
