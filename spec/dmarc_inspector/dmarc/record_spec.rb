require 'dmarc_inspector/dmarc/record'

describe DMARCInspector::DMARC::Record do
  describe '.parse' do
    it 'parses a dmarc record' do
      data = 'v=DMARC1; p=reject; sp=none; pct=100; rua=mailto:dmarc-yahoo-rua@yahoo-inc.com, mailto:dmarc_y_rua@yahoo.com;'
      record = DMARCInspector::DMARC::Record.parse(data)
      expect(record[:p]).to eq(:reject)
    end

    context "receiver policy is 'none'" do
      it 'returns :none' do
        data = 'v=DMARC1; p=none; rua=mailto:mailauth-reports@google.com'
        record = DMARCInspector::DMARC::Record.parse(data)
        expect(record[:p]).to eq(:none)
      end
    end

    context "receiver policy is 'quarantine'" do
      it 'returns :none' do
        data = 'v=DMARC1; p=quarantine; rua=mailto:mailauth-reports@google.com'
        record = DMARCInspector::DMARC::Record.parse(data)
        expect(record[:p]).to eq(:quarantine)
      end
    end

    context 'invalid record' do
      it 'throws an error' do
        data = 'v=spf1 redirect=_spf.mail.yahoo.com'
        expect { DMARCInspector::DMARC::Record.parse(data) }.to raise_error(DMARCInspector::DMARC::InvalidRecord)
      end
    end
  end
end
