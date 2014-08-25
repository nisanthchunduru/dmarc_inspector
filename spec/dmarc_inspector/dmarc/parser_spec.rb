require 'dmarc_inspector/dmarc/parser'

describe DMARCInspector::DMARC::Parser do
  describe '#dmarc_record' do
    subject { described_class.new.dmarc_record }

    it 'parses version' do
      record = 'v=DMARC1; p=reject; sp=none; pct=100; rua=mailto:dmarc-yahoo-rua@yahoo-inc.com, mailto:dmarc_y_rua@yahoo.com;'
      expect(subject.parse record).to include(v: 'DMARC1')
    end

    it 'parses policy' do
      record = 'v=DMARC1; p=none; rua=mailto:mailauth-reports@google.com'
      expect(subject.parse record).to include(p: 'none')
    end

    it 'ignores spacing' do
      record1 = 'v=DMARC1; p=reject; sp=none; pct=100; rua=mailto:dmarc-yahoo-rua@yahoo-inc.com, mailto:dmarc_y_rua@yahoo.com;'
      record2 = 'v=DMARC1;p=reject;sp=none;pct=100;rua=mailto:dmarc-yahoo-rua@yahoo-inc.com, mailto:dmarc_y_rua@yahoo.com;'
      expect(subject.parse record1).to include(subject.parse record2)
    end

    it 'ignores trailing separator' do
      record1 = 'v=DMARC1; p=none;'
      record2 = 'v=DMARC1; p=none'
      expect(subject.parse record1).to eq(v: 'DMARC1', p: 'none')
      expect(subject.parse record1).to include(subject.parse record2)
    end

    it 'ignores remaining tags' do
      record = 'v=DMARC1; p=reject; sp=none; pct=100; rua=mailto:dmarc-yahoo-rua@yahoo-inc.com, mailto:dmarc_y_rua@yahoo.com;'
      expect(subject.parse record).to eq(v: 'DMARC1', p: 'reject')
    end
  end

  describe '#dmarc_request' do
    subject { described_class.new.dmarc_request }

    it "parses policy 'none'" do
      expect(subject.parse 'p=none').to eq(p: 'none')
    end

    it "parses policy 'reject'" do
      expect(subject.parse 'p=reject').to eq(p: 'reject')
    end

    it "parses policy 'quarantine'" do
      expect(subject.parse 'p=quarantine').to eq(p: 'quarantine')
    end

    it 'ignores spacing' do
      expect(subject.parse 'p  =  reject').to eq(p: 'reject')
    end
  end
end
