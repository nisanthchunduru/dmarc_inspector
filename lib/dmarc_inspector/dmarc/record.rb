require 'dmarc_inspector/dmarc/parser'
require 'dmarc_inspector/dmarc/errors'

class DMARCInspector
  module DMARC
    class Record
      def self.parse(raw)
        begin
          tree = Parser.parse(raw)
        rescue Parslet::ParseFailed
          raise InvalidRecord
        end

        tree[:p] = tree[:p].to_sym
        tree
      end
    end
  end
end
