require 'dmarc_inspector/dmarc/parser'

describe DMARCInspector::DMARC::Parser do
  describe '.parse' do
    it 'parses a dmarc record' do
      data = 'v=DMARC1; p=reject; sp=none; pct=100; rua=mailto:dmarc-yahoo-rua@yahoo-inc.com, mailto:dmarc_y_rua@yahoo.com;'
      record = DMARCInspector::DMARC::Parser.parse(data)
      expect(record[:p]).to eq(:reject)
    end
  end
end
