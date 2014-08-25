require 'parslet'

class DMARCInspector
  module DMARC
    # Borrowed from 'dmarc' gem
    class Parser < Parslet::Parser
      def self.parse(raw)
        new.parse(raw)
      end

      def tag_value_pair(tag_definition, value_definition)
        tag_definition >>
        wsp? >> str('=') >> wsp? >>
        value_definition
      end

      root(:dmarc_record)
      rule(:dmarc_record) do
        dmarc_version >>
        dmarc_sep >> dmarc_request >>
        # Not bothering about other tags, just need policy tag for now
        any.repeat
      end

      rule(:dmarc_version) do
        tag_value_pair(
          str('v'),
          str('DMARC1').as(:v)
        )
      end

      rule(:dmarc_sep) { wsp? >> str(';') >> wsp? }

      rule(:dmarc_request) do
        tag_value_pair(
          str('p'),
          (
            str('none') |
            str('quarantine') |
            str('reject')
          ).as(:p)
        ) 
      end

      rule(:wsp) { str(' ') | str("\t") }
      rule(:wsp?) { wsp.repeat }
    end
  end
end
