require 'dmarc_inspector/dmarc/record'

class DMARCInspector
  module DMARC
    class Parser
      def self.parse(raw)
        new(raw).parse
      end

      def initialize(raw)
        @raw = raw
      end

      # Naive parser
      # Borrowed from https://pypi.python.org/pypi/gs.dmarc/2.1.1 
      def parse
        record = @raw.strip.split(';')
        record = record.map { |pair| pair.strip.split('=') }
        record = record.map { |(tag, value)| [tag.strip, value.strip] }
        # TODO: Symbols aren't garbage collected, don't dynamically create
        # symbols from unknown strings
        record = Record[record]
        record[:p] = record[:p].to_sym if ['none', 'reject', 'quarantine'].include?(record[:p]) 

        record
      end
    end
  end
end
